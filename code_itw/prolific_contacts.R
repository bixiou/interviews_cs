ig <- read_csv(paste0("../hidden/prolific_contacts_IT_GB.csv"), guess_max = Inf)
for (v in names(ig)) label(ig[[v]]) <- paste0(v, ": ", ig[1,v])
fr <- read_csv(paste0("../hidden/prolific_contacts_FR.csv"), guess_max = Inf)
e <- merge(ig[3:nrow(ig),], fr[7:nrow(fr),], all = T)

votes_xlsx <- read.xlsx("../survey/source.xlsx", sheet = "Elections", cols = 1:6)
# votes <- list()
# for (c in unique(votes_xlsx$country)) votes[[c]] <- votes_xlsx[votes_xlsx$country == c, ]  
# for (c in unique(votes_xlsx$country)) row.names(votes[[c]]) <- votes[[c]]$party
votes_xlsx <- setNames(votes_xlsx$leaning, votes_xlsx$party)

rename_survey <- function(e) {
  names(e) <- c(
    "date",
    "date_end",
    "status_response", # 
    "ip",
    "progress",
    "duration",
    "finished",
    "date_recorded", 
    "id_qualtrics",
    "name",
    "firstname",
    "mmail",
    "ref",
    "latitude",
    "longitude",
    "distr",
    "lang", 
    "mail",
    "gender",
    "hidden_country",
    "age_exact",
    "hh_size",
    "Nb_children__14",
    "income",
    "education",
    "zipcode",
    "voted",
    "vote_FR",
    "vote_US",
    "vote_GB",
    "vote_IT",
    "gcs_support",
    "gcs_comprehension",
    "excluded", 
    "Q_TotalDuration", 
    "PROLIFIC_PID",
    "STUDY_ID",
    "SESSION_ID",
    "country",
    "ip_country",
    "ip_region",
    "ip_city",
    "ip_zipcode"
  ) 
  return(e)  
}

create_item <- function(var, new_var = var, labels, df, grep = FALSE, keep_original = FALSE, missing.values = NA, values = names(labels), annotation = NULL) {
  # Creates a memisc item s.t. var %in% values[[i]] will yield value/label labels[i]/names(labels)[i]
  # var: a character or vector of characters
  # labels: a named numeric vector
  # missing.values: a numeric or character vector
  # values: a vector of characters or a list of such vectors
  if (length(var) > 1) { 
    for (v in 1:length(var)) df <- create_item(var[v], new_var = new_var[v], df = df, labels = labels, grep = grep, missing.values = missing.values, values = values, annotation = NULL)
  } else { if (var %in% names(df)) {
    # print(var)
    if (keep_original) df[[paste0(var, "_original")]] <- df[[var]]
    temp <- NA
    for (i in seq(labels)) temp[if (grep) grepl(values[[i]], df[[var]]) else df[[var]] %in% values[[i]]] <- labels[i] 
    temp[is.na(df[[var]])] <- NA
    df[[new_var]] <- as.item(temp, labels = labels, grep = grep, missing.values = missing.values, annotation = if (is.null(annotation)) paste0(var, ": [", # Levels(df[[var]], concatenate = T), 
                             paste(sapply(names(labels), function(i) paste0(labels[i], ": ", i)), collapse = "; "), sub("[^:]*: ", "] ", Label(df[[var]]))) else annotation) 
    # Turns it into a factor if it is not numeric
    if (is.character(labels)) df[[new_var]] <- as.factor(df[[new_var]])
    if (is.character(labels) & !is.null(annotation)) label(df[[new_var]]) <- annotation
  }  }
  return(df)
}

convert <- function(e) {
  variables_numeric <- c("hh_size", "Nb_children__14")
  text_pnr <<- c("Prefer not to say", "Je préfère ne pas répondre")

  for (i in intersect(variables_numeric, names(e))) {
    lab <- label(e[[i]])
    e[[i]] <- as.numeric(as.vector(gsub("[^0-9\\.]", "", e[[i]]))) # /!\ this may create an issue with UK zipcodes as it removes letters
    label(e[[i]]) <- lab
  }

  # if (country != "RU") for (j in intersect(variables_binary, names(e))) { 
  #   temp <- label(e[[j]])
  #   e[[j]] <- !is.na(e[[j]])
  #   # e[[j]] <- e[[j]] %in% "" # e[[j]][e[[j]]!=""] <- TRUE
  #   # e[[j]][is.na(e[[j]])] <- FALSE
  #   label(e[[j]]) <- temp
  # }
  
  # Socio-demos
  e$man <- e$gender %in% "Man"
  label(e$man) <- "man: T/F. gender %in% Man."
  
  e <- create_item("age_exact", new_var = "age", labels = c("18-24" = 21.5, "25-34" = 30, "35-49" = 42.5, "50-64" = 57.5, "65+" = 71), 
                   values = list(c("18 to 20", "21 to 24", "Entre 18 et 24 ans"), c("25 to 29", "30 to 34", "Entre 25 et 34 ans"), c("35 to 39", "40 to 44", "45 to 49", "Entre 35 et 49 ans"), c("50 to 54", "55 to 59", "60 to 64", "Entre 50 et 64 ans"), 
                                 c("65 to 69", "70 to 74", "75 to 79", "80 to 84", "85 to 89", "90 to 99", "100 or above")), df = e)
  e$age_factor <- relevel(as.factor(e$age), "35-49")
  label(e$age_factor) <- "age_factor: Age [18-24; 25-34; 35-49 [default]; 50-64; 65+]."
  e <- create_item("education", labels = c("Below upper secondary" = 1, "Upper secondary" = 2, "Above upper secondary" = 3), grep = T, keep_original = T, values = c("1|2", "3|4", "5|6|7"), df = e, annotation = "education: What is your highest completed education level? [1: Below upper secondary; 2: Upper secondary; 3: Above upper secondary] (from education_original).")
  e$post_secondary <- e$education %in% 3
  label(e$post_secondary) <- "post_secondary: education == 'Above upper secondary'"
  e$education_quota <- ifelse(e$age > 25 & e$age < 65, e$education, 0)

  e <- create_item("education_quota", labels = c("Not 25-64" = 0, "Below upper secondary" = 1, "Upper secondary" = 2, "Post secondary" = 3), values = 0:3, missing.values = c(NA, 0), df = e, annotation = "education_quota: ifelse(age > 25 & age < 65, education, 0). Except in RU: education.")

  e <- create_item("income", new_var = "income_quartile", labels = c("Q1" = 1, "Q2" = 2, "Q3" = 3, "Q4" = 4, "PNR" = 0), values = c("100|200|250", "300|400|500", "600|700|750", "800|900", "not"), grep = T, missing.values = c("PNR"), df = e)  
  e <- create_item("income", new_var = "income_decile", labels = c("d1" = 1, "d2" = 2, "d3" = 3, "d4" = 4, "d5" = 5, "d6" = 6, "d7" = 7, "d8" = 8, "d9" = 9, "d10" = 10, "PNR" = 0), values = c("less", "100 and", "201|300", "301", "401", "501", "601", "701|800", "801", "more", "not"), grep = T, missing.values = c("PNR"), df = e)  

  e$uc <- .5 + .5*pmax(0, e$hh_size - e$Nb_children__14) + .3*e$Nb_children__14
  label(e$uc) <- "uc: Consumption units (.5 + .5*pmax(0, hh_size - Nb_children__14) + .3*Nb_children__14)."
 
  # if (country == "GB") e$urbanity[e$urbanity %in% c(1,3)] <- ifelse(e$urbanity[e$urbanity %in% c(1,3)] %in% 1, 3, 1) # Correcting a mistake in Qualtrics encoding
  # if ("urbanity" %in% names(e)) {
  #   e$urban <- e$urbanity == 1
  #   e <- create_item("urbanity", labels = c("Cities" = 1, "Towns and suburbs" = 2, "Rural" = 3), grep = T, values = c("1", "2", "3|4"), keep_original = T, missing.values = 0, df = e, annotation = "urbanity: 1-3. Urbanicity [1: Cities; 2: Towns and suburbs, 3: Rural].")
  #   if (country == "US") e$urbanity[e$urbanity %in% c(2, 4)] <- 3 
  #   # e$urban_rural <- e$urbanity
  #   # e <- create_item("urban_rural", labels = c("Cities" = 1, "Rural" = 2), values = list(1, c(2:4)), df = e)
  # }

  e <- create_item("voted", new_var = "voted_original", c("No right" = -1, "PNR" = -0.1, "No" = 0, "Yes" = 1), grep = T, values = c("right", "Prefer not", "No", "Yes"), df = e)
  e$voted <- e$voted %in% c("Yes", "Oui")
  e$vote_original <- gsub("NA", "", paste0(e$vote_FR, e$vote_US, e$vote_GB, e$vote_IT))
  label(e$vote_original) <- "vote_original: Vote (if voted) or closest candidate (if !voted) in last election."
  e$vote_agg <- ifelse(e$vote_original %in% c("Prefer not to say", "Other", NA), -1, votes_xlsx[e$vote_original]) # PNR, Other as -1
  # e$vote_leaning <- ifelse(e$vote_original == "Other", NA, e$vote_agg) # PNR as -1, Other as NA
  # label(e$vote_leaning) <- "vote_leaning: ifelse(vote_original == Other, NA, vote_agg)"
  # e$vote_major_candidate <- votes[[country]][sub("Prefer not to say", "Other", e$vote_original), "major"] %in% 1
  # label(e$vote_major_candidate) <- "vote_major_candidate: Vote (or hypothetical vote) for a major candidate (> 1% (?) of actual votes)."
  # e$vote_major <- ifelse(e$vote_major_candidate, e$vote_original, "PNR or Other")
  # label(e$vote_major) <- "vote_major: Vote (or hypothetical vote) if vote_major_candidate, else 'PNR or Other'."
  # e$vote_voters <- ifelse(e$voted, e$vote_original, "Non-voter or PNR")
  # label(e$vote_voters) <- "vote_voters: Vote if voted else 'Non-voter or PNR'."
  # e$vote_major_voters <- ifelse(e$voted, ifelse(e$vote_major %in% "PNR or Other", "Non-voter, PNR or Other", e$vote_major), "Non-voter, PNR or Other")
  # label(e$vote_major_voters) <- "vote_major_voters: Vote if voted for a major candidate, else 'Non-voter, PNR or Other'."
  # if (country %in% countries_EU) e$vote_group <- votes[[country]][sub("Prefer not to say", "Other", e$vote_original), "group"]
  # if (country %in% countries_EU) label(e$vote_group) <- "vote_group: Group at the EU Parliament of the vote (or hypothetical vote)."
  e$vote <- ifelse(e$voted, e$vote_agg, -1) # Only on voters
  
  e <- create_item("vote_agg", labels = c("PNR or Other"  = -1, "Left" = 0, "Center-right or Right" = 1, "Far right" = 2), values = -1:2, missing.values = -1, df = e, annotation = "vote_agg: -1-2. Vote (or hypothetical vote) [-1: PNR or Other; 0: Left; 1: Center-right or Right; 2: Far right].")
  e <- create_item("vote", labels = c("Non-voter, PNR or Other"  = -1, "Left" = 0, "Center-right or Right" = 1, "Far right" = 2), values = -1:2, missing.values = -1, df = e, annotation = "vote: -1-2. Vote [-1: Non-voter, PNR or Other; 0: Left; 1: Center-right or Right; 2: Far right].")
  # e$vote_agg_factor <- relevel(as.factor(as.character(e$vote_agg, include.missings = T)), "PNR or Other")
  # label(e$vote_agg_factor) <- "vote_agg_factor: -1-2. Vote (or hypothetical vote) [-1: PNR or Other; 0: Left; 1: Center-right or Right; 2: Far right]."
  e$vote_factor <- relevel(as.factor(as.character(e$vote, include.missings = T)), "Non-voter, PNR or Other") # Left
  label(e$vote_factor) <- "vote_factor: -1-2. Vote [-1: Non-voter, PNR or Other; 0: Left; 1: Center-right or Right; 2: Far right]."
  
  e <- create_item("gcs_support", labels = c("No" = 0, "PNR" = -0.1, "Yes" = 100), values = c("No", list(text_pnr), "Yes|Oui"), grep = T, missing.values = c("", NA, "PNR"), df = e) 
  e <- create_item("gcs_comprehension", labels = c("decrease" = -1, "not be affected" = 0, "increase" = 1), values = c("decrease|diminu", "affect", "increase|augmente"), grep = T, df = e)
  e$gcs_understood <- e$gcs_comprehension == 1

  if ("urbanity" %in% names(e)) e$urbanity_factor <- e$urbanity_na_as_city <- no.na(factor(e$urbanity), rep = "NA")
  else e$urbanity_factor <- "NA"
  e$education_factor <- factor(e$education)
  e$income_factor <- relevel(factor(no.na(factor(e$income_quartile), rep = "NA")), "Q1")
  if ("region" %in% names(e)) e$region_factor <- no.na(factor(e$region), rep = "NA")
  if ("region" %in% names(e)) e$region_factor[e$region_factor == "0"] <- "NA"
  if ("region" %in% names(e)) e$country_region <- paste(e$country, e$region_factor)
  if ("urbanity" %in% names(e)) e$urbanity_na_as_city[is.na(e$urbanity)] <- "Cities"
  
  e$mail_prolific <- ifelse(!is.na(e$PROLIFIC_PID), paste0(e$PROLIFIC_PID, "@email.prolific.com"), NA)
  e$volunteer <- grepl("@", e$mail)
  e$latent_support_global_redistr <- e$field <- e$group_defended <- e$millionaire_factor <- e$booked <- e$couple <- e$employment_agg <- e$region_factor <- e$region_factor	<- e$share_solidarity_supported	<- e$share_solidarity_diff	<- e$weight	<- e$weight_vote <- NA

  e$n <- paste0(e$country, "p", 1:nrow(e))

  return(e)
}

e <- rename_survey(e)
e <- convert(e)

write.xlsx(e[order(!e$volunteer, e$n),c("n", "latent_support_global_redistr", "mail", "booked", "gcs_support",	"gcs_understood",	"field",	"voted",	"vote_original",	"group_defended",	"income_decile",	
  "millionaire_factor",	"age_factor",	"education_factor",	"man",	"urbanity_factor",	"zipcode",	"couple",	"uc",	"employment_agg",	"vote_factor",	"income_factor", "region_factor",	"share_solidarity_supported",	"share_solidarity_diff",	"weight",	"weight_vote",
  "vote_agg",	"vote",	"country", "volunteer", "mail_prolific")], "../hidden/prolific.xlsx")


