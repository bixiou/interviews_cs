# package("BalancedSampling")
package("Hmisc")
package("tidyverse")
package("sampling")
# TODO nested subsamples so that the most representative subsamples come first

##### Quotas #####
{
  levels_quotas <- list(
    "gender" = c("Femme", "Autre", "Homme"), # c("Woman", "Other", "Man"), # we could add: urbanity, education, wealth, occupation, employment_agg, marital_status, Nb_children, HH_size, home (ownership)
    "income_quartile" = c("Q1", "Q2", "Q3", "Q4"), # 1:4, 
    "age" = c("18-24", "25-34", "35-49", "50-64", "65+"),
    "urbanity" = c("Cities", "Towns and suburbs", "Rural"),
    "education_quota" = c("Below upper secondary", "Upper secondary", "Post secondary", "Not 25-64"), # "Not 25-64"
    "employment_18_64" = c("Inactive", "Unemployed", "Employed", "65+"),
    "vote" = c("Left", "Center-right or Right", 'Far right', "Non-voter, PNR or Other"),
    "region" = 1:5, # It's OK if some values are missing in one population. (2 regions: IT, PL; 3 regions: DE, CH; 4 regions: RU, SA, US)
    "urban" = c(TRUE, FALSE),
    "gcs_support" = c("Yes", "No"),
    "gcs_understood" = c(TRUE, FALSE)
  )
  
  # TODO? automatic _vote in quotas, nb_regions automatic
  quotas <- list("default" = c("gender", "income_quartile", "age", "education_quota", "urbanity", "region")
                 # "FR" = c("gender", "income_quartile", "age", "education_quota", "urbanity", "region"), #, "urban_category") From oecd_climate: Pb sur cette variable car il y a des codes postaux à cheval sur plusieurs types d'aires urbaines. Ça doit fausser le type d'aire urbaine sur un peu moins de 10% des répondants. Plus souvent que l'inverse, ça les alloue au rural alors qu'ils sont urbains.
                 # # Au final ça rajoute plus du bruit qu'autre chose, et ça gène pas tant que ça la représentativité de l'échantillon (surtout par rapport à d'autres variables type age ou diplôme). Mais ça justifie de pas repondérer par rapport à cette variable je pense. cf. FR_communes.R pour les détails.
  )
  for (q in names(quotas)) quotas[[paste0(q, "_vote")]] <- c(quotas[[q]], "vote")
  for (q in names(quotas)) quotas[[paste0(q, "_gcs")]] <- c(quotas[[q]], "gcs_support")
  # for (q in names(quotas)) quotas[[paste0(q, "_gcs_simple")]] <- c("gcs_support")
  for (q in names(quotas)) quotas[[paste0(q, "_vote_gcs")]] <- c(quotas[[q]], "vote", "gcs_support")
  for (q in names(quotas)) quotas[[paste0(q, "_all_gcs")]] <- c(quotas[[q]], "vote", "gcs_support", "gcs_understood")
  # for (q in names(quotas)) quotas[[paste0(q, "_vote_gcs_simple")]] <- c("gender", "income_quartile", "age", "education_quota", "vote", "gcs_support")
  # for (c in countries_EU) quotas[[paste0(c, "_all")]] <- c(quotas[[c]], "employment_18_64", "vote")
  
  qs <- round(read.xlsx("../../budget_26/data_ext/sources.xlsx", sheet = "Quotas", rowNames = T, rows = 1:2, cols = 1:57))
  
  pop_freq <- list()
  for (c in "FR") {
    pop_freq[[c]]$gender <- c("Femme" = qs[c,"women"], 0.001, "Homme" = qs[c,"men"])/1000
    pop_freq[[c]]$income_quartile <- rep(.25, 4)
    pop_freq[[c]]$age <- unlist(qs[c, c("18-24", "25-34", "35-49", "50-64", "65+")]/1000)
    pop_freq[[c]]$education_quota <- unlist(c(qs[c, c("Below.upper.secondary.25-64.0-2", "Upper.secondary.25-64.3", "Above.Upper.secondary.25-64.4-8")]/1000, "Not 25-64" = sum(unlist(qs[c, c("18-24", "65+")]/1000)))) # It's called 3 and 4-8 though in reality it's 3-4 and 5-8.
    pop_freq[[c]]$urbanity <- unlist(qs[c, c("Cities", "Towns.and.suburbs", "Rural")]/1000)
    pop_freq[[c]]$region <- unlist(qs[c, paste0("Region.", 1:5)]/1000)
    pop_freq[[c]]$employment_18_64 <- unlist(c(c("Inactive" = qs[c, "Inactivity"], "Unemployed" = qs[c, "Unemployment"]*(1000-qs[c, "Inactivity"])/1000, "Employed" =  1000-qs[c, "Inactivity"]-qs[c, "Unemployment"]*(1000-qs[c, "Inactivity"])/1000)*(1000-qs[c, c("65+")])/1000, "65+" = qs[c, c("65+")])/1000)
    # pop_freq[[c]]$vote <- unlist(c(c("Left" = qs[c, "Left"], "Center-right or Right" = qs[c, "Center-right.or.Right"], "Far right" = qs[c, "Far.right"])*(1000-qs[c, "Abstention"])/sum(qs[c, c("Left", "Center-right.or.Right", "Far.right")], na.rm = T), "Abstention" = qs[c, "Abstention"])/1000) # We exclude Other in this variant
    pop_freq[[c]]$vote <- unlist(c("Left" = qs[c, "Left"], "Center-right or Right" = qs[c, "Center-right.or.Right"], "Far right" = qs[c, "Far.right"], "Non-voter, PNR or Other" = sum(qs[c, "Abstention"], qs[c, "Vote_other"]))/1000) # We exclude Other in this variant
  }
}

weighting <- function(e, country = e$country[1], printWeights = T, variant = NULL, min_weight_for_missing_level = F, trim = T) {
  if (nrow(e) == 0) return(1)
  else {
    if (!missing(variant) & printWeights) print(variant)
    country_variant <- paste0(c(country, variant), collapse = "_") 
    if (!country_variant %in% names(quotas)) {
      warning("No country-variant quotas found, using default variables.")
      country_variant <- ifelse(is.null(variant), "default", paste0("default_", variant)) }
    vars <- quotas[[country_variant]]
    freqs <- list()
    for (v in vars) {
      if (!(v %in% names(e))) warning(paste(v, "not in data"))
      e[[v]] <- as.character(e[[v]], include.missings = T)
      e[[v]][is.na(e[[v]])] <- "NA"
      var <- ifelse(v %in% names(levels_quotas), v, paste(country, v, sep="_"))
      if (!(var %in% names(levels_quotas))) warning(paste(var, "not in levels_quotas"))
      levels_v <- as.character(levels_quotas[[var]])
      levels_v <- levels_v[levels_v != 0]
      missing_levels <- setdiff(levels(as.factor(e[[v]])), levels_v) 
      present_levels <- which(levels_v %in% levels(as.factor(e[[v]]))) 
      if (length(present_levels) != length(levels_v)) warning(paste0("Following levels are missing from data: ", var, ": ", 
                                                                     paste(levels_v[!1:length(levels_v) %in% present_levels], collapse = ', '), " (for ", country, "). Weights are still computed, neglecting this category."))
      prop_v <- pop_freq[[country]][[var]][present_levels]
      if (min_weight_for_missing_level) freq_missing <- rep(0.000001, length(missing_levels)) # imputes 0 weight for levels present in data but not in the weight's definition
      else freq_missing <- vapply(missing_levels, function(x) sum(e[[v]]==x), FUN.VALUE = c(0))
      freq_v <- c(prop_v*(nrow(e)-sum(freq_missing)), freq_missing)
      df <- data.frame(c(levels_v[present_levels], missing_levels), freq_v)
      # df <- data.frame(c(levels_v, missing_levels), nrow(e)*c(pop_freq[[country]][[var]], rep(0.0001, length(missing_levels))))
      names(df) <- c(v, "Freq")
      freqs <- c(freqs, list(df))
    }
    # print(freqs)
    unweigthed <- svydesign(ids=~1, data=e)
    raked <- rake(design= unweigthed, sample.margins = lapply(vars, function(x) return(as.formula(paste("~", x)))), population.margins = freqs)
    
    if (printWeights) {    print(summary(weights(raked))  )
      print(paste("(mean w)^2 / (n * mean w^2): ", representativity_index(weights(raked)), " (pb if < 0.5)")) # <0.5 : problématique
      print(paste("proportion not in [0.25; 4]: ", round(length(which(weights(raked)<0.25 | weights(raked)>4))/ length(weights(raked)), 3), "Nb obs. in sample: ", nrow(e)))
    }
    if (trim) return(weights(trimWeights(raked, lower=0.25, upper=4, strict=TRUE)))
    else return(weights(raked, lower=0.25, upper=4, strict=TRUE))
    
  }
}

interest_vars <- c("gcs_support", "gcs_understood", "latent_support_global_redistr", "man", "age_factor", "vote_factor", "education_quota_factor", "income_factor", "region_factor", "urbanity_factor") 
# interest_vars <- c("gcs_support", "gcs_understood", "man", "age_factor", "vote_factor", "education_quota", "income_quartile", "region", "urbanity") 

# Cf. https://stats.stackexchange.com/questions/469563/how-to-partition-a-sample-into-representative-subsamples
select_subsample <- function(n = 200, c = "US", weight_var = "weight_all_gcs", auxiliary_vars = interest_vars, return = "sample", verbose = FALSE) {
  set.seed(0)
  # vote (non-voters as PNR), vote_agg (hypothetical vote used for non-voters), voted, group_defended, employment_agg, millionaire_factor, share_solidarity_supported, share_solidarity_diff
  df <- readRDS(paste0("../hidden/", c, "_full.rds"))# This works well if anyone from the sample can be selected; doesn't work if only a subset is volunteer
  for (v in intersect(auxiliary_vars, names(df))) df <- df[!is.na(df[[v]]), ]
  df$inclusion_weight <- inclusionprobabilities(df[[weight_var]], n) 
  # balancing_matrix <- model.matrix(~ . -1, data = df[, c("inclusion_weight", intersect(names(df), auxiliary_vars))])
  # selected_subsample <- samplecube(balancing_matrix, df$inclusion_weight, order = 2, method = 2, comment = verbose) == 1
  balancing_matrix <- model.matrix(~ ., data = df[, c(intersect(auxiliary_vars, names(df)))])
  selected_subsample <- samplecube(df$inclusion_weight * balancing_matrix, df$inclusion_weight, order = 2, method = 2, comment = verbose) == 1
  # Alternative with BalancedSampling package:
  # df$inclusion_weight <- getPips(df[[weight_var]], n) # df[[weight_var]] * n/sum(df[[weight_var]])  
  # selected_subsample <- cube(df$inclusion_weight, df[, c("inclusion_weight", auxiliary_vars)])
  
  print(paste0(c, ". Size subsample: ", sum(selected_subsample), "; ", round(100*mean(df$gcs_support[selected_subsample])), "% support GCS in subsample"))
  if (verbose || (return == "representativeness")) print(round(colMeans(balancing_matrix[selected_subsample, ]), 2))
  if (return == "sample") return(df[selected_subsample,])
  else if (return == "export") {
    # write.csv2(df[selected_subsample,], paste0("../hidden/subsample_", c, "_", n, ".csv"))
    write.table(df[selected_subsample,] %>% mutate(across(where(is.character), ~ str_replace_all(.x, "[\r\n]", "\\\\n"))) %>% mutate(across(where(is.character), ~ str_replace_all(.x, ";", ","))), 
                paste0("../hidden/subsample_", c, "_", n, ".csv"), quote = F, row.names = F, sep = ";", dec = ".")
    
    print(round(colMeans(balancing_matrix[selected_subsample, ]), 2))
    if (verbose) return(selected_subsample)
  }
  else if (return == "rest") return(df[setdiff(1:nrow(df), selected_subsample)])
  else if (return == "mail") return(df$interview[selected_subsample])
  else if (return == "n") return(df$n[selected_subsample])
  else if (return == "representativeness") return(colMeans(balancing_matrix[selected_subsample, ]))
  else return(selected_subsample)
}

for (c in c("US", "GB", "FR")) select_subsample(n = 20, c = c, return = "export")
for (c in c("US", "GB")) select_subsample(n = 200, c = c, return = "export")
for (c in c("US", "GB")) select_subsample(n = 100, c = c, return = "export")
select_subsample(n = 75, c = "FR", return = "export")
select_subsample(n = 50, c = "FR", return = "export")
for (c in c("US", "GB", "FR")) select_subsample(n = 20, c = c, return = "representativeness")
select_subsample(n = 100, c = "US", return = "export")

# Sandbox
n <- 75 # 250 (based on 40% acceptance rate, 75 for 30 people and 250 for 100)
c <- "GB"
interest_vars <- c()
interest_vars <- c("gcs_support", "latent_support_global_redistr") 
interest_vars <- c("gcs_support", "latent_support_global_redistr", "man", "age_factor", "vote_factor", "education_factor", "income_factor") # other quota vars: urbanity region, education_quota instead (25-64)
weight_var <- "weight_vote_gcs"

df <- readRDS(paste0("../hidden/", c, "_full.rds"))
select_subsample(n = 75, c = "FR", weight_var = "weight_gcs", auxiliary_vars = c() , return = "export")
length(cube(df$inclusion_weight, as.matrix(df[, c("inclusion_weight", interest_vars)])))
wtd.mean(df$gcs_support, df$weight_vote_gcs) # 88%
mean(df$gcs_support) # 80%


##### Export ID data #####
# all_id <- read.csv("../Adrien's/all_id.csv")
# all_id <- merge(all[,!names(all) %in% c("interview", "country")], all_id, by = "n")
# all_id$volunteer <- grepl("@", all_id$interview)
# variables_export <- c("n", variables_sociodemos, "zipcode", "income_decile", "uc", "country", "vote_original", "vote", "voted", "vote_agg", "group_defended", "gcs_support", "gcs_understood", "field", "latent_support_global_redistr", 
#                       "share_solidarity_diff", "share_solidarity_supported", "interview", "volunteer", "weight", "weight_vote", "weight_vote_gcs", "weight_gcs", "weight_vote_gcs", "weight_vote_gcs_simple", "weight_all_gcs")
# write.table(all_id[all_id$country %in% c("IT", "US", "GB", "FR") & all_id$volunteer, names(all_id) %in% variables_export] %>%
#               mutate(across(where(is.character), ~ str_replace_all(.x, "[\r\n]", "\\\\n"))) %>% mutate(across(where(is.character), ~ str_replace_all(.x, ";", ","))), "../Adrien's/id.csv", quote = F, row.names = F, sep = ";", dec = ".")
# saveRDS(all_id[all_id$country %in% c("IT", "US", "GB", "FR") & all_id$volunteer, names(all_id) %in% variables_export], "../Adrien's/id.rds")
# for (c in c("IT", "US", "GB", "FR")) {
#   print(c)
#   temp <- wtd.mean(d(c)$gcs_support, d(c)$weight)
#   pop_freq[[c]]$gcs_support <- c(temp/100, 1-temp/100)
#   temp <- wtd.mean(d(c)$gcs_understood, d(c)$weight)
#   pop_freq[[c]]$gcs_understood <- c(temp, 1-temp)
#   temp <- all_id[all_id$country == c & all_id$volunteer,]
#   temp$weight <- weighting(temp, c, trim = FALSE)
#   temp$weight_gcs <- weighting(temp, c, variant = "gcs", trim = FALSE)
#   temp$weight_vote <- weighting(temp, c, variant = "vote", trim = FALSE)
#   temp$weight_vote_gcs <- weighting(temp, c, variant = "vote_gcs", trim = FALSE)
#   temp$weight_all_gcs <- weighting(temp, c, variant = "all_gcs", trim = FALSE)
#   # temp$weight_vote_gcs_simple <- weighting(temp, c, variant = "vote_gcs_simple", trim = FALSE)
#   saveRDS(temp[, names(temp) %in% variables_export], paste0("../Adrien's/", c, "_full.rds"))
# } 
# rm(all_id)

# saveRDS(df[, !names(df) %in% "interview"], "../hidden/GB_anon.rds")


##### Random order #####
set.seed(6)
random_order <- matrix(NA, ncol = 21, nrow = 500)
random_order[,1] <- c("P", "C")[sample(2, 500, replace = T)]
for (i in 1:500) random_order[i, 2:11] <- random_order[i, 12:21] <- sample(1:10)
write.csv(random_order, "../data_ext/random_order.csv")
# describe(random_order[1:300,1])
# for (i in 1:500) print(paste(c(c("P", "C")[sample(2,1)], sample(1:6)), collapse = ' '))


##### March 13 #####
# I adjust the population frequencies to deduct the 28 people who have already been interviewed.
done <- read.xlsx("../hidden/FR.xlsx", sheet = "Survey")
done <- done[done$booked %in% 1,]
c <- "FR"
N <- 100 # objective
pop_freq[[c]]$gender <- (c("Femme" = qs[c,"women"], 0.001, "Homme" = qs[c,"men"])/1000 - c(sum(!done$man), 0, sum(done$man))/N)/(1 - nrow(done)/N)
pop_freq[[c]]$income_quartile <- (rep(.25, 4) - c(sum(done$income_factor %in% "Q1"), sum(done$income_factor %in% "Q2"), sum(done$income_factor %in% "Q3"), sum(done$income_factor %in% "Q4"))/N)/(1 - nrow(done)/N)
pop_freq[[c]]$age <- (unlist(qs[c, c("18-24", "25-34", "35-49", "50-64", "65+")]/1000) - c(sum(done$age_factor %in% "18-24"), sum(done$age_factor %in% "25-34"), sum(done$age_factor %in% "35-49"), sum(done$age_factor %in% "50-64"), sum(done$age_factor %in% "65+"))/N)/(1 - nrow(done)/N)
pop_freq[[c]]$education_quota <- (unlist(c(qs[c, c("Below.upper.secondary.25-64.0-2", "Upper.secondary.25-64.3", "Above.Upper.secondary.25-64.4-8")]/1000, "Not 25-64" = sum(unlist(qs[c, c("18-24", "65+")]/1000)))) - 
                                    c(sum(grepl("Below", done$education_factor) & grepl("34|35|50", done$age_factor)), sum(grepl("Upper", done$education_factor) & grepl("34|35|50", done$age_factor)), sum(grepl("Above", done$education_factor) & grepl("34|35|50", done$age_factor)), sum(!grepl("34|35|50", done$age_factor)))/N)/(1 - nrow(done)/N) 
pop_freq[[c]]$urbanity <- (unlist(qs[c, c("Cities", "Towns.and.suburbs", "Rural")]/1000) - c(sum(done$urbanity_factor %in% "Cities"), sum(done$urbanity_factor %in% "Towns and suburbs"), sum(done$urbanity_factor %in% "Rural"))/N)/(1 - sum(!is.na(done$region_factor))/N)
pop_freq[[c]]$region <- (unlist(qs[c, paste0("Region.", 1:5)]/1000) - c(sum(done$region_factor %in% 1), sum(done$region_factor %in% 2), sum(done$region_factor %in% 3), sum(done$region_factor %in% 4), sum(done$region_factor %in% 5))/N)/(1 - sum(!is.na(done$region_factor))/N)
# pop_freq[[c]]$employment_18_64 <- (unlist(c(c("Inactive" = qs[c, "Inactivity"], "Unemployed" = qs[c, "Unemployment"]*(1000-qs[c, "Inactivity"])/1000, "Employed" =  1000-qs[c, "Inactivity"]-qs[c, "Unemployment"]*(1000-qs[c, "Inactivity"])/1000)*(1000-qs[c, c("65+")])/1000, "65+" = qs[c, c("65+")])/1000) - c(sum(!done$man), 0, sum(done$man))/N)/(1 - nrow(done)/N)
# pop_freq[[c]]$vote <- unlist(c(c("Left" = qs[c, "Left"], "Center-right or Right" = qs[c, "Center-right.or.Right"], "Far right" = qs[c, "Far.right"])*(1000-qs[c, "Abstention"])/sum(qs[c, c("Left", "Center-right.or.Right", "Far.right")], na.rm = T), "Abstention" = qs[c, "Abstention"])/1000) # We exclude Other in this variant
pop_freq[[c]]$vote <- (unlist(c("Left" = qs[c, "Left"], "Center-right or Right" = qs[c, "Center-right.or.Right"], "Far right" = qs[c, "Far.right"], "Non-voter, PNR or Other" = sum(qs[c, "Abstention"], qs[c, "Vote_other"]))/1000) - c(sum(grepl("Left", done$vote_factor)), sum(grepl("Center", done$vote_factor)), sum(grepl("Far right", done$vote_factor)), sum(grepl("Non-voter", done$vote_factor)))/N)/(1 - sum(!is.na(done$vote_factor))/N)

pop_freq[[c]]$gcs_support <- (c(.6222735, 1-.6222735) - c(sum(done$gcs_support %in% "Yes"), sum(done$gcs_support %in% "No"))/N)/(1 - nrow(done)/N)
pop_freq[[c]]$gcs_understood <- (c(.7565714, 1-.7565714) - c(sum(done$gcs_understood), sum(!done$gcs_understood))/N)/(1 - nrow(done)/N)

for (v in names(pop_freq[[c]])) pop_freq[[c]][[v]] <- pmax(pop_freq[[c]][[v]], 0)

# Then I select 110 people among the volunteers from the new surveys to make the overall sample representative.
FRa <- readRDS("../hidden/FRa_full.rds")
for (v in c("education_quota", "income_quartile", "region", "urbanity")) FRa[[paste0(v, "_factor")]] <- as.factor(FRa[[v]])
FRa$income_factor <- FRa$income_quartile_factor
FRa$mail <- FRa$interview
FRa$mail[!grepl("@", FRa$interview)] <- FRa$budget_mail[!grepl("@", FRa$interview)]
FRa$empty <- ""
FRa$weight <- weighting(FRa, "FR", trim = FALSE)
FRa$weight_gcs <- weighting(FRa, "FR", variant = "gcs", trim = FALSE)
FRa$weight_vote <- weighting(FRa, "FR", variant = "vote", trim = FALSE)
FRa$weight_vote_gcs <- weighting(FRa, "FR", variant = "vote_gcs", trim = FALSE)
FRa$weight_all_gcs <- weighting(FRa, "FR", variant = "all_gcs", trim = FALSE)
saveRDS(FRa, "../hidden/FRa_full.rds")
select_subsample(n = 80, c = "FRa", weight_var = "weight_gcs", return = "export")

export_vars <- c("n", "budget_mail", "interview", "empty", "gcs_support", "gcs_understood", "empty", "voted", "vote_original", "group_defended", "income_decile", "millionaire_factor", 
                 "age_factor", "education", "man", "urbanity_factor", "zipcode", "couple", "uc", "employment_agg", "vote_factor", "income_factor", "region_factor", "empty", "empty", "weight", "weight_vote", "vote_agg", "vote", "empty", "volunteer", "empty")
df <- select_subsample(n = 80, c = "FRa", weight_var = "weight_gcs", return = "sample")
write.xlsx(df[,export_vars], "../hidden/FRa_80.xlsx")
wtd.mean(FRa$gcs_support, FRa$weight_vote_gcs) # 61%
mean(FRa$gcs_support) # 68%

