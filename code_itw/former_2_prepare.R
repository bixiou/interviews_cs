##### Parameters #####
countries <- c("FR", "DE", "IT", "PL", "ES", "GB", "CH", "JP", "RU", "SA", "US")
countries_names <- c("FR" = "France", "DE" = "Germany", "IT" = "Italy", "PL" = "Poland", "ES" = "Spain", "GB" = "United Kingdom", "CH" = "Switzerland", "JP" = "Japan", "RU" = "Russia", "SA" = "Saudi Arabia", "US" = "USA")
names_countries <- setNames(countries, countries_names)
countries_names_fr <- c("FR" = "France", "DE" = "Allemagne", "IT" = "Italie", "PL" = "Pologne", "ES" = "Espagne", "GB" = "Royaume-Uni", "CH" = "Suisse", "JP" = "Japon", "RU" = "Russie", "SA" = "Arabie Saoudite", "US" = "États-Unis")
# names(countries_names) <- pilot_countries
countries_EU <- countries_names[1:5]
countries_Eu <- countries_names[1:7]
pilot_countries <- c("PL", "GB", "US")
pilot_countries_all <- c(pilot_countries, "")
special_levels <- list("All" = list("var" = "country_name", "value" = countries_names), "$ bold('All')" = list("var" = "country_name", "value" = countries_names), "<b>All</b>" = list("var" = "country_name", "value" = countries_names),
                       "Europe" = list("var" = "country_name", "value" = countries_Eu), "$ bold('Europe')" = list("var" = "country_name", "value" = countries_Eu), "<b>Europe</b>" = list("var" = "country_name", "value" = countries_Eu), "Eu" = list("var" = "country_name", "value" = countries_Eu), 
                       "European Union" = list("var" = "country_name", "value" = countries_EU), "$ bold('European Union')" = list("var" = "country_name", "value" = countries_EU), "EU" = list("var" = "country_name", "value" = countries_EU), 
                       "Saudi citizens" = list("var" = "saudi", "value" = T), "Millionaire" = list("var" = "millionaire_agg", "value" = "Already"),
                       "U.S. Harris" = list("var" = "vote_voters", "value" = "Harris"), "U.S. Trump" = list("var" = "vote_voters", "value" = "Trump"), "U.S. Non-voters" = list("var" = "vote_voters", "value" = "Non-voter or PNR"),
                       "U.S. Democratic State" = list("var" = "democratic_state", "value" = TRUE), "U.S. Swing State" = list("var" = "swing_state", "value" = TRUE),
                       "Europe Left" = list("var" = "vote_Eu", "value" = "Left"), "Europe Center/Right" = list("var" = "vote_Eu", "value" = "Center-right or Right"), "Europe Far right" = list("var" = "vote_Eu", "value" = "Far right"), "Europe Non-voters" = list("var" = "vote_Eu", "value" = "Non-voter, PNR or Other"),
                       "Japan Left" = list("var" = "vote_JP", "value" = 0), "Japan Center/Right" = list("var" = "vote_JP", "value" = 1), "Japan Non-voters" = list("var" = "vote_JP", "value" = -1), "Saudi Arabia" = list("var" = "country_name", "value" = "Saudi Arabia"),
                       "Bottom 50% income" = list("var" = "income_quartile", "value" = 1:2), "Top 50% income" = list("var" = "income_quartile", "value" = 3:4), "Age < 35" = list("var" = "age", "value" = c(21.5, 30)), "Age > 50" = list("var" = "age", "value" = c(57.5, 71)), "Age 35-49" = list("var" = "age", "value" = c(42.5)), 
                       "Tertiary diploma" = list("var" = "education_factor", "value" = "Above upper secondary"), "Non-tertiary diploma" = list("var" = "education_factor", "value" = c("Upper secondary", "Below upper secondary")), "Top 20% income" = list("var" = "income_decile", "value" = 9:10), "Top 10% income" = list("var" = "income_decile", "value" = 10), "Bottom 10% income" = list("var" = "income_decile", "value" = 1), 
                       "Rural urbanicity" = list("var" = "urbanity", "value" = "Rural"), "Cities urbanicity" = list("var" = "urbanity", "value" = "Cities"), "Self/parent born abroad" = list("var" = "foreign_origin", "value" = TRUE), "Man" = list("var" = "gender", "value" = "Man"))
levels_default <- c("$ bold('All')", "$ bold('Europe')", countries_names)
levels_plain <- c("All", "Europe", countries_names)
# levels_default_list <- setNames(lapply(levels_plain, function(i) if (i %in% names(special_levels)) special_levels[[i]]$value else i), levels_plain)
levels_html <- c("<b>All</b>", "<b>Europe</b>", countries_names)
levels_default_list <- setNames(lapply(levels_html, function(i) if (i %in% names(special_levels)) special_levels[[i]]$value else i), levels_html)
# levels_default_list <- setNames(lapply(levels_plain[!levels_plain %in% "Russia"], function(i) if (i %in% names(special_levels)) special_levels[[i]]$value else i), levels_plain[!levels_plain %in% "Russia"])
levels_EU <- c("$ bold('All')", "$ bold('European Union')", countries_names)
levels_saudi <- c("$ bold('All')", "$ bold('Europe')", countries_names[1:10], "Saudi citizens", countries_names[11])
levels_merge_EU <- c("$ bold('All')", "$ bold('European Union')", countries_names[!countries_names %in% countries_EU])
levels_pol <- c("$ bold('All')", "Europe Non-voters", "Europe Left", "Europe Center/Right", "Europe Far right", "Japan Non-voters", "Japan Left", "Japan Center/Right", "Saudi Arabia", "Saudi citizens", "U.S. Non-voters", "U.S. Harris", "U.S. Trump")
levels.pol <- c("All", "Europe Non-voters", "Europe Left", "Europe Center/Right", "Europe Far right", "Japan Non-voters", "Japan Left", "Japan Center/Right", "Saudi Arabia", "Saudi citizens", "U.S. Non-voters", "U.S. Harris", "U.S. Trump")
levels_pol_US <- c("All", "Europe Non-voters", "Europe Left", "Europe Center/Right", "Europe Far right", "Japan Non-voters", "Japan Left", "Japan Center/Right", "U.S. Democratic State", "U.S. Swing State", "U.S. Non-voters", "U.S. Harris", "U.S. Trump")
levels_pol_old <- c("$ bold('All')", "Millionaire", "Europe Non-voters", "Europe Left", "Europe Center/Right", "Europe Far right", "Japan Non-voters", "Japan Left", "Japan Center/Right", "Saudi Arabia", "Saudi citizens", "U.S. Non-voters", "U.S. Harris", "U.S. Trump")
levels.pol_old <- c("All", "Millionaire", "Europe Non-voters", "Europe Left", "Europe Center/Right", "Europe Far right", "Japan Non-voters", "Japan Left", "Japan Center/Right", "Saudi Arabia", "Saudi citizens", "U.S. Non-voters", "U.S. Harris", "U.S. Trump")
levels_pol_US_old <- c("All", "Millionaire", "Europe Non-voters", "Europe Left", "Europe Center/Right", "Europe Far right", "Japan Non-voters", "Japan Left", "Japan Center/Right", "U.S. Democratic State", "U.S. Swing State", "U.S. Non-voters", "U.S. Harris", "U.S. Trump")
levels_dem <- c("$ bold('All')", "Bottom 50% income", "Top 50% income", "Top 20% income", "Millionaire", "Self/parent born abroad", "Non-tertiary diploma", "Tertiary diploma", "Cities urbanicity", "Age < 35", "Age 35-49", "Age > 50", "Man") 
levels.dem <- c("All", "Bottom 50% income", "Top 50% income", "Top 20% income", "Millionaire", "Self/parent born abroad", "Non-tertiary diploma", "Tertiary diploma", "Cities urbanicity", "Age < 35", "Age 35-49", "Age > 50", "Man")

languages_country <- list(FR = "FR", DE = "DE", IT = "IT", PL = "PL", ES = "ES-ES", GB = "EN-GB", CH = c("EN-CH", "DE-CH", "FR-CH", "IT-CH"), JP = "JA", RU = "RU", SA = c("AR", "EN-SA"), US = c("EN", "ES-US")) 
main_languages <- sapply(countries, function(c) languages_country[[c]][1])
# list(FR = c("EN-FR", "FR"), DE = c("EN-DE", "DE"), IT = c("EN-IT", "IT"), PL = c("EN-PL", "PL"), ES = c("EN-ES", "ES-ES"), GB = "EN-GB", CH = c("EN-CH", "DE-CH", "FR-CH", "IT-CH"), JP = c("EN-JA", "JA"), RU = c("EN-RU", "RU"), SA = c("AR", "EN-SA"), US = c("EN", "ES-US"))
languages <- unname(unlist(languages_country)) # c("FR", "DE", "IT", "PL", "ES-ES", "EN-GB", "CH", "JA", "RU", "AR", "EN", "FR-CH", "DE-CH", "IT-CH", "ES-US")
features <- as.matrix(read.xlsx("../questionnaire/sources.xlsx", sheet = "features", rowNames = T))
figures <- as.matrix(read.xlsx("../questionnaire/sources.xlsx", sheet = "Figures"))
policies_conjoint <- fromJSON("../conjoint_analysis/policies.json")
conjoint_attributes <- c("econ_issues", "society_issues", "climate_pol", "tax_system", "foreign_policy")
conjoint.attributes <- c("Economic issues", "Societal issues", "Climate policy", "Tax system", "Foreign policy")
policies_domains <- c()
for (l in languages[!languages %in% c("RU", "EN-SA", "AR")]) policies_domains <- c(policies_domains, setNames(conjoint_attributes, names(policies_conjoint[[l]])))
policies_code <- c()
for (l in languages[!languages %in% c("RU", "EN-SA", "AR")]) {
  policies_l <- unlist(setNames(policies_conjoint[[l]], conjoint_attributes))
  policies_code <- c(policies_code, setNames(names(policies_l), policies_l))
}
policies_code <- c(policies_code[!names(policies_code) %in% "-"], "-" = "-")
policies_leaning <- policies_leaning_strict <- read.xlsx("../questionnaire/sources.xlsx", sheet = "policies_leaning", rowNames = T, cols = c(1, 2*1:9))
policies_leaning_party <- policies_leaning_party_strict <- read.xlsx("../questionnaire/sources.xlsx", sheet = "policies_leaning_party", rowNames = T, cols = c(1, 2*1:9))
policies_leaning_strict[c("foreign_policy1", "foreign_policy2"),] <- c(0, 2)
policies_leaning_party[c("foreign_policy1", "foreign_policy2"),] <- c(1, 1)
# policies_main_language <- policies_english <- c()
# for (l in countries) policies_main_language <- c(policies_main_language, setNames(policies_conjoint[[l]], ))
thousandile_world_disposable_inc <- as.numeric(read.csv2("../data_ext/world_disposable_inc.csv", header = FALSE)[2:1001, 2]) # created in questionnaire.R
current <- c(0, thousandile_world_disposable_inc)
temp <- read.xlsx("../data_ext/gdp.xlsx", sheet = "Data", rowNames = T)
gdp_pc_ppp_2024 <- setNames(temp$gdp_pc_ppp_2024, rownames(temp))
gdp_pc_nominal_2024 <- setNames(temp$gdp_pc_nominal_2024, rownames(temp))
gini_2019 <- setNames(temp$gini_2019, rownames(temp))
mean_custom_redistr <- list()
my_taxes_global_nation <- setNames(c(33, 37, 61, 40, 55, 44, NA, 53, NA, 58, 41), countries)/100 # 2024
my_taxes_global_nation_2023 <- setNames(c(43, 65, 76, 58, 60, 52, NA, 76, NA, NA, 44), countries)/100
my_taxes_global_nation_2023_absolute <- setNames(c(28, 46, 54, 41, 39, 32, NA, 43, NA, NA, 30), countries)/100
stostad <- read.dta13("../data_ext/stostad.dta")
stostad$iso[stostad$iso == "UK"] <- "GB"
stostad_billionaire_tax_absolute <- sapply(countries, function(c) if (c %in% stostad$iso) (stostad$agree1 + stostad$vagree1)[stostad$iso == c] else NA)# “International organizations and governments have recently proposed a coordinated tax targeting the world’s wealthiest individuals. This tax would require those with a wealth exceeding US $1 billion, or the approximately 3000 richest individuals in the world, to pay a minimum of 2% of their wealth in taxes every year.
# [Absolute support] Do you support or oppose this policy? [Strongly support / Somewhat support / Neither support nor oppose / Somewhat oppose / Strongly oppose / Do not understand]”
stostad_billionaire_tax_oppose <- sapply(countries, function(c) if (c %in% stostad$iso) (stostad$disagree1 + stostad$vdisagree1)[stostad$iso == c] else NA) 
stostad_billionaire_tax_relative <- stostad_billionaire_tax_absolute / (stostad_billionaire_tax_absolute + stostad_billionaire_tax_oppose)
income_deciles <- read.xlsx("../questionnaire/sources.xlsx", sheet = "Income", rowNames = T, rows = 1:13)
mfd <- read.csv("../data_ext/moral_dic2.csv") # univeralist: care/harm + fairness/cheating; particularist: loyalty/betrayal + authority/subversion. Source: https://osf.io/ezn37
emfd <- read.csv("../data_ext/eMFD.csv") # Source Hopp et al. (21), https://osf.io/vw85e/files/ufdcz
growth <- read.xlsx("../data_ext/growth_imf.xlsx") # Real GDP growth, IMF WEO (Oct 24), Accessed on 12/21/2024, https://www.imf.org/external/datamapper/NGDP_RPCH@WEO/OEMDC/ADVEC/WEOWORLD
growth$growth_2018_2024 <- (1+growth$growth_2019/100)*(1+growth$growth_2020/100)*(1+growth$growth_2021/100)*(1+growth$growth_2022/100)*(1+growth$growth_2023/100)*(1+growth$growth_2023/100)*(1+growth$growth_2024/100)
growth_2018_2024 <- setNames(setNames(growth$growth_2018_2024[growth$isoname %in% countries_names], growth$isoname[growth$isoname %in% countries_names])[countries_names[countries]], countries)

{
  levels_quotas <- list(
    "gender" = c("Woman", "Other", "Man"), # we could add: urbanity, education, wealth, occupation, employment_agg, marital_status, Nb_children, HH_size, home (ownership)
    "income_quartile" = c("Q1", "Q2", "Q3", "Q4"), # 1:4, 
    "age" = c("18-24", "25-34", "35-49", "50-64", "65+"),
    "urbanity" = c("Cities", "Towns and suburbs", "Rural"),
    "education_quota" = c("Below upper secondary", "Upper secondary", "Post secondary", "Not 25-64"), # "Not 25-64"
    "employment_18_64" = c("Inactive", "Unemployed", "Employed", "65+"),
    "vote" = c("Left", "Center-right or Right", 'Far right', "Non-voter, PNR or Other"),
    "region" = 1:5, # It's OK if some values are missing in one population. (2 regions: IT, PL; 3 regions: DE, CH; 4 regions: RU, SA, US)
    "All_country" = countries,
    "Eu_country" = c("FR", "DE", "ES", "IT", "PL", "GB", "CH"),
    "EU_country" = c("FR", "DE", "ES", "IT", "PL"),
    "gender_nationality" = c("Woman, Saudi", "Woman, non-Saudi", "Man, Saudi", "Man, non-Saudi"),
    # "US_region" = c("Northeast", "Midwest", "South", "West"),
    "race" = c("White only", "Hispanic", "Black", "Other"),
    "vote_US" = c("Harris", "Trump", "Other/Non-voter", "PNR/no right"), # TODO? vote_autres
    "urban" = c(TRUE, FALSE),
    "gcs_support" = c("Yes", "No"),
    "gcs_understood" = c(TRUE, FALSE)
  )
  
  # TODO? automatic _vote in quotas, nb_regions automatic
  quotas <- list("default" = c("gender", "income_quartile", "age", "education_quota", "urbanity", "region"),
                 # "EU" = c("gender", "income_quartile", "age", "education_quota", "country", "urbanity"),
                 # "EU_vote" = c("gender", "income_quartile", "age", "education_quota", "country", "urbanity", "vote"),
                 # "EU_all" = c("gender", "income_quartile", "age", "education_quota", "country", "urbanity", "employment_18_64", "vote"), 
                 # "US_vote" = c("gender", "income_quartile", "age", "education_quota", "race", "region", "urban", "vote_US"),
                 "US_all" = c("gender", "income_quartile", "age", "education_quota", "race", "region", "urban", "employment_18_64", "vote"),
                 "All" = c("gender", "income_quartile", "age", "education_quota", "urbanity", "country"),
                 "EU" = c("gender", "income_quartile", "age", "education_quota", "urbanity", "country"),
                 "Eu" = c("gender", "income_quartile", "age", "education_quota", "urbanity", "country"),
                 "RU" = c("gender", "income_quartile", "age", "education_quota"), # , "region"
                 # "FR" = c("gender", "income_quartile", "age", "education_quota", "urbanity", "region"), #, "urban_category") From oecd_climate: Pb sur cette variable car il y a des codes postaux à cheval sur plusieurs types d'aires urbaines. Ça doit fausser le type d'aire urbaine sur un peu moins de 10% des répondants. Plus souvent que l'inverse, ça les alloue au rural alors qu'ils sont urbains.
                 # # Au final ça rajoute plus du bruit qu'autre chose, et ça gène pas tant que ça la représentativité de l'échantillon (surtout par rapport à d'autres variables type age ou diplôme). Mais ça justifie de pas repondérer par rapport à cette variable je pense. cf. FR_communes.R pour les détails.
                 "SA" = c("gender_nationality", "income_quartile", "age", "education_quota", "region"),
                 "US" = c("gender", "income_quartile", "age", "education_quota", "urbanity", "region", "race")
  )
  for (q in names(quotas)) quotas[[paste0(q, "_vote")]] <- c(quotas[[q]], "vote")
  for (q in names(quotas)) quotas[[paste0(q, "_gcs")]] <- c(quotas[[q]], "gcs_support")
  # for (q in names(quotas)) quotas[[paste0(q, "_gcs_simple")]] <- c("gcs_support")
  for (q in names(quotas)) quotas[[paste0(q, "_vote_gcs")]] <- c(quotas[[q]], "vote", "gcs_support")
  for (q in names(quotas)) quotas[[paste0(q, "_all_gcs")]] <- c(quotas[[q]], "vote", "gcs_support", "gcs_understood")
  # for (q in names(quotas)) quotas[[paste0(q, "_vote_gcs_simple")]] <- c("gender", "income_quartile", "age", "education_quota", "vote", "gcs_support")
  # for (c in countries_EU) quotas[[paste0(c, "_all")]] <- c(quotas[[c]], "employment_18_64", "vote")
  
  qs <- round(read.xlsx("../questionnaire/sources.xlsx", sheet = "Quotas", rowNames = T, rows = c(1, 2:15), cols = 1:57))
  adult_pop <- setNames(qs[countries, "Adult.pop"], countries)
  
  pop_freq <- list(
    "Eu" = list("Eu_country" = unlist(qs["Eu", c("FR", "DE", "ES", "IT", "PL", "GB", "CH")]/1000) ),
    "EU" = list("EU_country" = unlist(qs["Eu", c("FR", "DE", "ES", "IT", "PL")]/sum(qs["Eu", c("FR", "DE", "ES", "IT", "PL")])) ),
    "All" = list("All_country" = adult_pop/sum(adult_pop)),
    "US" = list(
      # "urbanity" = c(qs["US", "Cities"], 0.001, qs["US","Rural"])/1000,
      "urban" = c(qs["US", "Cities"], qs["US","Rural"])/1000,
      # "US_region" = unlist(qs["US", c("Region.1", "Region.2", "Region.3", "Region.4")]/1000),
      "race" = unlist(qs["US", c("White.non.Hispanic", "Hispanic", "Black", "Other")]/1000)
      # "US_vote_US" = c(0.308637, 0.31822, 0.373142, 0.000001) # https://en.wikipedia.org/wiki/2024_United_States_presidential_election
    ),
    "SA" = list("gender_nationality" = unlist(setNames(qs["SA", c("White.non.Hispanic", "Hispanic", "Black", "Other")],  c("WoSaudi", "WoNonSaudi", "ManSaudi", "ManNonSaudi"))/1000)
    ))
  for (c in c("All", "EU", "Eu", countries)) {
    pop_freq[[c]]$gender <- c("Woman" = qs[c,"women"], 0.001, "Man" = qs[c,"men"])/1000
    pop_freq[[c]]$income_quartile <- rep(.25, 4)
    pop_freq[[c]]$age <- unlist(qs[c, c("18-24", "25-34", "35-49", "50-64", ">65")]/1000)
    pop_freq[[c]]$education_quota <- unlist(c(qs[c, c("Below.upper.secondary.25-64.0-2", "Upper.secondary.25-64.3", "Above.Upper.secondary.25-64.4-8")]/1000, "Not 25-64" = sum(unlist(qs[c, c("18-24", ">65")]/1000)))) # It's called 3 and 4-8 though in reality it's 3-4 and 5-8.
    pop_freq[[c]]$urbanity <- unlist(qs[c, c("Cities", "Towns.and.suburbs", "Rural")]/1000)
    pop_freq[[c]]$region <- unlist(qs[c, paste0("Region.", 1:5)]/1000)
    pop_freq[[c]]$employment_18_64 <- unlist(c(c("Inactive" = qs[c, "Inactivity"], "Unemployed" = qs[c, "Unemployment"]*(1000-qs[c, "Inactivity"])/1000, "Employed" =  1000-qs[c, "Inactivity"]-qs[c, "Unemployment"]*(1000-qs[c, "Inactivity"])/1000)*(1000-qs[c, c(">65")])/1000, "65+" = qs[c, c(">65")])/1000)
    # pop_freq[[c]]$vote <- unlist(c(c("Left" = qs[c, "Left"], "Center-right or Right" = qs[c, "Center-right.or.Right"], "Far right" = qs[c, "Far.right"])*(1000-qs[c, "Abstention"])/sum(qs[c, c("Left", "Center-right.or.Right", "Far.right")], na.rm = T), "Abstention" = qs[c, "Abstention"])/1000) # We exclude Other in this variant
    pop_freq[[c]]$vote <- unlist(c("Left" = qs[c, "Left"], "Center-right or Right" = qs[c, "Center-right.or.Right"], "Far right" = qs[c, "Far.right"], "Non-voter, PNR or Other" = sum(qs[c, "Abstention"], qs[c, "Vote_other"]))/1000) # We exclude Other in this variant
  }
  pop_freq$RU$education_quota["Not 25-64"] <- 0
}

votes_xlsx <- read.xlsx("../questionnaire/sources.xlsx", sheet = "Elections", cols = 1:6)
votes <- list()
for (c in unique(votes_xlsx$country)) votes[[c]] <- votes_xlsx[votes_xlsx$country == c, ]  
for (c in unique(votes_xlsx$country)) row.names(votes[[c]]) <- votes[[c]]$party


##### Functions #####
remove_id <- function(file, folder = "../data_raw/") {
  filename <- paste(folder, file, ".csv", sep = "")
  
  filename_copy <- paste("./deprecated/", file, sample.int(10^5, 1), ".csv", sep = "") # in case the three last lines don't work
  file.copy(filename, filename_copy)
  data <- read_csv(filename_copy)
  data <- data[,which(!(names(data) %in% c("PSID", "ResponseId", "PID", "tic", "interview")))]
  write_csv(data, filename, na = "")
  file.remove(filename_copy)
} 


# survey_list <- all_surveys()
# pilots <- paste0(c("PL", "GB", "US"), "p")
# pilot_names <- setNames(paste0(c("PL", "GB", "US"), "_pilot"), pilots)
# # cut=0 at March 4 2025, 00:05 Paris time (after 46 PL; 118 GB; 46 US)
# for (p in pilots) { # pilots
#   print(p)
#   data <- fetch_survey(survey_list$id[survey_list$name == pilot_names[p]], include_display_order = T, verbose = T, convert = F)
#   data <- data[,which(!(names(data) %in% c("PSID", "ResponseId", "PID", "tic", "IPAddress", "m")))]
#   for (v in names(data)) label(data[[v]]) <- c(v = paste0(v, ": ", label(data[[v]])))
#   write_csv(data, paste0("../data_raw/", p, ".csv"), na = "")
#   eval(str2expression(paste0(p, " <- read_csv('../data_raw/", p, ".csv')")))
#   saveRDS(label(data), paste0("../data_raw/labels/", p, ".rds"))
#   labels <- readRDS(paste0("../data_raw/labels/", p, ".rds"))
#   for (v in names(d(p))) eval(str2expression(paste0("label(", p, "[[v]]) <- labels[[v]]")))
# }
# USp <- fetch_survey(survey_list$id[survey_list$name == "US_pilot"], include_display_order = T, verbose = T, convert = F) # labels using sjlabelled package
# # write.csv(d("GBp"), paste0("../data_raw/GBp.csv"), quote = F, na = "", row.names = F)
# # Slightly different from manual export .csv: no second row with question text; timezone is different (in e.g. startDate); True => TRUE; income bug; some additional "" are removed
# View(GBp)
# 
# for (v in names(GBp)[1:80]) { print(decrit(v, GBp)); print("____________");}
# for (v in names(GBp)[81:160]) { print(decrit(v, GBp)); print("____________");}
# for (v in names(GBp)[161:240]) { print(decrit(v, GBp)); print("____________");}
# for (v in names(GBp)) if (grepl("Q_TotalDuration", v)) { print(decrit(as.numeric(GBp[[v]]))); print("____________");}
# 
# table(GBp$ncqg)
# table(GBp$group_defended)
# PLp$comment_field
# decrit(GBp$Q_TerminateFlag)

stats_exclude <- function(data_name, all = F, old_names = F) {
  cat("\n")
  cat(paste("\nSURVEY:", data_name))
  cat("\n\n")
  e <- read_csv(paste0("../data_raw/", data_name, ".csv"))
  # e <- d(data_name)
  # if (descr) {
  #   for (v in names(e)[1:80]) { print(decrit(v, e)); print("____________");}
  #   for (v in names(e)[81:160]) { print(decrit(v, e)); print("____________");}
  #   for (v in names(e)[161:211]) { print(decrit(v, e)); print("____________");}
  # }
  if (!old_names) {
    e$Finished <- e$finished
    e$Progress <- e$progress
  }
  if ("Finished...7" %in% names(e)) e$Finished <- e$Finished...7
  cat(paste0(nrow(e), " total obs.\n"))
  cat(paste0(round(100*sum(e$Q_TerminateFlag %in% "QuotaMet")/nrow(e), 1), "% quota met (incl. socio-demo screened)\n"))
  cat(paste0(round(100*sum(e$Q_TerminateFlag %in% "QuotaMet" & (e$income=="Prefer not to say" | e$urbanity %in% 0 | e$region %in% 0 | e$age_exact %in% "Below 18"))/nrow(e), 1), "% socio-demo screened\n"))
  if (all) cat(paste0(sum((!e$Q_TerminateFlag %in% "QuotaMet") & (e$income=="Prefer not to say" | e$urbanity %in% 0 | e$region %in% 0 | e$age_exact %in% "Below 18")), " socio-demo screened not flagged as Quota Met\n"))
  cat(paste0(round(100*sum(e$income %in% "Prefer not to say")/nrow(e), 1), "% socio-demo screened due to PNR income\n"))
  cat(paste0(round(100*sum(e$urbanity %in% 0 | e$region %in% 0)/nrow(e), 1), "% socio-demo screened due to unrecognized zipcode\n"))
  if (all) cat(paste0(round(100*sum(e$age_exact %in% "Below 18")/nrow(e), 1), "% socio-demo screened due to age < 18\n"))
  cat(paste0(sum(!e$Q_TerminateFlag %in% "QuotaMet"), " valid: not quota met or socio-demo screened \n"))
  cat(paste0(sum(e$Q_TerminateFlag %in% "Screened"), " screened after socio-demo\n"))
  if (all) cat(paste0(sum(e$Finished %in% c(TRUE, "TRUE", 1)), " finished\n"))
  if (all) cat(paste0(sum((!is.na(e$Q_TerminateFlag)) & !e$Q_TerminateFlag %in% c("Screened", "QuotaMet")), " unknown Q_TerminateFlag\n"))
  if (all) cat(paste0(round(100*sum(e$Q_TerminateFlag %in% "Screened")/nrow(e), 1), "% screened in total \n"))
  cat(paste0(round(100*sum(e$Q_TerminateFlag %in% "Screened")/sum(!e$Q_TerminateFlag %in% "QuotaMet"), 1), "% screened among valid \n"))
  cat(paste0(round(100*sum(e$Q_TerminateFlag %in% "Screened" & !(e$attention_test %in% "A little"))/sum(!e$Q_TerminateFlag %in% "QuotaMet"), 1), "% screened among valid due to failed attention_test\n"))
  cat(paste0(round(100*sum(e$Q_TerminateFlag %in% "Screened" & e$Q_TotalDuration < 360)/sum(!e$Q_TerminateFlag %in% "QuotaMet"), 1), "% screened among valid due to duration < 360\n"))
  cat(paste0(round(100*sum(e$Q_TerminateFlag %in% "Screened" & !(e$attention_test %in% "A little") & e$Q_TotalDuration < 360)/sum(!e$Q_TerminateFlag %in% "QuotaMet"), 1), "% screened among valid due to both reasons\n"))
  if (all) cat(paste0(sum((e$Q_TerminateFlag %in% "Screened" & (e$attention_test %in% "A little") & e$Q_TotalDuration >= 360) | # /!\ for pilot: replace 360 by 420
                            (is.na(e$Q_TerminateFlag) & ((!e$attention_test %in% "A little") | e$Q_TotalDuration < 360))), " unexplained screened or unexplained non-screened\n"))
  # if (all) cat(paste0(sum((e$Q_TerminateFlag %in% "Screened" & (e$attention_test %in% "A little") & e$Q_TotalDuration >= 420)), " unexplained screened\n"))
  # if (all) cat(paste0(sum((is.na(e$Q_TerminateFlag) & ((!e$attention_test %in% "A little") | e$Q_TotalDuration < 360))), " unexplained non-screened\n"))
  if (all) cat(paste0(sum(is.na(e$Q_TerminateFlag)), " legit: not quota met nor screened out\n"))
  cat(paste0(round(100*sum(!e$Finished %in% c(TRUE, "TRUE", 1))/sum(is.na(e$Q_TerminateFlag)), 1), "% dropout among legit\n")) # 13-23% dropout
  if (all) cat(paste0(round(100*sum(e$Finished %in% c(TRUE, "TRUE", 1) & is.na(e$Q_TerminateFlag))/sum(is.na(e$Q_TerminateFlag)), 1), "% finished among legit\n"))
  cat(paste0(sum(e$Finished %in% c(TRUE, "TRUE", 1) & is.na(e$Q_TerminateFlag)), " final: finished, not quota met nor screened out\n"))
  if (all) cat("Progress among legit\n")
  if (all) cat(decrit(e$Progress[(is.na(e$Q_TerminateFlag))], weight = F))
  if (all) cat(paste0(sum((is.na(e$Q_TerminateFlag)) & e$Finished %in% c(TRUE, "TRUE", 1)), " in final sample: finished and legit\n"))
  cat("Duration in final sample")
  print(decrit(e$Q_TotalDuration[(is.na(e$Q_TerminateFlag)) & e$Finished %in% c(TRUE, "TRUE", 1)]/60, weight = F))
  if (all) {
    cat("Duration in final sample for cut == 1\n")
    print(decrit(e$Q_TotalDuration[e$cut == 1 & (is.na(e$Q_TerminateFlag)) & e$Finished %in% c(TRUE, "TRUE", 1)]/60, weight = F))
    cat("Duration in final sample for cut == 0\n")
    print(decrit(e$Q_TotalDuration[e$cut == 0 & (is.na(e$Q_TerminateFlag)) & e$Finished %in% c(TRUE, "TRUE", 1)]/60, weight = F))
    cat("Duration in final sample for long\n")
    print(decrit(e$Q_TotalDuration[e$long > .42 & (is.na(e$Q_TerminateFlag)) & e$Finished %in% c(TRUE, "TRUE", 1)]/60, weight = F))
    cat("Duration in final sample for short\n")
    print(decrit(e$Q_TotalDuration[e$long < .42 & (is.na(e$Q_TerminateFlag)) & e$Finished %in% c(TRUE, "TRUE", 1)]/60, weight = F))
  }
  print(summary(lm(Q_TotalDuration/60 ~ (long > .42) , data = e, subset = ((is.na(e$Q_TerminateFlag)) & e$Finished %in% c(TRUE, "TRUE", 1)))))
  if (all) print(summary(lm(Q_TotalDuration/60 ~ (long > .42) * cut, data = e, subset = ((is.na(e$Q_TerminateFlag)) & e$Finished %in% c(TRUE, "TRUE", 1)))))
  cat("___________________________________________")
}
# for (p in pilots) stats_exclude(p)
# stats_exclude("USp")
# e <- read_csv(paste0("../data_raw/USp.csv"))
# write.csv(e$zipcode[e$urbanity %in% 0], "../data_ext/unrecognized_zipcodes_US.csv", quote = F, row.names = F)

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

prepare <- function(country = "US", scope = "final", fetch = T, convert = T, rename = T, duration_min = if (country != "RU") 360 else 200, pilot = FALSE, weighting = TRUE, remove_id = NULL) { # scope: all, stayed, final
  print(country)
  sample_name <- paste0(country, if (pilot) "p" else NULL)
  if (is.null(remove_id)) remove_id <- sample_name != "USp"
  if (country != "RU") {
    if (fetch) {
      print(country)
      survey_list <- all_surveys()
      e <- fetch_survey(survey_list$id[survey_list$name == paste0(country, if (pilot) "_pilot" else "_survey")], include_display_order = T, verbose = T, convert = F, col_types = cols("m" = col_character()))
      if (!remove_id) e$ExternalReference <- e$m
      if (!remove_id) e$DistributionChannel <- e$IPAddress
      if (remove_id) e$interview <- grepl("@", e$interview)
      e <- e[,which(!(names(e) %in% c("PSID", "ResponseId", "PID", "tic", "IPAddress", "m")))]
      if (rename) e <- rename_survey(e, pilot = pilot)
      for (v in names(e)) label(e[[v]]) <- c(v = paste0(v, ": ", gsub("\n", "§", label(e[[v]]))))
      write_csv(e, paste0("../data_raw/", sample_name, ".csv"), na = "")
      saveRDS(label(e), paste0("../data_raw/labels/", sample_name, ".rds"))
      e <- read_csv(paste0("../data_raw/", sample_name, ".csv"), guess_max = Inf)
    }
    e <- read_csv(paste0("../data_raw/", sample_name, ".csv"), guess_max = Inf)
    labels <- readRDS(paste0("../data_raw/labels/", sample_name, ".rds"))
    for (v in names(e)) label(e[[v]]) <- labels[[v]]
  } else {
    e <- read_sav("../data_raw/RU.sav")
    e <- e[-c(1:2),] # Remove test rows 
    for (v in names(rename_ru)) names(e)[names(e) == v] <- rename_ru[v]
    for (v in names(e)) e[[v]] <- as.character(as_factor(e[[v]]))
    e$excluded <- ifelse(e$attention_test %in% c("A little", "Немного") & (n(e$duration) > duration_min), NA, e$attention_test)
    e$progress <- 100    
    e$finished <- e$finished %in% c("Завершен", "Finished")
    for (v in c(variables_well_being, "hh_size", "Nb_children__14", "duration", "revenue_split", "gcs_belief_own")) e[[v]] <- as.numeric(gsub("[^0-9\\.]*", "", e[[v]]))
  }
  
  if (convert) {
    all_na <- c()
    for (v in 1:ncol(e)) if (all(is.na(e[[v]])) & is.na(names(e)[[v]])) all_na <- c(all_na, v)
    e <- e[, setdiff(1:ncol(e), all_na)]
    
    e$fast <- n(e$duration) < duration_min
    label(e$fast) <- paste0("fast: T/F duration < ", duration_min/60, " min")
    # e$excluded <- e$Q_TerminateFlag
    # e$finished <- e$Finished
    e$valid <- !e$excluded %in% "QuotaMet" 
    label(e$valid) <- "valid: T/F Allowed to continue after socio-demos: Not quota met (excluded != QuotaMet)"
    e$legit <- is.na(e$excluded) 
    label(e$legit) <- "legit: T/F Not excluded (not quota met nor screened) (is.na(excluded))"
    e$dropout <- is.na(e$excluded) & !e$finished %in% c(TRUE, "TRUE", 1, "1") 
    label(e$dropout) <- "dropout: T/F Chose to leave the survey (is.na(excluded) & !finished)"
    e$stayed <- e$finished %in% c(TRUE, "TRUE", 1, "1") & !e$excluded %in% "QuotaMet" # includes failed attention_test
    label(e$stayed) <- "stayed: T/F Did not drop out (excluded != QuotaMet & finished)" # Includes Screened (fast or quality) but excludes dropout
    e$final <- is.na(e$excluded) & e$finished %in% c(TRUE, "TRUE", 1, "1") 
    label(e$final) <- "final: T/F In Final sample (!excluded & finished)"
    # progress_socio <- if (country == "US1") 19 else { if (country == "US2") 14 else 15 }
    e$dropout_late <- e$dropout & e$progress >= 30
    label(e$dropout_late) <- "dropout: Respondent who did not complete the survey though was not excluded, and who dropped out after the socio-demographic questions." 
    if (scope %in% names(e)) e <- e[e[[scope]] == T,]
    
    e <- convert(e, country = country, pilot = pilot, weighting = weighting)
    e <- e[,!duplicated(names(e))]
  }
  
  if (weighting) {
    e$weight_country <- e$weight <- weighting(e, country)
    label(e$weight_country) <- "weight_country: [0.25; 4] Weight to adjust to country demographics. Sums to nrow([country]). Quota variables used: quotas$[country], with frequencies pop_freq$[country]."
    label(e$weight) <- "weight: Weight for the international sample: weight_country is rescaled so that each country is weighted according to its adult population. Sums to nrow(all). (Created outside 'prepare')"
    # e$weight_all <- weighting(e, country, variant = "all") 
    if ("vote" %in% names(e)) e$weight_vote <- weighting(e, country, variant = "vote") # ("vote_us" %in% names(e) & (sum(e$vote_us=="PNR/no right")!=0)) | ("vote" %in% names(e))
    else e$weight_vote <- e$weight
    label(e$weight_vote) <- "weight_vote: [0.25; 4] Weight to adjust to country demographics. Sums to nrow([country]). Quota variables used: vote, quotas$[country], with frequencies pop_freq$[country]."
    # if (country == "EU") { for (c in countries_EU) e$weight_country[e$country == c] <- weighting(e[e$country == c,], c) } else e$weight_country <- e$weight
    if (any(e$custom_redistr_asked) & !pilot) e <- compute_custom_redistr(e, name = paste0(country, if (pilot) "p")) # TODO make it work for pilot
  } else {
    # e$weight <- e$weight_country <- 1
  }
  
  if (sample_name == "USp") {
    invalid_IDs <- read.csv("../data_ext/invalid_IDs_USp.csv", colClasses = "character")[[1]]
    # print(decrit(e$gender[e$id %in% invalid_IDs], weight = F))
    # print(decrit(e$age[e$id %in% invalid_IDs], weight = F))
    # print(decrit(e$education[e$id %in% invalid_IDs & e$age > 25 & e$age < 65], weight = F))
    # e$urban_rural <- e$urbanity
    # e <- create_item("urban_rural", labels = c("Cities" = 1, "Rural" = 2), values = list(1, c(2:4)), df = e)
    # print(decrit(e$urban_rural[e$id %in% invalid_IDs], weight = F))
    # print(decrit(e$income_quartile[e$id %in% invalid_IDs], weight = F))
    # print(decrit(e$region[e$id %in% invalid_IDs], weight = F))
    # print(decrit(e$race[e$id %in% invalid_IDs], weight = F))
    e <- e[!e$id %in% invalid_IDs, ]
    if (remove_id) e$id <- NA
  }
  
  return(e)
}

define_var_lists <- function() {
  text_support <<- c("Strongly oppose","Somewhat oppose","Indifferent","Somewhat support","Strongly support")
  text_pnr <<- c("Prefer not to say")
  base_solidarity_support <<- c("billionaire_tax", "corporate_tax", "expanding_security_council", "foreign_aid", "debt_relief", "bridgetown", "loss_damage", "ncqg_300bn", "shipping_levy", "aviation_levy")
  variables_solidarity_support <<- paste0("solidarity_support_", base_solidarity_support)
  variables_solidarity_support_order <<- paste0("solidarity_support_order_", base_solidarity_support)
  variables_solidarity_no_commitment <<- c("solidarity_support_billionaire_tax", "solidarity_support_corporate_tax", "solidarity_support_expanding_security_council",  
                                     "solidarity_support_debt_relief", "solidarity_support_bridgetown", "solidarity_support_aviation_levy")
  variables_solidarity_no_info <<- c("solidarity_support_debt_relief", "solidarity_support_aviation_levy")
  variables_solidarity_support_control <<- paste0(variables_solidarity_support, "_control")
  variables_solidarity_support_short <<- paste0(c("solidarity_support_billionaire_tax", "solidarity_support_corporate_tax", "solidarity_support_expanding_security_council", "solidarity_support_foreign_aid", 
                                     "solidarity_support_bridgetown"), "_short")
  # variables_support <<- names(e)[grepl('support', names(e))]
  variables_wealth_tax_support <<- c("global_tax_support", "hic_tax_support", "intl_tax_support")
  variables_top_tax_support <<- c("top1_tax_support", "top3_tax_support")
  variables_top_tax_support_affected <<- paste0(c("top1_tax_support", "top3_tax_support", "top_tax_support"), "_affected")
  variables_likert <<- c(variables_solidarity_support, variables_top_tax_support, "top_tax_support", variables_top_tax_support_affected, paste0(variables_top_tax_support, "_cut"), "reparations_support", variables_solidarity_support_short)
  variables_yes_no <<- c("ncs_support", "gcs_support", "ics_support", variables_wealth_tax_support, "couple")
  variables_race <<- c("race", "race_white", "race_black", "race_hispanic", "race_asian", "race_native", "race_hawaii", "race_other", "race_pnr")
  variables_home <<- c("home_tenant", "home_owner", "home_landlord", "home_hosted")
  variables_global_movement <<- c("global_movement_no", "global_movement_spread", "global_movement_demonstrate", "global_movement_strike", "global_movement_donate")
  variables_global_movement_all <<- c(variables_global_movement, "global_movement_support", "global_movement_part")
  variables_why_hic_help_lic <<- c("why_hic_help_lic_responsibility", "why_hic_help_lic_interest", "why_hic_help_lic_duty", "why_hic_help_lic_none")
  variables_custom_redistr <<- c("custom_redistr_satisfied", "custom_redistr_skip")
  variables_custom_redistr_param <<- c("custom_redistr_winners", "custom_redistr_losers", "custom_redistr_degree")
  variables_custom_redistr_most <<- c(variables_custom_redistr_param, "custom_redistr_income_min", "custom_redistr_transfer", "custom_redistr_self_lose", variables_custom_redistr)
  variables_variant <<- c("variant_split", "variant_warm_glow", "variant_realism", "variant_ncqg_maritime", "variant_radical_redistr", "variant_ics", "variant_sliders", "variant_radical_transfer", 
                          "variant_synthetic", "variant_comprehension", "variant_belief", "variant_field", "variant_sliders", "variant_wealth_tax")
  # variables_variant_binary <<- c("variant_split", "variant_realism", "variant_ncqg_maritime", "variant_radical_redistr", "variant_sliders", "variant_radical_transfer", 
  #                                "variant_synthetic", "variant_comprehension", "variant_belief")
  variables_binary <<- c(variables_race[-1], variables_home, variables_global_movement, variables_why_hic_help_lic, variables_custom_redistr)
  variables_duration <<- c("duration", "duration_consent", "duration_socios_demos", "duration_field", "duration_conjoint", "duration_global_tax", "duration_warm_glow_substitute", "duration_gcs", 
                           "duration_ics", "duration_warm_glow_realism", "duration_ncqg_maritime", "duration_wealth_tax", "duration_preferred_transfer_mean", "duration_radical_redistr", 
                           "duration_custom_redistr", "duration_well_being", "duration_scenarios_tax", "duration_end", "duration_extra", "duration_main_questions", "duration_feedback")
  base_split_many_global <<- c("education_healthcare", "renewables_adaptation", "loss_damage", "forestation")
  base_split_many_domestic <<- c("education", "healthcare", "defense", "deficit_reduction", "justice_police", "pensions", "welfare", "infrastructure", "tax_reduction")
  base_split_many <<- c(paste0("domestic_", base_split_many_domestic), paste0("global_", base_split_many_global))
  base_split_few <<- rev(c("domestic_education_healthcare", "domestic_welfare", "domestic_tax_reduction", "domestic_deficit_reduction", "global"))
  variables_split_few <<- paste0("revenue_split_few_", base_split_few)
  variables_split_many_domestic <<- paste0("revenue_split_many_domestic_", base_split_many_domestic)
  variables_split_many_global <<- paste0("revenue_split_many_global_", base_split_many_global)
  variables_split_many <<- c(variables_split_many_global, variables_split_many_domestic)
  variables_split_many_order <<- paste0("revenue_split_many_order_", base_split_many)
  variables_split_few_order <<- paste0("revenue_split_few_order_", base_split_few)
  variables_random_order <<- c(variables_solidarity_support_order, variables_split_few_order, variables_split_many_order)
  list_random_order <<- list("solidarity_support_" = base_solidarity_support, "revenue_split_few_" = base_split_few, "revenue_split_many_" = base_split_many)
  variables_split_few_by_order <<- paste0("revenue_split_few_order_", 1:5)
  variables_split_many_by_order <<- paste0("revenue_split_many_order_", 1:5)
  variables_solidarity_support_by_order <<- paste0("solidarity_support_order_", 1:length(base_solidarity_support))
  variables_split_few_agg <<- paste0(variables_split_few, "_agg")
  variables_split_many_domestic_agg <<- paste0(variables_split_many_domestic, "_agg")
  variables_split_many_global_agg <<- paste0(variables_split_many_global, "_agg")
  variables_split_many_agg <<- paste0(variables_split_many, "_agg")
  variables_maritime_split <<- rev(c("maritime_split_ldc", "maritime_split_companies", "maritime_split_decarbonization"))
  variables_split <<- c(variables_split_few, variables_split_many, variables_maritime_split)
  variables_split_agg <<- c(variables_split_few_agg, variables_split_many_agg)
  variables_numeric <<- c(variables_duration, "hh_size", "Nb_children__14", "donation", "gcs_belief_us", "gcs_belief_own", variables_split)
  variables_gcs_belief <<- c("gcs_belief_own", "gcs_belief_us")
  variables_ics <<- rev(c("ics_high_color_support", "ics_high_support", "ics_mid_support", "ics_low_support"))
  variables_gcs_all <<- c("gcs_support", variables_gcs_belief)
  variables_gcs_ics <<- c("gcs_support", variables_ics) 
  variables_gcs_ics_all <<- c("gcs_support", variables_gcs_belief, variables_ics)
  variables_ncs_gcs_ics <<- c("ncs_support", "gcs_support", variables_ics)
  variables_ncs_gcs_ics_control <<- c("ncs_support", "gcs_support_control", variables_ics)
  variables_ncs_gcs_ics_all <<- c("ncs_support", "gcs_support", variables_gcs_belief, variables_ics)
  variables_ncs_gcs_ics_all_control <<- c("ncs_support", "gcs_support_control", variables_gcs_belief, variables_ics)
  variables_well_being <<- c("well_being_gallup_0", "well_being_wvs_0", "well_being_gallup_1", "well_being_wvs_1")
  variables_transfer_how <<- c("transfer_how_agencies", "transfer_how_govt_conditional", "transfer_how_govt_unconditional", "transfer_how_local_authorities", 
                              "transfer_how_ngo", "transfer_how_social_protection", "transfer_how_cash_unconditional")
  variables_sustainable_future <<- c("sustainable_future_a", "sustainable_future_s", "sustainable_future_b")
  variables_radical_redistr <<- c(variables_top_tax_support, "sustainable_future", "convergence_support", "global_movement_support", "vote_intl_coalition", "reparations_support", "my_tax_global_nation")
  variables_group_defended_5 <<- c("universalist", "antispecist", "humanist", "nationalist", "individualist")
  variables_group_defended_4 <<- c("antispecist", "humanist", "nationalist", "individualist")
  variables_group_defended_3 <<- c("universalist", "nationalist", "individualist")
  variables_field <<- paste0(c("wish", "issue", "concerns", "injustice"), "_field")
  variables_field_all <<- c(variables_field, "comment_field")
  variables_conjoint_domains <<- c("F-1-1", "F-1-2", "F-1-3", "F-1-4", "F-1-5") # , "F-1-6"
  variables_conjoint_policies_1 <<- c("F-1-1-1", "F-1-1-2", "F-1-1-3", "F-1-1-4", "F-1-1-5")
  variables_conjoint_policies_2 <<- c("F-1-2-1", "F-1-2-2", "F-1-2-3", "F-1-2-4", "F-1-2-5")
  variables_conjoint_policies <<- c("F-1-1-1", "F-1-1-2", "F-1-1-3", "F-1-1-4", "F-1-1-5", "F-1-2-1", "F-1-2-2", "F-1-2-3", "F-1-2-4", "F-1-2-5") #, "F-1-1-6", "F-1-2-6"
  variables_conjoint_policies_original <<- paste0(variables_conjoint_policies, "_original")
  # View(all[sapply(1:nrow(all), function(i) any(is.na(all[i, variables_conjoint_policies])) & all$country[i]!="SA"), c(as.vector(sapply(variables_conjoint_policies, function(v) c(v, paste0(v, "_original")))), "n", "conjoint_misleading")])
  # na_policies <- c()
  # for (i in 1:nrow(all)) {
  #   for (j in variables_conjoint_policies) if (is.na(all[i,j]) & all$country[i] != "SA") na_policies <- c(na_policies, all[i, paste0(j, "_original")])
  # }
  # unique(na_policies)
  correct_policies <<- c("36" = "econ_issues2", # "Reducir la semana laboral a 36 horas antes de 2030 sin merma salaria",
                        "Mindestquote" = "-", # /!\ DE climate_pol3, removed after 14 respondents got it: "Einführung einer Mindestquote für grünen Stahl und Zement im öffentlichen Beschaffungswesen"
                        "Milliarden" = "econ_issues3", # "500 Milliarden Euro in strategische Sektoren wie Stahl, Automobilindustrie und Verteidigung investieren",
                        "Geburt" = "society_issues2", # "20.000 € staatlicher Zuschuss bei Geburt eines Kindes",
                        "Überstunden" = "tax_system1", # "Keine Steuern auf Überstunden und Arbeit im Rentenalter",
                        "aislamiento" = "-", # /!\ ES climate_pol2, replaced (by plan...agua) after 32 respondents got it: "Plan de aislamiento térmico"
                        "Millionärssteuer" = "foreign_policy1", # "Internationale Millionärssteuer mit 30 % zur Finanzierung von Gesundheit und Bildung in Ländern mit niedrigem Einkommen",
                        "28" = "tax_system2", # "Raise the capital gains tax rate to 28% for individuals earning over $1 million",
                        "cartels" = "society_issues3", # "Deploy U.S. troops against drug cartels in Mexico",
                        "Zones" = "climate_pol2", # "Supprimer les Zones à Faibles Émissions (ZFE)",
                        "jeunes" = "tax_system2", # "Exonérer d’impôt sur le revenu les jeunes de moins de 30 ans",
                        "Défiscaliser" = "tax_system1", # "Défiscaliser les primes jusqu’à 10 000 € par an",
                        "moteur" = "climate_pol1") # "Éliminer progressivement les voitures à moteur à combustion d'ici à 2040")
  variables_conjoint_all <<- c(variables_conjoint_domains, variables_conjoint_policies)
  variables_conjoint_consistency <<- c("consistent_conjoints", paste0(c("consistent_conjoint_", "leaning_conjoint_"), c(1,1,2,2)))
  variables_conjoint_consistency_strict <<- paste0(variables_conjoint_consistency, "_strict")
  variables_conjoint_consistency_party <<- paste0(variables_conjoint_consistency, "_party")
  variables_conjoint_consistency_party_strict <<- paste0(variables_conjoint_consistency, "_party_strict")
  variables_conjoint_consistency_all <<- c(variables_conjoint_consistency, variables_conjoint_consistency_strict, variables_conjoint_consistency_party, variables_conjoint_consistency_party_strict)

  # Categories proposed by GPT-4.1 based on the excerpt:
  {
  # Cost of Living / Inflation / Prices
  # Employment / Unemployment / Job Security
  # Income Inequality / Poverty / Wealth Distribution
  # Health (Personal or Public) / Healthcare
  # Immigration / Illegal Immigration
  # Political Concerns / Government / Corruption
  # Climate Change / Environment
  # Education / Cost of Education / Access to Education
  # Violence / Crime / Security / Law and Order
  # Discrimination / Racism / Gender Inequality
  # Housing / Homelessness
  # Freedom / Rights / Civil Liberties
  # Family / Children / Childcare
  # Wishes for Personal Wellbeing / Happiness / Peace
  # International Issues / War / Conflict
  # Retirement / Elderly Care / Social Security
  # Taxes / Tax System
  # Social Support / Welfare / Government Support
  # Misinformation / Media / Social Trust
  # Other / None / Not Sure / Miscellaneous
  
  # Categories that used for GPT classification (GPT proposed that I manually adjusted to add categories that I noticed myself):
  # Cost of Living / Inflation / Prices / Own level of income
  # cost_of_living
  # Love / Relationships
  # relationships
  # Employment / Unemployment / Job Security
  # employment
  # Income Inequality / Poverty / Wealth Distribution
  # income_inequality
  # Global Inequality / Global poverty / Hunger or poverty in poor countries
  # global_inequality
  # Health (Personal or Public) / Healthcare
  # healthcare
  # Immigration / Illegal Immigration
  # immigration
  # Corruption / Distrust of government
  # corruption
  # Climate Change / Environment
  # environment
  # Violence / Crime / Security / Law and Order
  # security
  # Discrimination / Racism / Gender Inequality
  # discrimination
  # Freedom / Rights / Civil Liberties / Slavery
  # freedom
  # Happiness / Personal Wellbeing
  # wellbeing
  # War / Peace
  # war_peace
  # Taxes / Tax System / Social Security / Welfare benefits / Public services
  # taxes_welfare
  # Criticism of far right policies / Criticism of Donald Trump
  # far_right_criticism
  # Misinformation / Media / Social Trust
  # misinformation
  # Animals
  # animals
  # Religion
  # religion
  # Housing / Homelessness
  # housing
  # Education / Cost of Education / Access to Education
  # education
  # Retirement / Older age
  # retirement
  # Family / Children
  # family
  # Global issue / International issue
  # global_issue
  # Own country
  # own_country
  # Empty / Nothing in particular
  # empty
  # Other / Not Sure / Miscellaneous
  # other
  # keywords <- c("ealth", "country|German|german|saudi|Saudi|France|French|france|french|Ital|ital|poland|Poland|Polish|polish|Spain")
}
   keywords <<- c("money" = "money|inflation|price|wage|wealth|income|salar|finance|cost|financial|afford|illionaire|expensive",
                 "relationships" = "relationship|husband|wife|love|partner|emotion", # also includes emotions
                 "job" = "business|work|employ|job",
                 "inequality" = "poverty|inequalit|poor|social justice",
                 "global_inequality" = "global poverty|global inequal|hunger|drinking water|starv",
                 "health" = "health|sick|disease|NHS|medica", 
                 "immigration" = "migration|migrant|asylum|refugee|alien",
                 "corruption" = "corruption",
                 "environment" = "environment|climat|pollution|warming|drought",
                 "security" = "safe|murder|crime|criminal|fraud|rape|terrorism",
                 "discrimination" = "gender|raci|scrimination|women|xenophob|LGB|machism|antisemit",
                 "rights" = "freedom|rights|democra|dictator",
                 "happiness" = "happiness|happy|serenity|peace of mind|tranquility|inner peace|relax", # What do people mean by inner peace? What hassles occupy their mind? In what sense is their life not peaceful?
                 "war_peace" = "peace|war|WW",
                 "taxes_welfare" = "tax|social benefit|social security",
                 "far_right_criticism" = "Trump|AfD|populist|far right|radical right|extreme right|tariff| PiS |fascism",
                 "mistrust" = "social division|social cohesion|media|fake news",
                 "animals" = "animal",
                 "religion" = "religion| god|self injustice|self-injustice|theism|disbelief",
                 "housing" = "hous|apartment|real estate|mortgage",
                 "education" = "education|school|exam|universit",
                 "old_age" = "old age|pension|retire| aging| ageing",
                 "family" = "family|child|daughter| son|parent|mother|father|loved ones|kids", # my child?
                 "global_issue" = "world|humanity|foreign|countries|Ukraine|Gaza|Palestin|Hamas|Israel|Yemen|Sudan|middle east|Iran|geopol",
                 "own_country" = "country|German|Saudi|France|French|Ital|Poland|Polish|Spain|Spanish| UK|U.K.|Great Britain|England|British|Japan|Russia|America|U.S.| USA|United States", 
                 "nothing" = "^nothing$|^no$|^.$|^-$|^do not have$|^nothing in particular$|^None$|^I don't know$|^I would not know$",
                 "economy" = "econom|growth", # Not manually assigned to any category. What do people mean by "the economy"? purchasing power? hint: "Stable economic growth will ensure that current savings do not depreciate and funds for retirement are secured."
                 "media" = "internet|media",
                 "trump" = "Trump",
                 "tariff" = "tariff|customs dut|custom dut",
                 "gaza" = "Palestine|Gaza",
                 "car" = " car",
                 "mental" = " mental |mental health",
                 "sport" = "sport|soccer",
                 "holiday" = "travel|vacation|holiday| rest",
                 "time" = " time|leisure", # merge with previous?
                 "politics" = "politic",
                 "millionaire" = "illionaire",
                 "inflation" = "inflation|rising price|cost of living",
                 "abortion" = "abort", 
                 "stock" = "investment|asset|stock",
                 "birthrate" = "birth rate|birthrate",
                 "government" = "government|president|PSOE|Sanchez|Sánchez|Liberal Democratic Party|LDP|Komeito|Tusk|Nawrocki| PO |Macron|Trump|Meloni|Starmer|Labour",
                 "hunger" = "hunger", # do they mean in the world or in their country? 
                 "stability" = "stability|stabl", # What do people mean by economic stability (or financial security)? Is it job security, stable earnings, higher wealth...?
                 "wage" = "wage|salar",
                 "youth" = "young|youth") 
  variables_field_keyword <<- paste0("field_keyword_", names(keywords))
  variables_field_keyword_main <<- paste0("field_keyword_", c("money", "health", "own_country", "family", "war_peace", "job", "nothing", "government", "economy", "inflation", "global_issue", "inequality",
                                                         "taxes_welfare", "immigration", "security", "far_right_criticism", "environment", "old_age", "rights", "discrimination", "housing", "trump", "happiness", "relationships"))
  keywords_labels <<- c("money" = "Money; own income; cost of living; inflation",
                        "relationships" = "Relationships; love; emotions", 
                        "job" = "Work; (un)employment; business",
                        "inequality" = "Poverty; inequality",
                        "global_inequality" = "Global poverty; hunger; global inequality",
                        "health" = "Health; healthcare system", 
                        "immigration" = "Criticism of immigration; national preference",
                        "corruption" = "Corruption; criticism of the government",
                        "environment" = "Environment; climate change",
                        "security" = "Security; violence; crime; judicial system",
                        "discrimination" = "Discrimination; gender inequality; racism; LGBT",
                        "rights" = "Rights; democracy; freedom; slavery",
                        "happiness" = "Happiness; peace of mind", 
                        "war_peace" = "War; peace",
                        "taxes_welfare" = "Tax system; welfare benefits; public services",
                        "far_right_criticism" = "Criticism of far right; Trump; tariffs",
                        "mistrust" = "Social division; fake news; (social) media",
                        "animals" = "Animal welfare",
                        "religion" = "Religion; sin; God",
                        "housing" = "Housing",
                        "education" = "Education",
                        "old_age" = "Old age; retirement; ageing society",
                        "family" = "Family; children; childcare", 
                        "global_issue" = "International issues",
                        "own_country" = "Own country referred", 
                        "other" = "Other topic; unclear; vague",
                        "nothing" = "Nothing; don't know; empty",
                        
                        "economy" = "Economy", 
                        "media" = "Media",
                        "trump" = "Trump",
                        "tariff" = "Tariffs",
                        "gaza" = "Palestine",
                        "car" = "Car",
                        "mental" = "Mental health",
                        "sport" = "Sport",
                        "holiday" = "Holiday; travel",
                        "time" = "Time; more free time", 
                        "politics" = "Politics",
                        "millionaire" = "Millionaire; billionaire",
                        "inflation" = "Inflation; cost of living",
                        "abortion" = "Abortion", 
                        "stock" = "Stock; investment",
                        "birthrate" = "Birthrate",
                        "government" = "Government; president",
                        "hunger" = "Hunger",
                        "stability" = "Stability", 
                        "wage" = "Wage",
                        "youth" = "Youth")
  field_names <<- c("Cost of Living / Inflation / Prices / Own level of income" = "money",
                    "Love / Relationships" = "relationships",
                    "Employment / Unemployment / Job Security" = "job",
                    "Income Inequality / Poverty / Wealth Distribution" = "inequality",
                    "Inequality at the inetrnational level / Hunger or poverty in poor countries" = "global_inequality",
                    "Health (Personal or Public) / Healthcare" = "health",
                    "Immigration / Illegal Immigration" = "immigration",
                    "Corruption / Distrust of government" = "corruption",
                    "Climate Change / Environment" = "environment",
                    "Violence / Crime / Security / Law and Order" = "security",
                    "Discrimination / Racism / Gender Inequality" = "discrimination",
                    "Freedom / Rights / Civil Liberties / Slavery" = "rights",
                    "Happiness / Personal Wellbeing" = "happiness",
                    "War / Peace" = "war_peace",
                    "Taxes / Tax System / Social Security / Welfare benefits / Public services" = "taxes_welfare",
                    "Criticism of far right policies / Criticism misinformation Donald Trump" = "far_right_criticism",
                    "Misinformation / Media / Social Trust" = "mistrust",
                    "Animals" = "animals",
                    "Religion" = "religion",
                    "Housing / Homelessness" = "housing",
                    "Education / Cost of Education / Access to Education" = "education",
                    "Retirement / Older age" = "old_age",
                    "Family / Children" = "family",
                    "Global issue / International issue" = "global_issue",
                    "Own country" = "own_country",
                    "Other / Not Sure / Miscellaneous" = "other",
                    "Empty / Nothing in particular" = "nothing")
  variables_field_gpt <<- paste0("field_gpt_", field_names)
  variables_field_manual <<- paste0("field_manual_", field_names)
  
  keywords_comment <<- c("good" = "good|great|amazing|best survey| fun|love|enjoy",
                         "interesting" = "interest|thought provoking|food for though|informative|learn",
                         "thanks" = "thank",
                         "difficult" = "difficult|confus",
                         "nothing" = "no comment|nothing in particular|^nothing$|^none$",
                         # "witty" = "thought provoking|food for though|informative|learn",
                         "empty" = "^$",
                         "corruption" = "corrupt")
  variables_comment_keyword <<- paste0("comment_keyword_", names(keywords_comment))
  keywords_comment_labels <<- c("good" = "Compliment",
                                "interesting" = "Interesting",
                                "thanks" = "Thank",
                                "difficult" = "Difficult",
                                "nothing" = "Nothing",
                                # "witty" = "thought provoking|food for though|informative|learn",
                                "empty" = "Empty",
                                "corruption" = "Corruption")
  comment_names <<- c("Nothing / No comment" = "nothing",
                      "Thank you" = "thanks",
                      "Praise survey" = "praise",
                      "Criticize survey" = "criticize",
                      "Confusing/difficult" = "difficult",
                      "Pro global redistribution" = "pro_global_redistr",
                      "Doubt global redistribution" = "anti_global_redistr",
                      "Pro climate action" = "pro_climate",
                      "Doubt climate action" = "anti_climate",
                      "Other / Vague / Unclassifiable" = "other")
  variables_comment_gpt <<- paste0("comment_gpt_", comment_names)
  variables_comment_manual <<- paste0("comment_manual_", comment_names)
  rename_ru <<- c("timeStart" = "date", "timeFinish" = "date_end", "surveyDuration" = "duration", "surveyId" = "id", "surveyFinishStatus" = "finished", "age" = "age_exact", 
                 "home_1" = "home_tenant", "home_2" = "home_owner", "home_3" = "home_landlord", "home_4" = "home_hosted", #"ncs_support" = "ncs_support_unused", "ncs_support_bis" = "ncs_support",
                 "support_council_treated_r1" = "solidarity_support_expanding_security_council_control", "support_billionaire_tax_treated_r2" = "solidarity_support_billionaire_tax_treated", "support_corporate_tax_treated_r3" = "solidarity_support_corporate_tax_treated", "support_foreign_aid_treated_r4" = "solidarity_support_foreign_aid_treated", 
                 "support_debt_relief_treated_r5" = "solidarity_support_debt_relief_treated", "support_bridgetown_treated_r6" = "solidarity_support_bridgetown_treated", "support_aviation_levy_treated_r7" = "solidarity_support_aviation_levy_treated", "support_loss_damage_treated_r8" = "solidarity_support_loss_damage_treated", "support_ncqg_300bn_treated_r9" = "solidarity_support_ncqg_300bn_treated", "support_shipping_levy_treated_r10" = "solidarity_support_shipping_levy_treated", 
                 "support_billionaire_tax_control_r1" = "solidarity_support_billionaire_tax_control", "support_corporate_tax_control_r2" = "solidarity_support_corporate_tax_control", "support_foreign_aid_control_r3" = "solidarity_support_foreign_aid_control", 
                 "support_debt_relief_control_r4" = "solidarity_support_debt_relief_control", "support_bridgetown_control_r5" = "solidarity_support_bridgetown_control", "support_aviation_levy_control_r9" = "solidarity_support_aviation_levy_control", "support_loss_damage_control_r6" = "solidarity_support_loss_damage_control", "support_ncqg_300bn_control_r7" = "solidarity_support_ncqg_300bn_control", "support_shipping_levy_control_r8" = "solidarity_support_shipping_levy_control", 
                 "transfer_how_agencies_r1" = "transfer_how_agencies", "transfer_how_govt_conditional_r2" = "transfer_how_govt_conditional", "transfer_how_govt_unconditional_r3" = "transfer_how_govt_unconditional", "transfer_how_local_authorities_r4" = "transfer_how_local_authorities", "transfer_how_ngo_r5" = "transfer_how_ngo", "transfer_how_social_protection_r6" = "transfer_how_social_protection", "transfer_how_cash_unconditional_r7" = "transfer_how_cash_unconditional", 
                 "why_hic_help_lic_1" = "why_hic_help_lic_responsibility", "why_hic_help_lic_2" = "why_hic_help_lic_interest", "why_hic_help_lic_3" = "why_hic_help_lic_duty", "why_hic_help_lic_4" = "why_hic_help_lic_none")
  relevel_ru <<- list("gender" = c("Женщина" = "Woman", "Мужчина" = "Man"), # TODO: check age all between 18-100
                     "foreign" = c("Нет," = "No, I was born in this country and my parents too", "один" = "Not me but one of my parents was born in a foreign country", "оба" = "Not me but both my parents were born in a foreign country", "Да," = "Yes, I was born in a foreign country"),
                     "income" = c("менее 35 000 руб." = "less than $100", "от 35 001 руб. до 50 000 руб." = "between $100 and $200", "от 50 001 руб. до 55 000 руб." = "between $201 and $250", "от 55 001 руб. до 60 000 руб." = "between $251 and $300", "от 60 001 руб. до 75 000 руб." = "between $301 and $400", 
                                  "от 75 001 руб. до 85 000 руб." = "between $401 and $500", "от 85 001 руб. до 100 000 руб." = "between $501 and $600", "от 100 001 руб. до 120 000 руб." = "between $601 and $700", "от 120 001 руб. до 130 000 руб." = "between $701 and $750", "от 130 001 руб. до 145 000 руб." = "between $751 and $800", 
                                  "от 145 001 рублей до 190 000 руб." = "between $801 and $900", "более 190 000 руб." = "more than $900", "Предпочитаю не говорить" = "PNR"),
                     "education" = c("1–4" = "0-1 Primary or less", "5–9" = "2 Medium school", "неполное; 10–11" = "2 Some high school", "ЕГЭ" = "3 High school diploma", "профессиональное" = "3-4 Vocational training", "Специалитет" = "5 Short-cycle tertiary", "Бакалавр" = "6 Bachelor's", "Магистр" = "7-8 Master's or higher"),
                     "employment_status" = c("Полная занятость" = "Full-time employed", "Частичная занятость" = "Part-time employed", "Самозанятость" = "Self-employed", "Студент" = "Student", "Пенсионер" = "Retired", "Безработный" = "Unemployed (searching for a job)", "Неактивный" = "Inactive (not searching for a job)"),
                     # "millionaire" = c("Очень маловероятно" = "Very unlikely", "Маловероятно" = "Unlikely", "Вероятно" = "Likely", "Очень вероятно" = "Very likely", "Я уже миллионер" = "I am already a millionaire"),
                     "sustainable_future_a" = c("A" = "Scenario A", "B" = "Scenario B"), "sustainable_future_b" = c("A" = "Scenario A", "B" = "Scenario B"),
                     "attention_test" = c("Совсем немного" = "Not at all", "Немного" = "A little", "Много" = "A lot", "Очень много" = "A great deal"),
                     "gcs_comprehension" = c("увеличатся" = "increase", "не изменятся" = "not be affected", "снизятся" = "decrease"),
                     "my_tax_global_nation" = c("Абсолютно согласен" = "Strongly agree", "Согласен" = "Agree", "Ни согласен, ни не согласен" = "Neither agree nor disagree", "Не согласен" = "Disagree", "Абсолютно не согласен" = "Strongly disagree"),
                     "group_defended" = c("Люди и животные" = "Sentient beings", "Люди$" = "Humans", "Мои соотечественники" = "Fellow citizens", "моей среды" = "Community (region, gender...)", "я сам" = "Family and self"))
  for (v in c("couple", "ncs_support", "gcs_support", "ics_mid_support", "ics_low_support", "ics_high_color_support", "ics_high_support", "global_tax_support", "hic_tax_support", "intl_tax_support", 
              "convergence_support", "global_movement")) relevel_ru[[v]] <<- c("Да" = "Yes", "Нет" = "No")
  for (v in c("likely_solidarity_treated", "likely_solidarity_control", "millionaire")) relevel_ru[[v]] <<- c("Очень маловероятно" = "Very unlikely", "Маловероятно" = "Unlikely", "Вероятно" = "Likely", "Очень вероятно" = "Very likely", "Я уже миллионер" = "I am already a millionaire")
  for (v in c(variables_solidarity_support_control, paste0(variables_solidarity_support, "_treated"), "top1_tax_support", "top3_tax_support")) relevel_ru[[v]] <<- c("Категорически против" = "Strongly oppose", "В некоторой степени против" = "Somewhat oppose", "Равнодушен" = "Indifferent", "В некоторой степени поддерживаю" = "Somewhat support", "Решительно поддерживаю" = "Strongly support")
  for (v in c(variables_transfer_how)) relevel_ru[[v]] <<- c("Неверный способ" = "A wrong way", "Приемлемый способ" = "An acceptable way", "Правильный способ" = "A right way", "Лучший способ" = "The best way")
  
  variables_interest <<- c(variables_solidarity_support, "wealth_tax_support", "top_tax_support", "reparations_support", "ncs_support", "gcs_support", "ics_support", "convergence_support",
                          variables_global_movement, variables_why_hic_help_lic, "revenue_split_few_global", variables_transfer_how, "sustainable_future", "humanist", "universalist", 
                          "individualist", "nationalist", "ncqg", "vote_intl_coalition", "my_tax_global_nation", "ncqg_fusion",  "share_solidarity_supported", "share_solidarity_opposed", "share_solidarity_diff", "share_solidarity_ratio") # "gcs_belief", "interview", "likely_solidarity", "group_defended"
  variables_sociodemos_all <<- c("gender", "age_exact", "foreign", "foreign_born_family", "foreign_born", "foreign_origin", "couple", "hh_size", "Nb_children__14", "race", "income", "income_quartile", "income_exact", "education_original", "education", "education_quota", 
                                 "employment_status", "employment_agg", "working", "retired_or_not_working", "employment_18_64", "urbanity", "region", "owner", "millionaire", "nationality_SA", "voted", "vote")
  variables_quotas_base <<- c("man", "age_factor", "income_quartile", "education", "urbanity", "region") 
  variables_socio_demos <<- c(variables_quotas_base, "millionaire_agg", "couple", "employment_agg", "vote_factor") # add "hh_size", "owner", "wealth_factor", "donation_charities"?
  variables_sociodemos <<- c("man", "age_factor", "income_factor", "education_factor", "urbanity_factor", "region_factor", "millionaire_factor", "couple", "employment_agg", "vote_factor") # add "hh_size", "owner", "wealth_factor", "donation_charities"?
  control_variables <<- c("vote_factor", "man", "age_factor", "income_factor", "education_factor", "urbanity_factor", "millionaire_factor", "couple", "employment_agg", "foreign_born", "country_name", "country_region") # add "hh_size", "owner", "wealth_factor", "donation_charities"? "region_factor", "region_factor:country"
  control_variables_lmg <<- c("vote_factor", "voted", "well_being", "gender", "age_exact", "income_decile", "education_original", "urbanity_factor", "millionaire", "couple", "employment_status", "foreign", "hh_size", "Nb_children__14", "owner", "country_name", "country_region") # add "hh_size", "owner", "wealth_factor", "donation_charities"? "region_factor", "region_factor:country"
  control_variables_lmg_few <<- c("vote_factor", "gender", "age", "income_factor", "education_factor", "urbanity_factor", "millionaire_agg", "country_name", "country_region") # add "hh_size", "owner", "wealth_factor", "donation_charities"? "region_factor", "region_factor:country"
  variables_politics <<- c("voted", "vote", "vote_agg", "group_defended")
  variables_vote <<- c("voted", "voted_original", "vote_original", "vote", "vote_agg", "vote_agg_factor", "vote_factor", "vote_voters", "vote_group", "vote_major", "vote_major_voters", "vote_major_candidate", "vote_leaning")
  covariates <<- c("country_name", "man", "age_factor", "income_quartile", "millionaire_agg", "education", "urban", "couple", "employment_agg", "voted", "vote_agg") # "race_white", "region"
}
define_var_lists()
# for (v in names(e)) if (length(unique(e[[v]])) == 2) print(v)
# for (v in names(e)) if ("No" %in% unique(e[[v]])) print(v)
# for (v in names(e)) if (is.logical(e[[v]])) print(v)
# names(e)[grepl('race', names(e))]
# cat(names(e)[grepl('sustainable', names(e)) & !grepl('order', names(e))], sep = '", "')

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

interpole_world_income <- function(rev, current, new) {
  e <- 1
  while (e <= 1001 && current[e] < rev) {
    e <- e + 1
  }
  if (e == 1002) {
    return(new[1001])
  } else if (e == 1) {
    return(new[1])
  } else {
    return((new[e] - new[e-1]) * (rev - current[e-1]) / (current[e] - current[e-1]) + new[e-1])
  }
}

tax_rates_custom_redistr <- function(future, current = current_inc, at = seq(0, 1e5, 100), marginal = FALSE, fct_income = T) {
  quantiles <- if (fct_income) 1:1001 else at # 1:1000 recommended for fct_income == F
  effective_rates_quantiles <- 1 - (future/current)[quantiles]
  effective_rates <- sapply(at, function(y) interpole_world_income(y, current, effective_rates_quantiles))
  if (fct_income) { marginal_rates <- 1 - (sapply(at + 1, function(y) interpole_world_income(y, current, future)) - sapply(at, function(y) interpole_world_income(y, current, future)))
  } else marginal_rates <- 1 - (future[at+1] - future[at])/(current[at+1] - current[at])
  if (max(at) > max(current) || (!fct_income & max(at) > 1001)) warning("Some of 'at' values out of bounds.")
  if (marginal) { return(marginal_rates)
  } else { if (fct_income) return(effective_rates) else return(effective_rates_quantiles) }
}

world_income_after_tax <- function(tax = NULL, thresholds = NULL, additional_rates = NULL, current = current_inc) {
  if (tax == "top1") thresholds <- 120e3
  if (tax == "top3") thresholds <- c(80e3, 120e3, 1e6)
  if (tax == "approx_mean") thresholds <- c(25e3, 40e3)
  if (tax == "top1") additional_rates <- .15
  if (tax == "top3") additional_rates <- c(.15, .15, .15)
  if (tax == "approx_mean") additional_rates <- c(.07, .09)
  future <- current
  for (k in 1:length(thresholds)) future <- future - additional_rates[k]*pmax(0, current - thresholds[k])
  return(future)
}

algo_dis_av <- function(winners, non_losers, degree, current = c(0, round(thousandile_world_disposable_inc)), verbose = FALSE) {
  # winners, non_losers are expressed between 0 and 1000
  income_threshold_winners <- current[winners + 1] # income_from_quantile(current, winners)
  income_threshold_losers <- current[non_losers + 1] # income_from_quantile(current, non_losers)
  
  # Define new as current bounded by the income thresholds of winners and losers
  new <- current
  for (i in 1:winners) new[i] <- pmax(current[i], income_threshold_winners)
  for (i in (winners + 1):non_losers) new[i] <- current[i]
  for (i in (non_losers + 1):1001) new[i] <- pmin(current[i], income_threshold_losers)
  future <- new
  # Computes what is "economizable", i.e. what can be redistributed on either side: what can be given on the left (among winners) or taken on the right
  L <- sum(pmax(0, income_threshold_winners - current)) # economizable(current, "left")
  R <- sum(pmax(0, current[1:1000] - income_threshold_losers)) # economizable(current, "right")
  # Iff what can be given is lower than what can be taken, the left side is binding, and we start focusing on the left side
  min_1 <- ifelse(L <= R, 0, non_losers)
  max_1 <- ifelse(L <= R, winners-1, 1000)
  min_2 <- ifelse(L <= R, non_losers, 0)
  max_2 <- ifelse(L <= R, 1000, winners-1)
  # We make the future line closer to the current one compared to the horizontal "new" line, to the extent degree is small, on the binding side
  for (i in min_1:max_1) future[i+1] <- current[i+1] + degree/10 * (future[i+1] - current[i+1]) # future[i+1] - (10-degree)/10 * (future[i+1] - current[i+1]) 
  # Then we adjust the non-binding side twice: first by having the maximal redistribution (given the other, binding side potential),
  for (i in min_2:max_2) future[i+1] <- future[i+1] - (1 - min(L/max(1e-9, R), R/max(1e-9, L))) * (future[i+1] - current[i+1])
  # then by accounting for the desired degree of redistr (as above)
  for (i in min_2:max_2) future[i+1] <- current[i+1] + degree/10 * (future[i+1] - current[i+1]) # future[i+1] - (10-degree)/10 * (future[i+1] - current[i+1]) 
  # Define the demogrant given what is economizable and the desired degree of redistribution
  demogrant <- if (winners > 0) 2*(min(L, R) * (degree/10) + sum(current[1:winners]))/winners - income_threshold_winners else 0
  # Draw a straight line between the demogrant and the threshold of winners
  # Turn to non-affine line if the affine line crosses the current line or if lower incomes raise less than higher ones
  affine <- TRUE
  for (i in 0:(winners-1)) {
    if (winners > 0) new[i+1] <- demogrant + (i/winners) * (income_threshold_winners - demogrant) # In practice, not used as affine is generally FALSE
    if (i > 0 && new[i+1] < current[i+1]) affine <- FALSE
    if (i > 0 && new[i] - current[i] < new[i+1] - current[i+1]) affine <- FALSE
  }
  if (affine) for (i in 0:winners) future[i+1] <- new[i+1]
  if (verbose) return(paste0("L: ", round(L), "   R: ", round(R), "   demogrant: ", round(future[1]/12), " $/month   transfer: ", round(100*sum(future[1:winners] - current[1:winners])/sum(current[1:1000]), 1) , 
                                       "%   income_threshold_winners: ", income_threshold_winners, "   sum(current[1:winners]):  ", sum(current[1:winners])))
  return(future)
}

compute_custom_redistr <- function(df = e, name = NULL, return = "df") { 
  current <- c(0, round(thousandile_world_disposable_inc)) # corresponds to c(0, thousandile_world_disposable_inc) created in questionnaire.R
  for (v in paste0("custom_redistr_", c("transfer", "future_income", "income_min", "self_lose", "self_gain", "satisfied_touched", "untouched"))) df[[v]] <- NA
  futures <- matrix(NA, ncol = 1001, nrow = nrow(df))
  
  for (k in 1:nrow(df)) {
    winners <- 10*df$custom_redistr_winners[k]
    non_losers <- 1000 - 10*df$custom_redistr_losers[k]
    degree <- df$custom_redistr_degree[k]
    df$custom_redistr_current_income[k] <- df$income_exact[k]/ifelse(df$couple[k] > 0, 2, 1) * as.numeric(features["period_custom", languages_country[[df$country[k]]][1]]) * as.numeric(features["unit", languages_country[[df$country[k]]][1]]) # in $/year individualized
    label(df$custom_redistr_current_income) <- "custom_redistr_current_income: Numerical. Individualized income (in $/year), not accounting for children (i.e. income_exact / ifelse(couple, 2, 1) * conversion_$)."
    df$income_exact_thousandile_world[k] <- min(c(1000, which(df$custom_redistr_current_income[k] < current))) # pmin(1000, sapply(df$custom_redistr_current_income, function(y) min(which(y < current))))
    label(df$income_exact_thousandile_world) <- "income_exact_thousandile_world: 0-1000. Thousandile of world disposable income of custom_redistr_current_income (individualized income_exact)."
    if (!is.na(winners)) {
      future <- algo_dis_av(winners, non_losers, degree, verbose = (return == "verbose"))
      # diff <- future - current
      # econ <- integral(diff, 0, winners - 1) + economizable(future, "right")
      
      df$custom_redistr_income_min[k] <- future[1]/12
      label(df$custom_redistr_income_min) <- "custom_redistr_income_min: Numerical. Minimum world income from custom redistribution ($/month)."
      df$custom_redistr_future_income[k] <- interpole_world_income(df$custom_redistr_current_income[k], current, future) 
      label(df$custom_redistr_future_income) <- "custom_redistr_future_income: Numerical. Future income of respondent (current: custom_redistr_current_income) after custom redistribution ($/year)."
      df$custom_redistr_self_gain[k] <- df$custom_redistr_future_income[k] > df$custom_redistr_current_income[k]
      label(df$custom_redistr_self_gain) <- "custom_redistr_self_gain: T/F. Respondent's income increases with custom redistribution."
      df$custom_redistr_self_lose[k] <- df$custom_redistr_future_income[k] < df$custom_redistr_current_income[k]
      label(df$custom_redistr_self_lose) <- "custom_redistr_self_lose: 0/100. Respondent's income decreases with custom redistribution."
      df$custom_redistr_self_unaffected[k] <- df$custom_redistr_future_income[k] == df$custom_redistr_current_income[k]
      label(df$custom_redistr_self_unaffected) <- "custom_redistr_self_unaffected: T/F. Respondent's income unaffected with custom redistribution."
      df$custom_redistr_transfer[k] <- 100*sum(future[1:winners] - current[1:winners])/sum(current[1:1000]) 
      label(df$custom_redistr_transfer) <- "custom_redistr_transfer: Numerical. Transfer from rich to poor due to custom redistribution (% of world income)."
      # transfer <- (integral(future, 0, winners) - integral(current, 0, winners))/integral(current, 0, 1000)
      futures[k, ] <- future 
    }
  }
  df$custom_redistr_transfer_ceiling <- ceiling(df$custom_redistr_transfer)
  df <- create_item(var = "custom_redistr_transfer_ceiling", df = df, values = list(0, 1, 2:3, 4:5, 6:10, 10:100), labels = c("0" = 0, "0% to 2%" = 1, "2% to 4%" = 3, "4% to 5%" = 4.5, "5% to 10%" = 7.5, "More than 10%" = 17), annotation = "custom_redistr_transfer_ceiling: 0/0-2/2-4/4-5/5-10/>5 Transfer (in % of world income) implied by the custom redistribution.")
  df$custom_redistr_income_min_ceiling <- ceiling(df$custom_redistr_income_min)
  df <- create_item(var = "custom_redistr_income_min_ceiling", df = df, values = list(0:50, 51:150, 151:250, 251:350, 351:451, 451:2000), labels = c("$0 to $50" = 25, "$50 to $150" = 100, "$150 to $250" = 200, "$250 to $350" = 300, "$350 to $450" = 400, "More than $450" = 600), annotation = "custom_redistr_income_min_ceiling: 0-50/50-150/150-250/250-350/350-450/>450 Transfer (in $/month) implied by the custom redistribution.")
  df <- create_item(var = "custom_redistr_winners", new_var = "custom_redistr_winners_agg", df = df, values = list(0:34, c(35:49, 40.1), c(50:64, 60.1), 65:100), labels = c("Less than 35%" = 10, "35% to 49%" = 40, "50% to 64%" = 60, "65% or more" = 80), annotation = "custom_redistr_income_winners_agg: Aggregate version of custom_redistr_winners.")
  df <- create_item(var = "custom_redistr_losers", new_var = "custom_redistr_losers_agg", df = df, values = list(0:8, c(9:15, 10.1), c(16:21, 20.1), 22:30, 31:100), labels = c("Less than 9%" = 5, "9% to 15%" = 10, "16% to 21%" = 20, "22% to 30%" = 26, "More than 30%" = 40), annotation = "custom_redistr_income_losers_agg: Aggregate version of custom_redistr_losers.")
  
  df$custom_redistr_satisfied <- df$custom_redistr_satisfied > 0
  df$custom_redistr_untouched[df$country != "RU"] <- (df$custom_redistr_degree %in% c(2.1, 7.1))[df$country != "RU"]
  label(df$custom_redistr_untouched) <- "custom_redistr_untouched: 0/100. Respondent hasn't touched the slider custom_redistr_degree."
  df$custom_redistr_satisfied_touched <- df$custom_redistr_satisfied & !df$custom_redistr_untouched
  label(df$custom_redistr_satisfied_touched) <- "custom_redistr_satisfied_touched: 0/100. Respondent touched the sliders and is satisfied with own custom redistr (!custom_redistr_untouched & custom_redistr_satisfied)."
  mean_redistr <- colSums(futures * df$weight * df$custom_redistr_asked, na.rm = T)/sum(df$weight * df$custom_redistr_asked)
  if (!is.null(name) && exists("mean_custom_redistr")) {
    mean_custom_redistr[[name]] <<- mean_redistr
    mean_custom_redistr[[paste0(name, "_satisfied")]] <<- colSums((futures * df$weight * df$custom_redistr_satisfied), na.rm = T)/sum(df$weight *df$custom_redistr_satisfied, na.rm = T)
    mean_custom_redistr[[paste0(name, "_touched")]] <<- colSums((futures * df$weight * !df$custom_redistr_untouched), na.rm = T)/sum(df$weight * !df$custom_redistr_untouched, na.rm = T)
    mean_custom_redistr[[paste0(name, "_satisfied_touched")]] <<- colSums((futures * df$weight * df$custom_redistr_satisfied_touched), na.rm = T)/sum(df$weight * df$custom_redistr_satisfied_touched, na.rm = T)
    mean_custom_redistr[[paste0(name, "_self_gain")]] <<- colSums((futures * df$weight * df$custom_redistr_self_gain), na.rm = T)/sum(df$weight * df$custom_redistr_self_gain, na.rm = T)
    mean_custom_redistr[[paste0(name, "_self_lose")]] <<- colSums((futures * df$weight * df$custom_redistr_self_lose), na.rm = T)/sum(df$weight * df$custom_redistr_self_lose, na.rm = T)
  }
  for (v in c(variables_custom_redistr, "custom_redistr_self_lose", "custom_redistr_self_gain", "custom_redistr_satisfied_touched", "custom_redistr_untouched")) df[[v]] <- 100*(df[[v]] > 0)
  if (return == "df") return(df)
  else if (return == "mean_redistr") return(mean_redistr)
  else return(futures)
}

convert <- function(e, country = e$country[1], pilot = FALSE, weighting = TRUE) {
  # time_scenarios_tax? 
  # for (j in intersect(variables_yes_no, names(e))) {
  #   temp <- 1*(e[j][[1]] %in% "Yes") - 0.1*(e[j][[1]] %in% text_pnr) # - (e[j][[1]] %in% text_no)
  #   temp[is.na(e[j][[1]])] <- NA
  #   e[j][[1]] <- as.item(temp, labels = c("No" = 0, "PNR" = -0.1, "Yes" = 1), missing.values = c("",NA,"PNR"), annotation=attr(e[j][[1]], "label"))
  # }
  # 
  # for (v in intersect(variables_likert, names(e))) {
  #   if (v %in% names(e)) {
  #     temp <- 2 * (e[[v]] %in% "Strongly support") + (e[[v]] %in% "Somewhat support") - (e[[v]] %in% "Somewhat oppose") - 2 * (e[[v]] %in% "Strongly oppose")
  #     temp[is.na(e[[v]])] <- NA
  #     # e[[v]] <- as.item(temp, labels = structure(c(-2:2), names = c("Strongly oppose","Somewhat oppose","Indifferent","Somewhat support","Strongly support")), missing.values=c(NA), annotation=Label(e[[v]])) 
  #     e[[v]] <- as.item(temp, labels = c("Strongly oppose" = -2, "Somewhat oppose" = -1, "Indifferent" = 0, "Somewhat support" = 1, "Strongly support" = 2), missing.values = NA, annotation=Label(e[[v]])) 
  # } }
  if ("long" %in% names(e)) e$variant_long <- e$long > .42 # info_solidarity; nb_solidarity; top_tax_support
  # cut: fields; transfer_how OR radical redistr; custom redistr; comprehension

  define_var_lists()
  e$country_name <- countries_names[country]
  label(e$country_name) <- "country_name: Country."
  e$country <- country
  label(e$country) <- "country: ISO-2 country code."
  e$continent <- "Other"
  e$continent[e$country == "US"] <- "US"
  e$continent[e$country == "JP"] <- "Japan"
  e$continent[e$country_name %in% countries_Eu] <- "Europe"
  
  if (country == "RU") {
    e <- create_item("income", keep_original = T, labels = c("less than $100" = 1, "between $100 and $200" = 2, "between $201 and $250" = 2.5, "between $251 and $300" = 3, "between $301 and $400" = 4, "between $401 and $500" = 5, "between $501 and $600" = 6, "between $601 and $700" = 7, "between $701 and $750" = 7.5, "between $751 and $800" = 8, "between $801 and $900" = 9, "more than $900" = 10, "PNR" = 0), 
                     values = c("менее", "35 001", "50 001", "55 001", "60 001", "75 001", "85 001", "100 001", "120 001", "130 001", "145 001", "более", "PNR|не говорить"), grep = T, missing.values = c("PNR"), df = e)  
    for (v in names(relevel_ru)) for (l in names(relevel_ru[[v]])) if (any(grepl(l, e[[v]]))) e[[v]][grepl(l, e[[v]])] <- relevel_ru[[v]][[l]]
    e$age_exact <- sub("-", " to ", e$age_exact)
    for (v in c(variables_home, variables_why_hic_help_lic)) e[[v]] <- e[[v]] != "0"
    
    for (v in variables_ics) e$variant_ics[!is.na(e[[v]])] <- sub("ics_", "", sub("_support", "", v))
    for (v in variables_ics) e$ics_support[!is.na(e[[v]])] <- e[[v]][!is.na(e[[v]])] 
    for (v in variables_ics) e[[v]] <- ifelse(is.na(e[[v]]), NA, 100*(e[[v]] %in% "Yes"))
    e$variant_warm_glow <- ifelse(!is.na(e$ncs_support), 1, 0)
    e$variant_long <- T
    e$variant_split <- "Simple"
    e$variant_realism <- 1*!is.na(e$likely_solidarity_treated)
    e$likely_solidarity <- ifelse(e$variant_realism == 1, e$likely_solidarity_treated, e$likely_solidarity_control)
    e$solidarity_support_expanding_security_council_treated <- NA # Bug: question missing
    for (v in variables_solidarity_support) e[[v]] <- ifelse(e$variant_realism == 0 | grepl("council", v), e[[paste0(v, "_control")]], e[[paste0(v, "_treated")]])
    for (v in c("revenue_split", "gcs_belief_own")) e[[v]] <- 100*e[[v]]
    e$radical_redistr_asked <- e$global_movement_asked <- e$cut <- FALSE
    e$why_hic_help_lic_asked <- T
    e$gcs_comprehension_order <- 1
    e$transfer_how_order_agencies <- 1
    e$variant_radical_redistr <- 1*!is.na(e$top3_tax_support)
    e$variant_radical_transfer <- e$variant_sliders <- NA
  }
  
  for (i in intersect(variables_numeric, names(e))) {
    lab <- label(e[[i]])
    e[[i]] <- as.numeric(as.vector(gsub("[^0-9\\.]", "", e[[i]]))) # /!\ this may create an issue with UK zipcodes as it removes letters
    label(e[[i]]) <- lab
  }
  for (v in intersect(variables_duration, names(e))) e[[v]] <- e[[v]]/60
  label(e$duration) <- "duration: Duration (in min)"
  e$duration_feedback <- e$duration - rowSums(e[, intersect(variables_duration[-1], names(e))], na.rm = T)
  
  if (country != "RU") for (j in intersect(variables_binary, names(e))) { 
    temp <- label(e[[j]])
    e[[j]] <- !is.na(e[[j]])
    # e[[j]] <- e[[j]] %in% "" # e[[j]][e[[j]]!=""] <- TRUE
    # e[[j]][is.na(e[[j]])] <- FALSE
    label(e[[j]]) <- temp
  }
  
  if ("attention_test" %in% names(e)) e$attentive <- e$attention_test %in% "A little"
  
  # Socio-demos
  e$man <- e$gender %in% "Man"
  label(e$man) <- "man: T/F. gender %in% Man."
  
  if ("race_black" %in% names(e)) {
    e$race <- "Other" # Hispanic include Hispanic blacks; therefore Other is a bit higher than (100% - White only - Black alone - Hispanic) and Black a bit lower, by 0.4% I think.
    e$race[e$race_white==T & e$race_asian == FALSE & e$race_native == FALSE & e$race_black == F & e$race_hispanic == F & e$race_hawaii == F & e$race_other == F] <- "White only"
    e$race[e$race_black==T & e$race_hispanic==F & e$race_white==F & e$race_asian == FALSE & e$race_native == FALSE & e$race_hawaii == F & e$race_other == F] <- "Black"
    e$race[e$race_hispanic==T] <- "Hispanic"
    if (any(e$race == "White only")) e$race <- relevel(as.factor(e$race), "White only")
    label(e$race) <- "race: White only/Hispanic/Black only/Other. True proportions: .584/.195/.133/.088"
  }
  
  e <- create_item("age_exact", new_var = "age", labels = c("18-24" = 21.5, "25-34" = 30, "35-49" = 42.5, "50-64" = 57.5, "65+" = 71), 
                   values = list(c("18 to 20", "21 to 24"), c("25 to 29", "30 to 34"), c("35 to 39", "40 to 44", "45 to 49"), c("50 to 54", "55 to 59", "60 to 64"), 
                                 c("65 to 69", "70 to 74", "75 to 79", "80 to 84", "85 to 89", "90 to 99", "100 or above")), df = e)
  e$age_factor <- relevel(as.factor(e$age), "35-49")
  label(e$age_factor) <- "age_factor: Age [18-24; 25-34; 35-49 [default]; 50-64; 65+]."
  e <- create_item("education", labels = c("Below upper secondary" = 1, "Upper secondary" = 2, "Above upper secondary" = 3), grep = T, keep_original = T, values = c("1|2", "3|4", "5|6|7"), df = e, annotation = "education: What is your highest completed education level? [1: Below upper secondary; 2: Upper secondary; 3: Above upper secondary] (from education_original).")
  e$post_secondary <- e$education %in% 3
  label(e$post_secondary) <- "post_secondary: education == 'Above upper secondary'"
  e$education_quota <- if (country == "RU") e$education else ifelse(e$age > 25 & e$age < 65, e$education, 0)
  if (country == "JP") e$education_quota[e$education_quota %in% 1] <- 2 # In JP official stats, there is no one Below upper secondary. They'd have weights of 0 if we didn't relabeled them.
  # e$diploma_25_64 <- e$diploma
  # e$diploma_25_64[e$age < 25 | e$age > 65] <- 0 # "Not 25-64"
  # e$diploma_25_64 <- as.item(as.numeric(as.vector(e$diploma_25_64)), labels = structure(c(1:3, 0), names = c("Below upper secondary", "Upper secondary", "Post secondary", "Not 25-64")), missing.values=c(NA, 0), 
  #                            annotation="diploma_25_64: 0: Not 25-64 if age is not within 25-64 (missing value) / 1: Below upper secondary (ISCED 0-2) / 2: Upper secondary (ISCED 3) / 3: Post secondary (ISCED 4-8), recoded from education.")
  e <- create_item("education_quota", labels = c("Not 25-64" = 0, "Below upper secondary" = 1, "Upper secondary" = 2, "Post secondary" = 3), values = 0:3, missing.values = c(NA, 0), df = e, annotation = "education_quota: ifelse(age > 25 & age < 65, education, 0). Except in RU: education.")
  # e <- create_item("education_quota", labels = c("Below upper secondary" = 1, "Upper secondary" = 2, "Post secondary" = 3), values = c(1, 2, 3), df = e)
  
  if (pilot) {
    e$top1_tax_support <- ifelse(e$cut, e$top1_tax_support_cut, e$top1_tax_support)
    e$top3_tax_support <- ifelse(e$cut, e$top3_tax_support_cut, e$top3_tax_support)
  }
  e$top_tax_support <- ifelse(e$variant_radical_redistr == 0, e$top1_tax_support, e$top3_tax_support)
  if (country != "RU") e$top1_tax_support_affected <- e$top3_tax_support_affected <- e$top_tax_support_affected <- e$top_tax_support
  label(e$top_tax_support) <- "top_tax_support: -2-2. Supports an additional income tax on the top 1 or 3% (depending on variant_top_tax) to finance poverty reduction for the bottom 2 or 3 billion people (top1: 15% > 120k $/year; top3: 15% > 80k; 30% > 120k; 45% > 1M)."
  e$variant_top_tax <- ifelse(e$variant_radical_redistr == 0, "top1", "top3")
  e$variant_top_tax_full <- paste0(e$variant_top_tax, ifelse(e$variant_long, "_long", "_short"))
   
  e <- create_item("income", new_var = "income_quartile", labels = c("Q1" = 1, "Q2" = 2, "Q3" = 3, "Q4" = 4, "PNR" = 0), values = c("100|200|250", "300|400|500", "600|700|750", "800|900", "not"), grep = T, missing.values = c("PNR"), df = e)  
  e <- create_item("income", new_var = "income_decile", labels = c("d1" = 1, "d2" = 2, "d3" = 3, "d4" = 4, "d5" = 5, "d6" = 6, "d7" = 7, "d8" = 8, "d9" = 9, "d10" = 10, "PNR" = 0), values = c("less", "100 and", "201|300", "301", "401", "501", "601", "701|800", "801", "more", "not"), grep = T, missing.values = c("PNR"), df = e)  
  if (country == "JP") e$income_exact_misinterpreted <- e$income_exact > 8e3
  if (country == "JP") e$income_exact[e$income_exact_misinterpreted %in% T] <- e$income_exact[e$income_exact_misinterpreted %in% T]/1e4 # Correct income_exact for 620 respondents who answered in Yen instead of 10k Yen.
  e$uc <- .5 + .5*pmax(0, e$hh_size - e$Nb_children__14) + .3*e$Nb_children__14
  label(e$uc) <- "uc: Consumption units (.5 + .5*pmax(0, hh_size - Nb_children__14) + .3*Nb_children__14)."
  if ("income_exact" %in% names(e)) {
    e$income_exact_individualized <- e$income_exact * income_deciles["periodicity", languages_country[[country]][1]] / e$uc
    label(e$income_exact_individualized) <- "income_exact_individualized: Individualized income (income_exact/uc, except for US, RU: household income_exact) (LCU/year)."
    e$income_exact_equal_split <- e$income_exact / (1 + (e$couple > 0))
    label(e$income_exact_equal_split) <- "income_exact_equal_split: Equal-split income (income_exact/(1+couple)) (LCU per country-specific periodicity)."
    e$income_exact_affected_top_tax <- e$income_exact_affected_top3_tax <- e$income_exact_affected_top1_tax <- e$income_exact_equal_split > as.numeric(gsub("[^0-9]*", "", features[ifelse(e$variant_top_tax == "top3", "lcu_80k", "lcu_120k"), languages_country[[country]][1]]))
    label(e$income_exact_affected_top_tax) <- "income_exact_affected_top_tax: T/F Respondent's household is affected by the global income top_tax (i.e. their income_exact_equal_split > $80k or $120k depending on variant_top_tax)."
    e$income_exact_affected_top1_tax[e$variant_top_tax == "top3"] <- NA
    label(e$income_exact_affected_top1_tax) <- "income_exact_affected_top1_tax: T/F Respondent's household is affected by the global income top1_tax (i.e. their income_exact_equal_split > $80k or $120k depending on variant_top_tax)."
    e$income_exact_affected_top3_tax[e$variant_top_tax == "top1"] <- NA
    label(e$income_exact_affected_top3_tax) <- "income_exact_affected_top3_tax: T/F Respondent's household is affected by the global income top3_tax (i.e. their income_exact_equal_split > $80k or $120k depending on variant_top_tax)."
    e$top1_tax_support_affected[!e$income_exact_affected_top1_tax %in% T] <- NA
    e$top3_tax_support_affected[!e$income_exact_affected_top3_tax %in% T] <- NA
    e$top_tax_support_affected[!e$income_exact_affected_top_tax %in% T] <- NA
    label(e$top1_tax_support_affected) <- "top1_tax_support_affected: -2-2. [Among responents affected by the tax; other: NA] Supports an additional income tax on the top 1% to finance poverty reduction for the bottom 2 or 3 billion people (top1: 15% > 120k $/year; top3: 15% > 80k; 30% > 120k; 45% > 1M)."
    label(e$top3_tax_support_affected) <- "top3_tax_support_affected: -2-2. [Among responents affected by the tax; other: NA] Supports an additional income tax on the top 3% to finance poverty reduction for the bottom 2 or 3 billion people (top1: 15% > 120k $/year; top3: 15% > 80k; 30% > 120k; 45% > 1M)."
    label(e$top_tax_support_affected) <- "top_tax_support_affected: -2-2. [Among responents affected by the tax; other: NA] Supports an additional income tax on the top 1 or 3% (depending on variant_top_tax) to finance poverty reduction for the bottom 2 or 3 billion people (top1: 15% > 120k $/year; top3: 15% > 80k; 30% > 120k; 45% > 1M)."
    e$income_exact_equal_split_dollar <- ifelse(e$variant_top_tax == "top3", 8e4, 12e4) * e$income_exact_equal_split / as.numeric(gsub("[^0-9]*", "", features[ifelse(e$variant_top_tax == "top3", "lcu_80k", "lcu_120k"), languages_country[[country]][1]]))
    label(e$income_exact_equal_split_dollar) <- "income_exact_equal_split_dollar: T/F Equal-split income (income_exact/(1+couple)) ($/year)."
    if (country %in% c("RU", "US")) e$income_exact_individualized <- e$income_exact * income_deciles["periodicity", languages_country[[country]][1]]
    e$income_exact_decile <- 1+rowSums(e$income_exact_individualized > matrix(rep(t(income_deciles[c(1,2,4:8,10,11), languages_country[[country]][1]]), nrow(e)), nrow = nrow(e), byrow = T))
    e$income_exact_quartile <- 1+rowSums(e$income_exact_individualized > matrix(rep(t(income_deciles[c(3,6,9), languages_country[[country]][1]]), nrow(e)), nrow = nrow(e), byrow = T))
    e$income_answers_spread <- e$income_decile - e$income_exact_decile # Some (positive) spread is expected because income is before taxes (even gross in DE, GB, JP, SA, US) but after taxes in income_exact
    label(e$income_answers_spread) <- "income_answers_spread: income_decile - income_exact_decile"
    e$income_answers_decile_coincide <- e$income_answers_spread == 0
    label(e$income_answers_decile_coincide) <- "income_answers_decile_coincide: income_answers_spread == 0"
    e$income_answers_quartile_coincide <- e$income_exact_quartile == e$income_quartile
    label(e$income_answers_quartile_coincide) <- "income_answers_quartile_coincide: income_exact_quartile == income_quartile"
  }
  if (country == "GB") e$urbanity[e$urbanity %in% c(1,3)] <- ifelse(e$urbanity[e$urbanity %in% c(1,3)] %in% 1, 3, 1) # Correcting a mistake in Qualtrics encoding
  if ("urbanity" %in% names(e)) {
    e$urban <- e$urbanity == 1
    e <- create_item("urbanity", labels = c("Cities" = 1, "Towns and suburbs" = 2, "Rural" = 3), grep = T, values = c("1", "2", "3|4"), keep_original = T, missing.values = 0, df = e, annotation = "urbanity: 1-3. Urbanicity [1: Cities; 2: Towns and suburbs, 3: Rural].")
    if (country == "US") e$urbanity[e$urbanity %in% c(2, 4)] <- 3 
    # e$urban_rural <- e$urbanity
    # e <- create_item("urban_rural", labels = c("Cities" = 1, "Rural" = 2), values = list(1, c(2:4)), df = e)
  }
  if ("foreign" %in% names(e)) {
    e <- create_item("foreign", new_var = "foreign_born_family", labels = c("No" = 0, "One parent" = 1, "Two parents" = 2, "Self" = 3), grep = T, values = c("too", "one of", "both", "Yes"), df = e, annotation = "foreign_born_family: Were you or your parents born in a foreign country? [0: No; 1: One parent; 2: Two parents; 3: Self].")
    e$foreign_born <- e$foreign_born_family %in% 3
    label(e$foreign_born) <- "foreign_born: T/F. Born abroad (foreign == 3)."
    e$foreign_origin <- e$foreign_born_family > 0 
    label(e$foreign_origin) <- "foreign_origin: T/F. At least one parent (or self) born abroad (foreign > 0)."
  }
  
  e <- create_item("employment_status", new_var = "employment_agg", labels = c("Not working", "Student", "Working", "Retired"), grep = T, values = c("Inactive|Unemployed", "Student", "employed$", "Retired"), df = e, 
                   annotation = "employment_agg: Not working (Inactive or Unemployed) / Student / Retired / Employed (full-time, part-time, or self-employed). Built from employment_status.")
  e$retired_or_not_working <- e$employment_agg %in% c("Retired", "Not working")
  e$working <- e$employment_agg == "Working"
  
  e$employment_18_64 <- "Employed"
  e$employment_18_64[grepl("Unemployed", e$employment_status)] <- "Unemployed"
  e$employment_18_64[grepl("Inactive|Student|Retired", e$employment_status)] <- "Inactive"
  e$employment_18_64[e$age > 64] <- "65+"
  label(e$employment_18_64) <- "employment_18_64: 65+ / Inactive (Inactive, Student or Retired) / Unemployed / Employed (full-time, part-time, or self-employed). Built from employment_status."
  
  e$owner <- e$home_owner == T | e$home_landlord == T
  label(e$owner) <- "owner: Owner or Landlord renting out property to: Are you a homeowner or a tenant?"
  
  if (country %in% names(votes)) {
    e <- create_item("voted", new_var = "voted_original", c("No right" = -1, "PNR" = -0.1, "No" = 0, "Yes" = 1), grep = T, values = c("right", "Prefer not", "No", "Yes"), df = e)
    e$voted <- e$voted %in% "Yes"
    e$vote_original <- e[[paste0("vote_", country)]]
    label(e$vote_original) <- "vote_original: Vote (if voted) or closest candidate (if !voted) in last election."
    e$vote_agg <- ifelse(e$vote_original %in% c("Prefer not to say", "Other", NA), -1, votes[[country]][e$vote_original, "leaning"]) # PNR, Other as -1
    e$vote_leaning <- ifelse(e$vote_original == "Other", NA, e$vote_agg) # PNR as -1, Other as NA
    label(e$vote_leaning) <- "vote_leaning: ifelse(vote_original == Other, NA, vote_agg)"
    e$vote_major_candidate <- votes[[country]][sub("Prefer not to say", "Other", e$vote_original), "major"] %in% 1
    label(e$vote_major_candidate) <- "vote_major_candidate: Vote (or hypothetical vote) for a major candidate (> 1% (?) of actual votes)."
    e$vote_major <- ifelse(e$vote_major_candidate, e$vote_original, "PNR or Other")
    label(e$vote_major) <- "vote_major: Vote (or hypothetical vote) if vote_major_candidate, else 'PNR or Other'."
    e$vote_voters <- ifelse(e$voted, e$vote_original, "Non-voter or PNR")
    label(e$vote_voters) <- "vote_voters: Vote if voted else 'Non-voter or PNR'."
    e$vote_major_voters <- ifelse(e$voted, ifelse(e$vote_major %in% "PNR or Other", "Non-voter, PNR or Other", e$vote_major), "Non-voter, PNR or Other")
    label(e$vote_major_voters) <- "vote_major_voters: Vote if voted for a major candidate, else 'Non-voter, PNR or Other'."
    if (country %in% countries_EU) e$vote_group <- votes[[country]][sub("Prefer not to say", "Other", e$vote_original), "group"]
    if (country %in% countries_EU) label(e$vote_group) <- "vote_group: Group at the EU Parliament of the vote (or hypothetical vote)."
    e$vote <- ifelse(e$voted, e$vote_agg, -1) # Only on voters
    
    e <- create_item("vote_agg", labels = c("PNR or Other"  = -1, "Left" = 0, "Center-right or Right" = 1, "Far right" = 2), values = -1:2, missing.values = -1, df = e, annotation = "vote_agg: -1-2. Vote (or hypothetical vote) [-1: PNR or Other; 0: Left; 1: Center-right or Right; 2: Far right].")
    e <- create_item("vote", labels = c("Non-voter, PNR or Other"  = -1, "Left" = 0, "Center-right or Right" = 1, "Far right" = 2), values = -1:2, missing.values = -1, df = e, annotation = "vote: -1-2. Vote [-1: Non-voter, PNR or Other; 0: Left; 1: Center-right or Right; 2: Far right].")
    e$vote_agg_factor <- relevel(as.factor(as.character(e$vote_agg, include.missings = T)), "PNR or Other")
    label(e$vote_agg_factor) <- "vote_agg_factor: -1-2. Vote (or hypothetical vote) [-1: PNR or Other; 0: Left; 1: Center-right or Right; 2: Far right]."
    e$vote_factor <- relevel(as.factor(as.character(e$vote, include.missings = T)), "Non-voter, PNR or Other") # Left
  } else e$vote_factor <- "Non-voter, PNR or Other"
  label(e$vote_factor) <- "vote_factor: -1-2. Vote [-1: Non-voter, PNR or Other; 0: Left; 1: Center-right or Right; 2: Far right]."
  
  if (country == "US") {
    # label(e$flipped_2024) <- "flipped_2024: T/F Lives in one of the 6 States that flipped from Democrat to Republican in the 2024 presidential election (AZ, GA, MI, NV, PA, WI)."
    e$swing_state <- floor(n(e$zipcode)/100) %[]% c(30, 38) | floor(n(e$zipcode)/1000) %[]% c(48, 49) | floor(n(e$zipcode)/100) %[]% c(889, 900) | floor(n(e$zipcode)/100) %[]% c(150, 196) | floor(n(e$zipcode)/1000) %[]% c(53, 54) | floor(n(e$zipcode)/1000) %[]% c(85, 86) | floor(n(e$zipcode)/1000) %[]% c(30, 31) | floor(n(e$zipcode)/100) %[]% c(398, 399) | floor(n(e$zipcode)/1000) %[]% c(27, 28) 
    label(e$swing_state) <- "swing_state_5pp: T/F Lives in one of the 8 States around the tipping-point one: with less than 5 p.p. difference in margin with the national one at the 2024 Presidential election (NH, WI, MI, PA, GA, NV, NC, AZ)." 
    e$democratic_state <- floor(n(e$zipcode)/1000) %[]% c(80, 81) | floor(n(e$zipcode)/100) %[]% c(900, 994) | floor(n(e$zipcode)/1000) %[]% c(5, 6) | floor(n(e$zipcode)/1000) %[]% c(60, 62) | floor(n(e$zipcode)/100) %[]% c(10, 29) | floor(n(e$zipcode)/1000) %[]% c(10, 14) | floor(n(e$zipcode)/100) == 5 | floor(n(e$zipcode)/100) %[]% c(197, 205) 
    label(e$democratic_state) <- "democratic_state: T/F Lives in one of the 14 States with Democratic margin >10pp in 2024 Presidential election: California + Illinois + New York + Washington + Massachusetts + Oregon + Connecticut + Delaware + Hawaii + Rhose Island + DC + Vermont + Maryland + Colorado" # Almost same states as >15pp in 2020: just CO instead of NJ
    # 8 States with less than 5pp difference in margin from national margin in 2024:  NH (030-038), WI (53-54), MI (48-49), PA (150-196), GA (30-31/398-399), NV (889-899), NC (27-28), AZ (85-86)
    # Michigan MI (zipcodes: 48-49, 2.8%D margin, 15 electoral votes), Nevada NV (889-899, 2.4%D, 6), Pennsylvania PA (150-196, 1.2%D, 19), Wisconsin WI (53-54, .6%D, 10, tipping-point state), Arizona AZ (85-86, .3%D, 11), Georgia GA (30-31/398-399, .2%D, 16), North Carolina NC (27-28, 1.4%R, 16). [If instead we use 5pp, it adds Florida FL (32-34, 3.4%R, 30)] Apart from these, Dems should secure 228 electoral votes, i.e. need 42 more to win (out of 538 electoral votes or 83 swing ones).
    # If instead we had chosen < 5 p.p., we'd also have Minnesota (Dem) and Nebraska-2 (Dem) and wouldn't have Arizona. 
    # Other notable states: FL (32-34), MN (550-567), CO (80-81), NJ (07-08), NE-2 (68007, 68010, 68022, 68028, 68046, 68059, 68064, 68069, 68102, 68104, 68105, 68106, 68107, 68108, 68110, 68111, 68112, 68114, 68116, 68117, 68118, 68122, 68123, 68124, 68127, 68128, 68130, 68131, 68132, 68133, 68134, 68135, 68136, 68137, 68138, 68142, 68144, 68147, 68152, 68154, 68157, 68164, 68178) # https://statisticalatlas.com/congressional-district/Nebraska/Congressional-District-2/Overview
    # sources: https://en.wikipedia.org/wiki/Swing_state#Swing_states_by_results, https://en.wikipedia.org/wiki/2024_United_States_presidential_election#Results_by_state, zipcodes: https://www.mapsofworld.com/usa/zipcodes/
  }
  if (country %in% names(countries_Eu)) {
    e$vote_Eu <- e$vote 
    annotation(e$vote_Eu) <- "vote_Eu: vote (incl. hypothetical) if European else NA."
    e$vote_agg_Eu <- e$vote_agg
    annotation(e$vote_agg_Eu) <- "vote_agg_Eu: vote_agg (Non-voter as such) if European else NA."
  }
  if (country %in% "JP") {
    e$vote_JP <- e$vote
    annotation(e$vote_JP) <- "vote_JP: vote (incl. hypothetical) if JP else NA."
    e$vote_agg_JP <- e$vote_agg
    annotation(e$vote_agg_JP) <- "vote_agg_JP: vote_agg (Non-voter as such) if JP else NA."
  }
  
  # Other variables
  if (country == "SA") e$saudi <- e$nationality_SA == "Saudi"
  if (country == "SA") e$gender_nationality <- paste0(ifelse(e$man, "Man", "Woman"), ", ", ifelse(e$saudi, "Saudi", "non-Saudi"))
  e <- create_item("millionaire", labels = c("Very unlikely" = -3, "Unlikely" = -1, "Likely" = 1, "Very likely" = 3, "I am already a millionaire" = 5), df = e, annotation = "millionaire: -3/-1/1/3/5. How likely are you to become a millionaire at some point in your life?")
  e <- create_item("millionaire", new_var = "millionaire_agg", c("Unlikely" = -1, "Likely" = 0, "Already" = 1), grep = T, values = c("nlikely", "Very l|Likely", "already"), df = e, annotation = "millionaire_agg: -1/0/1. How likely are you to become a millionaire at some point in your life?")
  e <- create_item(variables_yes_no, labels = c("No" = 0, "PNR" = -0.1, "Yes" = 100), values = c("No", list(text_pnr), "Yes"), missing.values = c("", NA, "PNR"), df = e) 
  e <- create_item(variables_likert, labels = c("Strongly oppose" = -2, "Somewhat oppose" = -1, "Indifferent" = 0, "Somewhat support" = 1, "Strongly support" = 2), df = e) 
  if (country == "RU") e <- create_item("solidarity_support_expanding_security_council_control", labels = c("Strongly oppose" = -2, "Somewhat oppose" = -1, "Indifferent" = 0, "Somewhat support" = 1, "Strongly support" = 2), df = e) 
  e <- create_item("likely_solidarity", labels = c("Very unlikely" = -3, "Unlikely" = -1, "Likely" = 1, "Very likely" = 3), df = e, annotation = "likely_solidarity: -3/-1/1/3. According to you, how likely is it that international policies involving significant transfers from high-income countries to low-income countries will be introduced in the next 15 years?")
  e <- create_item("ncqg", labels = c("Stop" = 0, "Reduce" = 1, "Maintain ($26 bn)" = 2, "Meet goal ($100 bn)" = 3, "Intermediate ($200 bn)" = 4, "Developing ($600 bn)" = 5, "NGOs ($1,000 bn)" = 6),
                   grep = T, keep_original = T, values = c("Stop", "Reduce", "\\$26", "meet|Meet", "level between", "\\$600", "\\$1,000"), df = e, annotation = paste0("ncqg: 0: 0/1/2: 26/3: 100/4: 300/5: 600/6: 1000. ~ variant_ncqg: Short \"Climate finance\" designates the financing of climate action from developed countries in developing countries. [developed_note: (Note that we consider Saudi Arabia to be a developed country in this question.)]\n\n", 
                                                                                                                                                                       "There are two kinds of climate finance: grants (that is, donations) and loans. The large majority is currently provided as loans. \n\nIn 2009, developed countries agreed to mobilize $100 billion per year in climate finance. In 2024, they committed to triple this goal by 2035.", 
                                                                                                                                                                       "None of the goals specify which share should be provided as grants. \nAt international climate negotiations, developing countries call for larger provision of climate finance, particularly in the form of grants.\n\n", 
                                                                                                                                                                       "If you could choose the level of climate finance provided by developed countries to developing countries in 2035, what would you choose?"))
  e <- create_item("ncqg_full", labels = c("$0" = 0, "$26 bn" = 26, "$100 bn" = 100, "$300 bn" = 300, "$600 bn" = 600, "$1,000 bn" = 1000, "$5,000 bn" = 5000),
                   grep = T, keep_original = T, values = c("\\$0", "\\$26", "\\$100", "\\$300", "\\$600", "\\$1,000", "\\$5,000"), df = e, annotation = paste0("ncqg_full: ~ variant_ncqg: Full. 0/26/100/300/600/1000/5000.", Label(e$ncqg_full)))
  if (all(c("ncqg", "ncqg_full") %in% names(e))) {
    e$variant_ncqg <- ifelse(e$variant_ncqg_maritime %in% 2, "Full", "Short")
    label(e$variant_ncqg) <- "variant_ncqg: Full/Short. Full: A lot of explanations, answers in numerical grant-equivalent; Short: Shorter, answers in terms of who defends them or what they mean."
    # e$ncqg_fusion <- as.character(e$ncqg_original)
    # e$ncqg_fusion[e$variant_ncqg %in% "full"] <- as.character(e$ncqg_full_original)[e$variant_ncqg %in% "full"]
    e$ncqg_fusion <- ifelse(e$variant_ncqg %in% "Full", as.character(e$ncqg_full_original), as.character(e$ncqg_original))
    e <- create_item("ncqg_fusion", labels = c("$0" = 0, "Less" = 10, "Stable" = 26, "More loans" = 30, "$100 bn" = 100, "$200 bn" = 200, "300 bn" = 300, "$600 bn" = 600, "$1,000 bn" = 1e3, "$5,000 bn" = 5e3),
                   grep = T, values = c("Stop|\\$0", "Reduce", "\\$26", "Increase loans", "\\$100", "\\$200", "\\$300", "\\$600", "\\$1,000", "\\$5,000"), df = e, annotation = "ncqg_fusion: 0/10/26/30/100/200/300/600/1k/5k: Fusion of ncqg and ncqg_full.")
  }
  e <- create_item(variables_transfer_how, labels = c("Wrong" = -1, "Acceptable" = 0, "Right" = 1, "Best" = 2), grep = T, values = c("wrong", "acceptable", "right", "best"), df = e)
  e$variant_sustainable_future <- ifelse(!is.na(e$sustainable_future_a), "a", ifelse(!is.na(e$sustainable_future_b), "b", "s")) # variant_radical_redistr
  label(e$variant_sustainable_future) <- "variant_sustainable_future: a/b/s a: A == sustainable / b: B == sustainable / s: B == sustainable and shorter (bullet points)."
  e$sustainable_future_A <- e$sustainable_future_a == "Scenario A"
  e$sustainable_future_B <- e$sustainable_future_b == "Scenario B"
  if (pilot) e$sustainable_future <- ifelse(grepl("B", e$sustainable_future_b) | grepl("B", e$sustainable_future_s) | grepl("A", e$sustainable_future_a), T, F)
  else e$sustainable_future <- ifelse(grepl("B", e$sustainable_future_b) | grepl("A", e$sustainable_future_a), T, F)
  e <- create_item("vote_intl_coalition", labels = c("Less likely" = -1, "Equally likely" = 0, "More likely" = 1), grep = T, values = c("less likely", "not depend", "more likely"), df = e)
  if ("vote_intl_coalition" %in% names(e)) e$vote_intl_coalition_less_likely <- e$vote_intl_coalition == -1
  if ("convergence_support" %in% names(e)) e$convergence_support[is.na(e$convergence_support)] <- "prefer not" # only 11, when I realized that there was not yet "force response" for this question
  if ("convergence_support" %in% names(e)) e <- create_item("convergence_support", labels = c("No" = -1, "PNR" = 0, "Yes" = 1), grep = T, values = c("No", "prefer not", "Yes"), missing.values = c(0, NA), df = e)
  e <- create_item("gcs_comprehension", labels = c("decrease" = -1, "not be affected" = 0, "increase" = 1), df = e)
  e$gcs_understood <- e$gcs_comprehension == 1
  e <- create_item("my_tax_global_nation", labels = c("Strongly disagree" = -2, "Disagree" = -1, "Neither agree nor disagree" = 0, "Agree" = 1, "Strongly agree" = 2), df = e)
  e <- create_item("group_defended", labels = c("Family and self" = -2, "Community (region, gender...)" = -1, "Fellow citizens" = 0, "Humans" = 1, "Sentient beings" = 2), 
                   grep = T, values = c("family|self", "religion|Community", "Americans|Fellow citizens", "Humans", "Sentient"), df = e) # In NHB 0-7, Relatives 1; Culture/religion 3; Europeans 5
  e <- create_item("survey_biased", labels = c("Yes, left" = -1, "Yes, right" = 0, "No" = 1), grep = T, values = c("left", "right", "No"), df = e) 

  if (country == "RU") {
    e$zipcode_clean <- n(e$zipcode)
    e$zipcode_clean[no.na(e$zipcode_clean, 0) > 999] <- n(substr(e$zipcode[no.na(e$zipcode_clean, 0) > 999], 0, 3))
    regions_ru <<- list("1" = c(101:105, 107:109, 111, 115, 117, 119, 121, 123:125, 127, 129:130, 135, 190:200), # Moscow & St-Petersburg (Federal cities of Moscow and St. Petersburg)
                        "2" = c(241:243, 152:153, 248:249, 155:157, 140:144, 390:391, 214:216, 300:303, 600:602, 150, 236, 238, 160:175, 180:188), # Northwest (Central economic region (except Moscou), Northwestern (except Saint:Pétersbourg), Northern, Kaliningrad)
                        "3" = c(299, 305:309, 344, 346:347, 350, 352:357, 358:359, 360:361, 362:363, 364, 366:369, 385:386, 392:397, 398:399, 400, 403:404, 410, 412:414, 416, 420:423, 424:427, 428:429, 430:433, 440, 442:443, 445:446, 450, 452:457, 460:462, 603, 606:607, 610, 612:614, 617:620, 622:624, 640:641), # Southwest (Central Black Earth, Volga, Volga:Vyatka, North Caucasus, Ural)
                        "4" = c(652:656, 658:659, 646:650,  632:634, 636, 625:630, 664:671, 660,662:663, 673:677, 679:690, 692:694)) # East = 4	Siberia and Far East region (West Siberian, East Siberian and Far Eastern economic regions)) 
    e$region <- NA
    for (i in names(regions_ru)) e$region[e$zipcode_clean %in% regions_ru[[i]]] <- i
  }
  
  e$millionaire_factor <- factor(e$millionaire_agg)
  if ("urbanity" %in% names(e)) e$urbanity_factor <- e$urbanity_na_as_city <- no.na(factor(e$urbanity), rep = "NA")
  else e$urbanity_factor <- "NA"
  e$education_factor <- factor(e$education)
  e$income_factor <- relevel(factor(no.na(factor(e$income_quartile), rep = "NA")), "Q1")
  if ("region" %in% names(e)) e$region_factor <- no.na(factor(e$region), rep = "NA")
  if ("region" %in% names(e)) e$region_factor[e$region_factor == "0"] <- "NA"
  if ("region" %in% names(e)) e$country_region <- paste(e$country, e$region_factor)
  if ("urbanity" %in% names(e)) e$urbanity_na_as_city[is.na(e$urbanity)] <- "Cities"
  # for (i in unique(e$country_region)) if (sum(e$country_region %in% i) <= 3) e$country_region[e$country_region %in% i] <- NA
  
  for (i in c(1, 3)) e[[paste0("top", i, "_tax_support_binary")]] <- ifelse(e[[paste0("top", i, "_tax_support")]] == 0, NA, 100*(e[[paste0("top", i, "_tax_support")]] > 0))
  for (i in c(1, 3)) label(e[[paste0("top", i, "_tax_support_binary")]]) <- paste0("top", i, "_tax_support_binary: 0/100/NA Indicator of support for top", i, "_tax, with indifference recoded as NA.")
  for (v in variables_well_being) e[[paste0(v, "_original")]] <- e[[v]]
  for (v in variables_well_being) {
    temp <- Label(e[[v]])
    e[[v]] <- as.numeric(gsub("[^0-9]", "", e[[v]]))
    label(e[[v]]) <- temp }
  
  if (country == "RU") e$language <- "RU"
  e$lang <- e$language
  e$lang[grepl("EN|SQI", e$lang)] <- "EN"
  e$lang[grepl("ES", e$lang)] <- "ES"
  e$lang[grepl("FR", e$lang)] <- "FR"
  e$lang[grepl("DE", e$lang)] <- "DE"
  e$lang[grepl("IT", e$lang)] <- "IT"
  
  e$variant_field <- e$field <- NA
  for (v in intersect(variables_field, names(e))) e$field[!is.na(e[[v]]) & e[[v]] != ""] <- e[[v]][!is.na(e[[v]]) & e[[v]] != ""]
  if (country == "RU") for (v in intersect(variables_field, names(e))) e$variant_field[e[[v]]!=""] <- sub("_field", "", v)
  else for (v in intersect(variables_field, names(e))) e$variant_field[!is.na(e[[paste0("Open-endedfield_order_", v)]])] <- sub("_field", "", v)
  
  # To recode fields (pre-treatment necessary so the following code works): ~2h/country
  # 0. Create the different sheets in .xlsm (copying sheets in R doesn't preserve macros): first run the lines below, then copy/paste the macro VBA in each sheet
  # wb <- wb_load("../data_raw/fields/template.xlsm")
  # # Version 4
  # for (v in c(variables_field, "comment_field")) for (i in 1:4) wb$clone_worksheet(old = "ex", new = paste0(sub("_field", "", v), i))
  # # # Version 1 # Perhaps in 2 for US?
  # # for (v in c("field", "comment_field")) wb$clone_worksheet(old = "ex", new = paste0(sub("_field", "", v)))
  # wb$save(paste0("../data_raw/fields/country.xlsm"))
  # # Open VBA (Alt+F11) then for each sheet of country.xlsm, save:
  # Private Sub Worksheet_SelectionChange(ByVal Target As Excel.Range)
  #   Application.EnableEvents = False
  #   If Target.Cells.Count = 1 Then
  #     If Not Intersect(Target, Range("B2:DKK50")) Is Nothing Then
  #       Select Case Target.Value
  #       Case ""
  #         Target.Value = "1"
  #       Case "1"
  #         Target.Value = ""
  #       End Select
  #       Cells(1, ActiveCell.Column).Select
  #     End If
  #   End If
  #   Application.EnableEvents = True
  # End Sub
  
  # write.csv(all[, c("lang", "field")], "../data_raw/fields/all.csv", na = "", row.names = F)
  # write.csv(all[sample.int(11000, 750), c("lang", "field")], "../data_raw/fields/all_excerpt.csv", na = "", row.names = F)
  { # field # 2-3h/1k respondents; $0.7/1k resp. with ChatGPT
    # NB: Empty + Other: suspicious field (copy/paste from unrelated content)
    # Impression: many people think from their own perspective (e.g. "my pension", "I want a house") and don't refer to the broader picture i.e. political reform
    # SA: Many answer with their hobbies e.g. sport/soccer (perhaps a bad translation of 'concerns'?); want to become millionaire; billionaire; start a business; buy a house; car; are satisfied with their income; talk of "self-injustice" (sin); of raising children; Palestine; orphan's oppression; travel
    # DE: Old age poverty; immigration; climate; the return of growth / economic situation; free time; war (in Europe); bureaucracy
    # US: The economy; Trump; breaches to the constitution; abortion; gun control; 
    # PL: health; war; inequality; immigration; holiday; truthfulness/honesty; disable people
    # JP: pension level; (consumption) tax cut; rice price increases; declining birth rate; childcare support reduce number of parliament members; preferential treatment of foreigners; social assistance is too strong / hard work unrewarded (~1% answers); stock prices
    # CH: equality; immigration; gender equality
    # ES: health; housing; "Salud, dinero y amor"; corruption; water access; global poverty; squatters
    # IT: health; serenity / peace of mind; safety; money; war; work stress; world hunger; mental health; more time; femicide
    # GB: cost of living; immigration; comfortable life; NHS; mental health; holocaust; dangerous road and driving; being unjustly imprisoned; cut in winter fuel allowance
    # FR: nothing; insecurity; holidays/time; public deficit; equality; gender equality
    # RU: health; metaphysical >questions< (e.g. why evil dominates; death; what to do); lies; travel; buy a car/house; wanting to live; 
    # Combination: old_age + taxes_welfare: pension system; old_age + cost_of_living: old age poverty / own pension too low; other + empty: nonsensical; taxes_welfare + inequality: redistribution; 
    #              taxes_welfare + cost_of_living: cut taxes / reforms to improve one's income; welfare_taxes + health: healthcare system; health + family: worries about health of family member
    # Absent: sex; have more kids (except perhaps in SA); IT, ES: foreigners privileges instead of national preference; solutions to stop climate change
    # Almost absent: love; loneliness; depression; tax the rich or raise minimum wage (most people mention inequality/poverty but not solutions)
    # Examples
    # FR: Pourquoi il y a un dogme de la réduction du déficit ? Faut il absolument le réduire, pourquoi et comment ?
    # FR: J'ai besoin de donner du sens à ma vie. Je souhaite davantage de justice sociale
    # FR: la vie en elle-même est injuste, car nous ne sommes pas égaux face à la maladie, les risques géo-politiques, ... en fonction de notre lieu de naissance et de notre héritage génétique
    # FR: Trouver un mec
    # FR: Ces jours-ci je n'ai aucun préoccupation .
    # FR: j ai besoin d assez d argent pour vivre normalement sans stresser pour les fins de mois
    # FR: La France va mal
    # FR: La pauvreté
    # GB: In my opinion, the greatest injustice of all is that hard work is not rewarded in this country. We penalise those who work hard by raising their taxes (thus encouraging people to emigrate) while raising living costs left, right and centre. It's impossible to have a good quality of life in this country unless you were lucky enough to be born wealthy.
    # GB: I wish to be the better father to my kids which a kind of experience i didn't have, I also need to be able to provide everything my family want.
    # GB: A lottery win; Keir Starmer to call a General Election; Palestine to evaporate\n 
    # GB: I need food, water and a warm house. I wish to be able to provide these things for myself without the help of benefits.
    # GB: Local councils not giving priority to mothers with toddlers that's classed as being homeless and give empty coucil homes to people that's not even lived in this area before
    # GB: allowing undocumented invading scroungers to remain in this country
    # GB: to live a long healthy, meaningful life
    # GB: I have a disability and several other conditions and am therefore unfit for work. My main concern is my government which I voted for impoverishing me or trying to force me back to work, which will likely kill me
    # GB: Boat loads of useless scroungers landing here every day, cost of living going up, bills going up, useless bus service, useless train service, roads in a mess, nhs in a mess, scammers ringing me up every day, cost of beer, cost of fish and chips and chinese take aways, useless labour party... need I go one?
    # GB: Indifference to suffering, where the powerful ignore the cries of the weak.
    # GB: Climate change
    # GB: Immigration and cost of living
    # GB: Cost of living, being able to purchase my own home, a good future for my child
    # GB: Being unjustly imprisoned.
    # GB: Cost of living
    # IT: world hunger
    # IT: Healthcare, lack of general practitioners
    # IT: The extreme poverty of some peoples
    # IT: None, you know there are also intelligent people who live without unnecessary worries
    # IT: sea sun
    # IT: a lot of money to be able to attend university without working
    # IT: After-school or full-time. An afternoon service for working parents, anyway. Instead, they prefer to give money to those who stay at home. Giving that money to childcare centers and babysitting would boost the economy.
    # SA: Taking care of health, work, and reaching a high, prestigious position
    # SA: Injustice comes from the people closest to you and you have to live with it.
    # SA: I want to be a millionaire
    # SA: I have an excellent financial future.
    # SA: Sports\n Video Games\n Cooking\n
    # SA: Obtaining a prestigious social status and distinguished social comfort
    # SA: I want a palace with full servants for myself
    # SA: Hope society respects the elderly more, stop treating us as 'people who need care' – we can still share our wisdom and experience
    # SA: To obtain citizenship in the country in which I was born
    # SA: I wish to change my gender and wear my wife's clothes, put on her makeup, and live my femininity with complete freedom.
    # DE: Exploitation of poorer countries for our prosperity
    # DE: that politicians are too concerned with their own interests and are deliberately trying to keep us stupid and uninformed.
    # DE: I am very concerned about climate change and immigration in the country
    # DE: More money, more free time
    # DE: the gap between rich and poor
    # DE: Health
    # DE: That those who already have enough always want more
    # DE: That Germany helps more foreigners than us Germans ourselves.
    # DE: Money, as people with a lot of money are often preferred
    # DE: That the government thinks about the people, about its OWN, not just about others and the money goes to waste - the Ukrainians need help, no questions asked, but not in the form of indiscriminately handing out money.\n Germany has not been at the top for a long time, we are at the bottom of the list in everything\n education, health, etc.
    # US: Trump is trying to become a DICK-tator and he is ruining the world and the economy.
    # US: I am afraid of losing my job because it is my source of livelihood
    # US: Being punished for something you didn’t do.
    # US: I wish my daughter would beat her illness.  I wish I was a widow.  I wish I did not have a stepdaughter.
    # US: I want the stock market to go up for my 401k and for the government to fix social security so I can retire in a few years
    # US: That people go hungry every day and there is plenty of money floating around for stupid things
    # US: To find a purpose
    # US: Being born without my consent (the world is a mess and I don't want to be a part of it).
    # US: I would love to live a happy healthy fulfilling life that makes a difference in the world that is long lasting
    # US: Since my health is good, and my income exceeds my needs, I have no concerns.
    # US: To live in peace
    # US: To leave a positive legacy.
    # US: The economy
    # US: I only wish to safe enough money to be able to retire in the next few years confortably
    # US: People. People suck. The world is crazy and scary.
    # US: We are just on SS. Getting through each month is a struggle.But the Lord answers our prayers and people help us with food.
    # US: One of the issues is me
    # US: Trump getting us into a war with Iran. I voted for Trump and feel betrayed by his actions. I deeply regret voting for him at this point but just couldn't justify a vote for Kamala as she seemed objectively worse. Beyond that, financials like bills and raising two young children is expensive these days.
    # PL: Probably not🩷But I prefer not to answer the previous question because it is my personal matter. I hope you understand that ❤️
    # PL: That people mock the poorer ones
    # PL: The suffering of children living in poverty and violence.
    # PL: I dream of achieving peace in my life. I would like to be calm and free, without obligations, live day to day, have plenty of money, be able to help my family and animals, and care for the environment.
    # PL: About peace and being alone for a month.
    # PL: I dream of having enough money for new windows someday because I don't have much, I even have to live from paycheck to paycheck.
    # PL: The descent of Poland and Europe into the abyss of totalitarian neo-communism
    # PL: I dream of good health
    # PL: In my opinion, the greatest injustice in the world is disease, war, and professional inequality (e.g., an influencer earns more than a doctor).
    # PL: That some people have everything handed to them on a golden platter, and good people often suffer and work hard.
    # PL: I don't need anything anymore and I don't dream of anything anymore
    # JP: Do not reduce the consumption tax
    # JP: The answer is to increase disposable income. To that end, I would like the Liberal Democratic Party to realize the increase in the basic deduction to 1.71 million yen without any income restrictions, as advocated by the Democratic Party for the People.
    # JP: There is nothing fair about it, and that is to be expected.
    # JP: Having one-sided judgments from others negatively affect one's own behavior and social life
    # JP: A peaceful society, a society where it is easy to raise children, and a society where children can live in peace. \n When it comes to family, I would like to have a home where we have cheerful and fun conversations, and go on domestic and overseas trips.
    # JP: Tax exploitation of people with high incomes. The idea that high income is bad
    # JP: A future where our children will not have to worry. We are being taxed even though our income is not increasing, so I would like an easy-to-understand explanation as to why taxes are being increased and what they are being used for.
    # JP: When you're not feeling well, your methodology can be biased.
    # JP: What will happen to pensions and health insurance in the future?
    # JP: It's not something I particularly wish for, but if I had to say, I just want my children to be happy.
    # JP: A society where only a limited number of certain people can gain or benefit.
    # JP: The value of one vote should be changed based on age.
    # JP: I cannot understand why the abbreviations for both the Constitutional Democratic Party and the Democratic Party for the People were "Democratic Party" in the last election. \n The votes that should have gone to the Constitutional Democratic Party were split with the Democratic Party for the People. \n I feel very uncomfortable about this.
    # JP: The price of rice
    # JP: People who work hard aren't rewarded
    # CH: Inequality of opportunity in education and unequal tax distribution in the cantons.
    # CH: Je ne ferai pas le bien de mon pays
    # CH: j'ai besoin que la Suisse pense aux Suisse avant les autres
    # CH: Prendre soin de mamille, voir mes enfants grandir, aimer chaque jour un peu plus ma femme et mes investissements
    # CH: Pourquoi est-il si difficile d'admettre, que les chemintrails sont néfastes et dangereux pour la santé, par la conseil fédéral
    # CH: qu on aide 1 peu plus les retraite en suisse avant d aider les autres pays baisser les caisses maladie 1 quart de salaire pour ma part inadmissible
    # ES: La miseria y el sufrimiento de los niños en todo el mundo
    # ES: Salud, dinero, y amor
    # ES: I need less choice in the capitalist system. It forces me to use time in my personal life for minimal enjoyment within what my socioeconomic class can offer. I wish I had more personal time since I use 80% of it to survive: mostly I use it to replenish energy for the next effort I will need to make. I would like a little more tradition in my life. Personally, I would need a lot more life around me.
    # ES: mi trabajo, me genera mucho estrés
    # ES: accused of murder
    # ES: Más sexo en mi vida
    # ES: La desigualdad entre los países ricos y los pobres, los que pueden evitar que los otros pasen hambre
    # ES: la incapacidad de los políticos en arreglar los problemas de los otros países para que la gente de esos países tenga que emigrar y que eso este causando problemas en mi país de sobrepoblación o mas vandalismo o menos puestos de trabajo
    # ES: Que los países del mundo miren hacia otro lado cuando en África hay más de 10 millones de personas en pobreza extrema y hambruna
    # ES: Que seres  humanos no tengan los beneficios que tenemos otros seres humanos
    # JP: Stable economic growth
    # JP: Being discriminated against for things you can't change through your own efforts
    # JP: The rights of each individual are not equal, there is discrimination and prejudice, and there are always exploiters and exploited.
    # JP: Stable economic growth will ensure that current savings do not depreciate and funds for retirement are secured.
    # JP: I am currently living with an incurable disease, but I want to put an end to it somehow. Because of the disease, I can't speak, I can't eat, I can't move my body at all, and I can't breathe, so I'm getting discouraged as I spend my days in bed. I'm not going to let this disease get the better of me, and I'm going to survive until the day I'm cured, so that's all I can hope for. 
    #     When I can stand up, I'll take a deep breath and drink as much water as I can. That's all I think about every day.
    # JP: I was unfairly fired from my job just now.
    # JP: The government benefits are always given to people who don't pay taxes. I'm a pensioner, but I'm always ineligible because my income is just a little above the eligible amount. I've been paying into my pension diligently for the past 40 years, but my pension is less than that of people on welfare, and I don't understand why people on welfare get to pay for their monthly health insurance, medical expenses, and medicine for free. 
    #     There are many people on welfare who are able to work.　
    # JP: People who work hard are not rewarded.
    # US: All of my needs in life are taken care of, I wish to see society shift it's mindstate towards helping others and treating each other with kindness and love.
    # US: My needs are basic needs of every person, food, shelter, water, clothes, friendship and love.  My wishes are for peace and love.
    # US: I have simple needs - food, clothing, shelter, healthcare. I have much more than that. I wish for world peace and for the end of hunger both here and in the world.
    # US: A sexy woman next to me that Is all mine
    # US: I wish I lived on a small farm and make it self sufficient so I don't have to deal with people.
    # US: 911. We, Americans, do our damnedest to set a good example for other countries, assist in their wars, even give them food and money, just to be terrorized.
    # US: When people you care about dont put your best interest at heart
    # US: To be left alone
    # US [white woman 65-69]: Entire sections of the population being singled out for false accusations without the ability to defend themselves
    # US: It depends upon what you mean by that question as it is pretty nosy for a survey question
    # US [hunger]: That homelessness and famine is still a large issue in the USA. 
    # US: To be completely honest, I don't know what injustice really means
    # US: Wrongful convictions
    # RU: SVO [NdR: Special Military Operation]; hostile attitude towards Russia on the part of other countries.
    # RU: Buy a nice apartment. Travel the world.
    # RU: Lies
    # RU: I just want to live
    # RU: Freedom of speech
    # RU: The predominance of evil over good
    # RU: Find a part-time job, at least for 15,000 rubles. It is very difficult to live on a small pension.
    # RU: death
    # RU: Poor treatment of the elderly. Devastation in small towns and villages.
    # RU: Who is to blame? What to do?
    # RU: I want to go to the USSR.
    # RU: how much time is left to live?
    # RU: What should be the goal of the development of our society and human civilization as a whole? What humanity has chosen as its current goal—maximizing individual profit—is leading human civilization to destruction.
    # RU: Why are we interested in material life but not in spiritual life?
    # RU: Inequality in the ownership of natural resources and means of production
    # RU: Nazism and its consequences
    # RU: When will the war with Ukraine end?
    # RU: I'll keep my wishes to myself
    # RU: Are children important?
    # RU: Is it important to love and idolize your beloved if you have one?
    # RU: Sleep, have sex and drink alcohol
    # RU: When will the state stop fleecing its people, inflating prices for everything, selling off resources on the cheap, letting migrants in and letting them get away with everything, while brazenly robbing its own people through the security forces it has created, and sending young people to the slaughter in droves, profiting from it and lining its pockets?
  }  
  { # comment_field (keywords: good, interest, thank, difficult|confus, no comment|nothing in particular|^nothing$|^none$, thought provoking|food for though|informative|learn, corrupt)
    # US: I skipped the income redistribution question because I think it should be based on WEALTH not income.
    # US: It's a good survey but not an easy one
    # US: I'm not against providing support for low-income nations.  We need to figure out as a nation who we should send aid to.  For example, some nations would gladly take out Americans due to their hate towards them, but still receive aid from the US.  Why??
    # US: Great survey!!
    # US: People don’t owe these turd worlders a damn thing
    # US: The ideas presented were quite intriguing, and I don't know what I would do if the choices were real.
    # US: Very thought provoking, hard to value what i am ready to give up to help less fortunate countries- this survey helped mething about it a little differently.
    # US: It was a thought-provoking survey. I always worry about corruption when sending money to not only my country, but others as well. It doesn't seem to trickle down as intended.
    # US: I should not pay taxes for something that I get no benefit from. I am happy to help other people, but let me make that decision to help them. Don’t tell me that I have to help them and take the money from me in taxes. I help others because I am a Christian and it’s the right thing to do.
    # US: I had not thought much about my country’s financial responsibility to poorer countries, and I enjoyed this survey because it made me consider that. As a Christian American raised by conservatives, I definitely feel torn between my religious duty to other humans who need help, and my desire not to fiscally punish who have worked for hard the wealth they have accumulated.
    # US: La encuesta muy segada sobre la izquierda, esas personas que dicen defender el medio ambiente, son los que mas consumen aguas, combustible y electricidad, incluso son los que más daño le hacen al medio ambiente. Tienen la falta de respeto que cuando se reúnen la mayoría asisten en sus aviones particulares.
    # US: I don't think the rich should be taxed more they work just as hard as the poor.
    # US: The survey was perfect.
    # US: This survey alone can be an educational course. I have learned much.
    # US: What a disaster all this climate shake down stuff is.  If one believes that the climate is warming based on cyclical patterns from thousands of years then all of this is a lie.  We should help people out of the generosity of our hearts, not compulsion from a godless corrupt government.   Sieg heil
    # US: Redistribution of wealth should not be allowed it is never worked. The people that gives us jobs in this country or the richest ones. The top one percent pay 60% of our taxes in this country how is it fair to make them pay more we do not have a revenue problem we have a spending problem.
    # US: The issue for me in the whole project is, neither my wife or myself have any children or family, thus the care is not there for the future. We also struggle to live a decent life in a an area where crime is low. With the rise of prices we will ahve an issue in retiring and enjoying life.
    # US: It was definitely a survey that made me question my stance on world equality. I usually focus my donations and help to the USA
    # US: Of all the issues going on i. The world this is what your focusing on. Must be nice to waste money on things like this lol
    # US: I support improving the environment and looking for ways to cut back climate change but not implementing additional taxes on other people's money. So the questions are very difficult because the two are lumped together in ways that they shouldn't be.
    # US: Some interesting ideas, some go too far.  I don't see any really happening, this country is going the opposite direction lately
    # US: I am not about spending my hard earned money on programs to benefit everyone
    # US: This was the most interesting survey I've taken so far. Thank you!
    # US: I do not support America redistrubing wealth to other nations. I would be slightly more amicable to some level of wealth redistribution based on income that benefits all working class citizens, especially WHITE CAUCASIAN working class citizens. \n \n Black people ALREADY have affirmative action and DEI, they do not need additional handouts targeted specifically at them. 
    #     They can get a job. Any potential future basic income has to be targeted an all working class citizens universally, as we automate the workforce ramping up productivity. \n \n I am in favor of domestic policy to address climate change, like investing in upgrading our energy grids and energy production to renewable sources of energy. And also policies like tax credits to companies who innovate in green energy. 
    #     In am 100% opposed to White Americans resdributing wealth to non-white Americans, and im opposed to Americans as a whole redistributing wealth to non Americans. \n \n The only forms of minor wealth redistribution i would consider is some redistribution from billionaires to universal programs that benefit all working class Americans.
    # GB: The survey covers important and thought-provoking topics, but some questions could benefit from more neutral phrasing to avoid subtly guiding responses, particularly the one about reparations. Additionally, providing options like \'I'm unsure\' or \'I prefer not to answer\' could help ensure that respondents feel more comfortable giving honest, reflective answers.
    # GB: I hope a scheme is created whereby every nation will benefit from including the UK. The rich and the poor can always be equally satisfied.
    # GB: The survey raised important global issues, especially around climate change, inequality, and international cooperation. However, the framing felt quite one-sided at times, leaning heavily toward left-wing solutions without presenting alternative viewpoints. It would be helpful to include a more balanced perspective to allow respondents to engage more critically with the topics. Overall, I appreciated the opportunity to reflect on global challenges.
    # SA: This survey is one of the best and most useful surveys in the world.
    # SA: People should learn to help one another and be kind to others
    # SA: We come together we save the world
    # JP: I would like to see low-income earners separated from those who have low income because they are having fun and those who have low income because of disabilities, etc., instead of lumping them all together. I don't want to cover up those who are having fun.
    # JP: I think it's an ideal, a utopia. If you don't aim for an ideal, a utopia, reality won't move in that direction. Even if you think it would be ideal to realize that utopia, you're in a dilemma because you have to prioritize yourself and your family.
    # JP: I agree with distributing income to low-income countries, but the method is important. Some powerful leaders of low-income countries will put it in their own pockets, and it will not reach the common people who really need it.
    # JP: I'm so busy trying to make ends meet every day that the content of this research is something I would never normally think about.
    # JP: An equal world is impossible. It's just a dream. Rich people don't want their money to be used by someone else. They don't want to help someone else's success. Because someone will always try to steal it. In the end, rich people want to spend their money on themselves.
    # JP: I was made to think that conflicts do not arise because those who have nothing try to take from those who have, but because those who have something fear losing what they could have.
    # JP: I felt a great deal of distrust due to the lack of data to support the background of the questions and the fact that some of the questions were written in an arbitrary and misleading way.
    # JP: I felt that this theme had a strong religious element to it. It has a strong Christian concept, and I wonder if Islamic and Buddhist countries would agree with it.
    # JP: It was a good opportunity to take a critical look at myself.
    # JP: It's an interesting survey as an attempt, but it's hard to agree with all of the specific measures.
    # JP: I think that global taxation to close the gap between poor and rich countries would be a great way to prevent illegal immigration.
    # JP: This is a topic that we don't come across on a daily basis, but I believe questions like this will help change people's attitudes.
    # JP: The translation into Japanese is rough and there are many parts that are hard to understand.
    # JP: I think it is quite difficult to come up with a policy that satisfies all of humanity.
    # JP: He is such a kind person.
    # JP: The gap between rich and poor leads to poverty of spirit.
    # JP: I used to be a right-winger, but after reading about various global environmental issues through the questions, my views have changed considerably.
    # JP: By participating in this survey, I realized that we need to pay close attention to global issues, so I would like to start collecting information little by little from now on.
    # JP: The questions were difficult but fascinating, and made me realize that I am just one member of the global community.
    # CH: Pas assez de proposition dans certaine question, le sentiment de passez pour un méchant dans les réponses allant a l'encontre du sauvetage mondial car pas de proposition intermédiaire.
    # CH: I'm a generous person and I like to support others, those in need, NGOs, etc. But I want to decide for myself where and how my money is used. I volunteer and see a lot even in wealthy Switzerland. I want to ensure social justice, job security, and the elderly in Switzerland first, 
    #     rather than supporting the environment, climate, and poor countries! I see many Swiss people who have worked for years and have practically nothing. They should be helped first, not third world countries, which are often dictatorial or corrupt, robbing their own people. I don't feel responsible for that. I prefer to donate abroad in a way that ensures I know exactly where and how the funds are being used.
    # CH: This enquête est clairement biasée car on passe pour une mauvaise personne si on est pas d'accord d'aider les other pays, aidons nos citoyens plutôt que les other pays
    # CH: L'enquête n'étais pas vraiment biasée et cela est bien, chacun peu donner son avis sur chaque question
    # CH: It would be fantastic if such conditions existed, but unfortunately it won't be possible; the egoism is too great!
    # CH: Poverty: I don't want more people to survive; there are already too many people on our planet.\n Climate change: It's quite possible that humans aren't solely responsible for the change, but that solar activity has an even greater influence. For example, 10,500 years ago, it was so warm on Diavolezza that large trees could grow there. However, scientists at the University of Bern have been banned from publishing this.
    # CH: I thought the chart was great. I also really liked the automatically adjusted income!
    # CH: Je n'ai encore jamais eut un sondage aussi terrible que celui-ci: aussi mal traduit et ressemblant plus à n'importe quoi. C'est, je pense, the sommet des sondages qui n'en n'ont rien à foutre des réponses. J'adore! typique de la vie currentuelle: on balance et on s'en fou
    # PL: The survey was impartial, but I'll be honest, I'm afraid to explain what's supposed to change. If someone wants to help, they should do it on their own, not take someone else's money, even for a higher purpose. I love my gasoline-powered cars, I love cash, I love meat, and I love my way of life. Unfortunately, for the good of the world, modern-day global slavery is being introduced by restricting basic rights under the guise of improvements or environmental protection.
    # PL: My not-so-positive attitude towards the redistribution problem stems from the lack of participation of all (China).
    # PL: A very interesting survey that gives food for thought.
    # PL: nice and pleasant survey great because you could win something
    # FR: On a été des coloniaux, nous avons développé ces pays qui nous crache dessus aujourd'hui.\n Alors qu'ils se démerde maintenant
    # FR: questions difficiles à comprendre et certaines informations assez difficiles à croire
    # FR: pour pouvoir subventionner le plan climat mondial, la France devrait commencer par réduire sa dette drastiquement : il faut que la France se redonne les moyens d'être généreux, ce qui n'est pas possible avec le poids de la dette actuelle.
    # FR: Je pense que, naturellement, nous avons tous en nous un désir profond d’aider notre prochain. C’est une impulsion humaine fondamentale, liée à l’empathie et à la solidarité. Cependant, la réalité de la vie — avec ses contraintes, ses peurs et ses incertitudes — fait souvent que nous mettons nos propres besoins en priorité. On pense d’abord à soi, parfois par instinct de survie ou simplement parce qu’on est submergé par nos propres difficultés.
    # FR: Le concept est très intéressant, mais, je ne suis absolument pas certain que les humains des pays riches acceptent d'aider les humains des pays pauvres !\n Le capitalisme a diviser les gens depuis le bas de l'échelle sociale, dans les pays riches. A tel point qu'ils ne pensent qu'a eux et à leur famille ainsi que leur bien matériel... et malheureusement, ils ne pensent, en aucun cas, aux humains des pays pauvres... 
    #     Et concernant la planète, (nature, faune etc), ils n'en ont rien à faire. Il faudrait leur enlever la TV ainsi que la voiture et la piscine, pour qu'ils réalisent.. Bref, je suis plutôt très pessimiste concernant l'évolution du monde.. Merci
    # IT: Interesting but a bit utopian.
    # IT: I support taxing billionaires and those who hold global wealth for the benefit of the poor in other countries, especially in Africa, Asia, and other areas that suffer most from the exploitation perpetrated over centuries by so-called developed countries. I am strongly opposed to the environmental revolution aimed at eliminating motor vehicles. Much more needs to be done; in many respects, electric cars represent a potential future environmental problem. 
    #     The real environmental problem is being ignored: the industrial system and, to some extent, the agricultural system.
    # IT: I am in favor of regulating births in the poorest countries.
    # IT: The program is well-structured and fair, but I don't believe in the honesty of those who will manage these huge sums of money; in the end, seventy percent will end up in the pockets of those who manage it all, and only thirty percent will be used for the intended purposes, and it will be used late or incorrectly. This is what is happening in Italy with the National Research Council (PNR).
    # ES: Why do they want a comment, what's the point, will they even read it?
    # DE: The correct spelling is \'wealth tax\' with an \'s\': the tax on wealth and not the tax of assets! (Die richtige Schreibweise ist \'Vermögensteuer\' mit einem \'s\': Die Steuer auf das Vermögen und nicht die Steuer des Vermögens!)
    # DE: Politics, environmental protection, etc., are not models that can be adjusted with a few 'sliders.' Changing ONE 'adjustment screw' has unimagined, overly complex, global consequences that cannot be predicted in the laboratory (see the current situation in the USA).
    # DE: You should try to implement these ideas.
    # DE: Eat the Rich
    # DE: I am poor and will remain poor by German standards.\n But I'm still doing well.\n I want poor people in other countries to have a better life, because they have neither clean water nor sanitation.
    # DE: Having traveled extensively in third-world countries, I understand the concerns there. Education is the best step toward improving the situation there. Out with churches and in with schools. Support for education, yes, but a blanket distribution of value creation, no. Water, yes, but no wine.
    # RU: A survey that says 'Expansion of the Security Council' doesn't inspire any confidence.
    # RU: Resources will never be distributed equally, this is the law of economics.
    # RU: I'd like to see a solution to global climate change and poverty. But I don't want the cost of living to increase, for example, through gas prices, toll roads, and so on.
    # RU: No to war
    # RU: Increasing taxes for oligarchs is the right thing to do.
    # RU: Assistance is necessary on the condition that corruption is excluded at all stages.
    # RU: How can you live on a pension of 16,700 rubles after working for 38 years?
    # RU: I don't consider these problems to be a priority.
    # RU: There was a normal system in Soviet times, everyone was at roughly the same level. I'd like to bring it back, but.............................
    # RU: Global warming is a globalist scam.
    # RU: I am for change, people should help each other on a global scale
    # RU: If only everything were so good, but that will never happen.
    # RU: It is necessary to help people and animals and take care of nature
    # RU: There are some spelling errors in the questions. I'm not a teacher, but these errors are really glaring. Thank you for the survey; it's nice to know there are still people thinking about the future of the planet!
    # RU: If these programs worked, it would be great. But Western countries only rob underdeveloped countries, rather than help them.
  }
  
  # # 1. Skim through the fields and choose appropriate categories, then add them to country.xlsm using the lines below
  # field_names <<- c("example" = "ex", "categories" = "cat", "bias" = "bias", "problem" = "pb") # "display in excel" = "name"
  # field_names_names <<- names(field_names)
  # names(field_names_names) <<- field_names
  # var_field_names <<- paste0("field_", field_names)
  # wb <- wb_load("../data_raw/fields/country.xlsm")
  # # for (v in c(variables_field, "comment_field")) for (i in 1:4) wb$add_data(sheet = paste0(sub("_field", "", v), i), x = names(field_names), start_row = 2)
  # for (v in c("field_field", "comment_field")) wb$add_data(sheet = paste0(sub("_field", "", v)), x = names(field_names), start_row = 2)
  # wb$save(paste0("../data_raw/fields/country1.xlsm"))
  # # 2. Export the data to the .xlsm files
  # for (c in countries) { # TODO: functionalize
  #   file.copy(from = "../data_raw/fields/country1.xlsm", to = paste0("../data_raw/fields/", c, "1.xlsm"), overwrite = TRUE)
  #   wb <- loadWorkbook(paste0("../data_raw/fields/", c, "1.xlsm"))
  #   for (v in c("field", "comment_field")) for (i in "") { #
  #   # for (v in c(variables_field, "comment_field")) for (i in 1:4) {
  #     writeData(wb, sheet = paste0(sub("_field", "", v), i), x = t(as.vector(gsub("\n", "\\\\\\n ", gsub("\r", " ", gsub('\"', "\\\\\\'", d(c)[[v]])))[if(i == "") 1:nrow(d(c)) else seq(i, nrow(d(c)), 4)])), startCol = 2, colNames = F, na.string = "NA", keepNA = T)
  #     addStyle(wb, sheet = paste0(sub("_field", "", v), i), style = createStyle(wrapText = TRUE, ), rows = 1, cols = 2:3001)
  #     setColWidths(wb, sheet = paste0(sub("_field", "", v), i), cols = 1:3001, widths = 60)}
  #   saveWorkbook(wb, file = paste0("../data_raw/fields/", c, "1.xlsm"), overwrite = T)
  # }
  # # 3. If needed, translate to English: rename .xlsm into .xslx using the line below, translate on https://www.onlinedoctranslator.com/en/translationform, rename back to .xlsm using the second line below
  # for (c in countries) file.copy(from = paste0("../data_raw/fields/", c, "1.xlsm"), to = paste0("../data_raw/fields/", c, "1.xlsx"), overwrite = TRUE)
  # for (f in list.files("../data_raw/fields/")) if (grepl(".en.xlsx", f, fixed = T)) file.rename(paste0("../data_raw/fields/", f), paste0("../data_raw/fields/", sub("1\\..*\\.en\\.xlsx", "1en.xlsm", f)))
  # for (c in countries) file.remove(paste0("../data_raw/fields/", c, "1.xlsx"))
  # # 4. Click on appropriate cells in the .xlsm
  
  # no comment; confusing/difficult; thank you; praise survey; criticize survey; pro global redistr; doubt global redistr; pro climate; doubt climate; other
  # for (c in countries[-c(8,11)]) {
  #   file.copy(from = "../data_raw/fields/country2.xlsm", to = paste0("../data_raw/fields/", c, "2.xlsm"), overwrite = TRUE)
  #   wb <- loadWorkbook(paste0("../data_raw/fields/", c, "2.xlsm"))
  #   # for (v in c("field", "comment_field")) for (i in "") { #
  #   for (v in c("field", "comment_field")) for (i in 1:2) {
  #     writeData(wb, sheet = paste0(sub("_field", "", v), i), x = t(as.vector(gsub("\n", "\\\\\\n ", gsub("\r", " ", gsub('\"', "\\\\\\'", d(c)[[v]])))[if(i == "") 1:nrow(d(c)) else seq(i, nrow(d(c)), 2)])), startCol = 2, colNames = F, na.string = "NA", keepNA = T)
  #     addStyle(wb, sheet = paste0(sub("_field", "", v), i), style = createStyle(wrapText = TRUE, ), rows = 1, cols = 2:3001)
  #     setColWidths(wb, sheet = paste0(sub("_field", "", v), i), cols = 1:3001, widths = 60)}
  #   saveWorkbook(wb, file = paste0("../data_raw/fields/", c, "2.xlsm"), overwrite = T)
  # }
  # for (c in countries[-c(8,9,11)]) file.copy(from = paste0("../data_raw/fields/", c, "2.xlsm"), to = paste0("../data_raw/fields/", c, "2.xlsx"), overwrite = TRUE)
  # for (f in list.files("../data_raw/fields/")) if (grepl(".en.xlsx", f, fixed = T)) file.rename(paste0("../data_raw/fields/", f), paste0("../data_raw/fields/", sub("2\\..*\\.en\\.xlsx", "2en.xlsm", f)))
  # for (c in countries[-c(8,9,11)]) file.remove(paste0("../data_raw/fields/", c, "2.xlsx"))
  
  # Merge English translations for CH (after copying/renaming CH-DEen into CHen)
  # wb <- loadWorkbook(paste0("../data_raw/fields/CHen.xlsm"))
  # wbit <- loadWorkbook(paste0("../data_raw/fields/CH-ITen.xlsm"))
  # wbfr <- loadWorkbook(paste0("../data_raw/fields/CH-FRen.xlsm"))
  # for (v in c(variables_field, "comment_field")) for (i in 1:4) {
  #   wben <- read.xlsx(wb, sheet = paste0(sub("_field", "", v), i), colNames = F, skipEmptyCols = F)[1,]
  #   temp <- which(CH$language[seq(i, nrow(CH), 4)] %in% "IT-CH") + 1
  #   test <- read.xlsx(wbit, sheet = paste0(sub("_field", "", v), i), colNames = F, skipEmptyCols = F)[1,]
  #   if (max(temp) > length(wben)) wben <- cbind(wben, t(rep("NA", max(temp) - length(wben))))
  #   if (max(temp) > length(test)) test <- cbind(test, t(rep("NA", max(temp) - length(test))))
  #   wben[temp] <- test[temp]
  #   temp <- which(CH$language[seq(i, nrow(CH), 4)] %in% "FR-CH") + 1
  #   test <- read.xlsx(wbfr, sheet = paste0(sub("_field", "", v), i), colNames = F, skipEmptyCols = F)[1,]
  #   if (max(temp) > length(wben)) wben <- cbind(wben, t(rep("NA", max(temp) - length(wben))))
  #   if (max(temp) > length(test)) test <- cbind(test, t(rep("NA", max(temp) - length(test))))
  #   wben[temp] <- test[temp]
  #   writeData(wb, sheet = paste0(sub("_field", "", v), i), x = wben, colNames = F, startRow = 1, keepNA = T, na.string = "NA")
  # }
  # saveWorkbook(wb, file = paste0("../data_raw/fields/CHen.xlsm"), overwrite = TRUE) 
  
  # 5. Import manually classified data
  i <- if (country %in% c("US", "JP")) 2 else 1
  fs <- if (country %in% c("US", "JP")) c(1, 2) else ""
  l <- if (country %in% c("US", "GB")) "" else "en"
  if (file.exists(paste0("../data_raw/fields/", country, i, l, ".xlsm"))) for (f in fs) {
    recode_field <- read.xlsx(paste0("../data_raw/fields/", country, i, l, ".xlsm"), sheet = paste0("field", f), rowNames = T, colNames = F, sep.names = " ", na.strings = c("NA"), skipEmptyCols = F)
    indices_i <- if (i == 1) 1:ncol(recode_field) else f+2*(1:ncol(recode_field)-1) # seq(i, nrow(e), 4)
    recode_field <- recode_field[-1,]
    if (!all(row.names(recode_field) %in% names(field_names))) warning(paste("Unrecognized field_names for field in ", country))
    row.names(recode_field) <- field_names[row.names(recode_field)]
    recode_field <- as.data.frame(t(recode_field), row.names = indices_i)
    if (!paste0("field_manual_", k) %in% names(e)) for (k in names(recode_field)) e[[paste0("field_manual_", k)]] <- NA # /!\ There may be a bug if there are NA in field_names[names(recode_field)], which happens when the variable/column names are unknown in field_names
    for (k in names(recode_field)) e[[paste0("field_manual_", k)]][indices_i] <- recode_field[[k]] %in% 1
  } else print("No file found for recoding of field.")

  e$comment_keyword_empty <- is.na(e$comment_field)
  l <- if (country %in% c("US", "GB", "FR")) "" else "en"
  if (file.exists(paste0("../data_raw/fields/", country, 2, l, ".xlsm"))) {
    recode_field <- read.xlsx(paste0("../data_raw/fields/", country, 2, l, ".xlsm"), sheet = "comment1", rowNames = T, colNames = F, sep.names = " ", na.strings = c("NA"), skipEmptyCols = F)
    indices_i <- if (i == 1) 1:ncol(recode_field) else 1+2*(1:ncol(recode_field)-1) # seq(i, nrow(e), 4)
    recode_field <- recode_field[-1,]
    if (!all(row.names(recode_field) %in% names(comment_names))) warning(paste("Unrecognized comment_names for field in ", country))
    row.names(recode_field) <- comment_names[row.names(recode_field)]
    recode_field <- as.data.frame(t(recode_field), row.names = indices_i)
    for (k in names(recode_field)) e[[paste0("comment_manual_", k)]] <- NA # /!\ There may be a bug if there are NA in field_names[names(recode_field)], which happens when the variable/column names are unknown in field_names
    for (k in names(recode_field)) e[[paste0("comment_manual_", k)]][indices_i] <- recode_field[[k]] %in% 1
    e$comment_manual_empty <- NA
    e$comment_manual_empty[indices_i] <- e$comment_keyword_empty[indices_i]
  } else print("No file found for recoding of field.")
  
  for (v in intersect(names(e), c("field", "comment_field"))) { # Translation into English
    e[[paste0(v, "_en")]] <- e[[v]]
    if (!country %in% c("US", "GB")) {
      translated_field <- read.xlsx(paste0("../data_raw/fields/", country, "1en.xlsm"), sheet = sub("_field", "", v), rowNames = T, colNames = F, sep.names = " ", na.strings = c("NA"), skipEmptyCols = F)
      e[[paste0(v, "_en")]][1:ncol(translated_field)] <- as.character(translated_field[1,])
      e[[paste0(v, "_en")]][is.na(e[[v]])] <- NA }
  }
  
  for (k in names(keywords)) e[[paste0("field_keyword_", k)]] <- grepl(keywords[k], e$field_en, ignore.case = T)
  e$field_nb_keywords <- rowSums(e[, variables_field_keyword])
  e$field_nb_manual <- rowSums(e[, variables_field_manual])
  e$nchar_field <- nchar(e$field_en)
  for (k in names(keywords_comment[-6])) e[[paste0("comment_keyword_", k)]] <- grepl(keywords_comment[k], e$comment_field_en, ignore.case = T)
  e$comment_nb_keywords <- rowSums(e[, variables_comment_keyword])
  e$comment_nb_manual <- rowSums(e[, variables_comment_manual])
  e$nchar_comment <- nchar(e$comment_field_en)
  e$field_universalism <- rowSums(sapply(1:nrow(mfd), function(i) str_count(e$field_en, mfd$keyword[i]) * (mfd$dimension[i] %in% c("care", "fairness") - mfd$dimension[i] %in% c("loyalty", "authority"))))
  label(e$field_universalism) <- "field_universalism: Number of occurrences of care or fairness words minus number of loyalty or authority words in field (words from Moral Foundation Dictionary 2.0)."
  e$field_universalist <- grepl(paste(mfd$keyword[mfd$dimension %in% c("care", "fairness")], collapse = "|"), e$field_en)
  label(e$field_universalist) <- "field_universalist: T/F Whether field_en contains any care or fairness words (from Moral Foundation Dictionary 2.0)."
  e$field_particularist <- grepl(paste(mfd$keyword[mfd$dimension %in% c("loyalty", "authority")], collapse = "|"), e$field_en)
  label(e$field_particularist) <- "field_particularist: T/F Whether field_en contains any loyalty or authority words (from Moral Foundation Dictionary 2.0)."
  e$field_universalism2 <- rowSums(sapply(1:nrow(emfd), function(i) str_count(e$field_en, emfd$word[i]) * (emfd$care_p + emfd$fairness_p - emfd$loyalty_p - emfd$authority_p)[i]))
  label(e$field_universalism2) <- "field_universalism2: Proba of words being care or fairness minus proba of being loyalty or authority words in field (probas from the extended Moral Foundation Dictionary)."
  
  # Deprecated:
  # Use lines below export CSV. 
  # for (c in c(countries)) for (v in intersect(names(d(c)), c(variables_field, "comment_field"))) write.table(paste(c('"', paste(gsub("\n", "\\\\\\n ", gsub("\r", " ", gsub('\"', "\\\\\\'", d(c)[[v]]))), collapse = '";"'), '"'), collapse=""),
  #    paste0("../data_raw/fields/", v, "_", c, ".csv"), row.names = F, quote = F, col.names = F, fileEncoding = "UTF-8")
  # Propagate NAs
  # for (c in countries[-c(6,7,9,11)]) { # c("CH", "CH-IT", "CH-FR")
  #   wb <- loadWorkbook(paste0("../data_raw/fields/", c, ".xlsm"))
  #   wben <- loadWorkbook(paste0("../data_raw/fields/", c, "en.xlsm"))
  #   for (v in c(variables_field, "comment_field")) for (i in 1:4) {
  #     temp <- which(is.na(read.xlsx(wb, sheet = paste0(sub("_field", "", v), i), colNames = F, skipEmptyCols = F, na.strings = "#NA")[1,]))
  #     test <- read.xlsx(wben, sheet = paste0(sub("_field", "", v), i), colNames = F, skipEmptyCols = F)[1,]
  #     test[temp] <- "NA"
  #     writeData(wben, sheet = paste0(sub("_field", "", v), i), x = test, colNames = F)
  #   }
  #   saveWorkbook(wben, file = paste0("../data_raw/fields/", c, "en.xlsm"), overwrite = TRUE)
  # }

  if ("gcs_belief_own" %in% names(e)) {
    if (country == "RU") e$variant_belief <- "Own"
    e$variant_belief_eu <- ifelse(e$variant_belief %in% 1, "US", "Own")
    if (country == "US") e$variant_belief_eu[e$variant_belief_eu %in% "US"] <- "EU"
    e$gcs_belief <- ifelse(e$variant_belief %in% 1, e$gcs_belief_us, e$gcs_belief_own)
    e$variant_belief <- ifelse(e$variant_belief %in% 1, "US", "Own") # "In the U.S. [except in US: EU]", "In own country"
  }
  
  e$info_solidarity <- e$variant_realism %in% 1
  if (pilot) e$variant_info_solidarity <- relevel(as.factor(ifelse(e$info_solidarity, ifelse(e$variant_long, "Long info", "Short info"), "No info")), "No info")
  
  e <- create_item("variant_warm_glow", labels = c("None" = 0, "NCS" = 1, "donation" = 2), values = 0:2, df = e)
  e$variant_warm_glow <- as.factor(e$variant_warm_glow)
  e$gcs_support_control <- ifelse(e$variant_warm_glow == "None", e$gcs_support, NA)
  
  if ("donation" %in% names(e)) e$donation_agg <- e$donation*(e$donation %in% c(0, 10, 20, 50, 100)) + 5*(e$donation %[]% c(1, 9)) + 15*(e$donation %[]% c(11, 19)) + 35*(e$donation %[]% c(21, 49)) + 75*(e$donation %[]% c(51, 99))
  e <- create_item("donation_agg", labels = c("0" = 0, "1-9" = 5, "10" = 10, "11-19" = 15, "20" = 20, "21-49" = 35, "50" = 50, "51-99" = 75, "100" = 100), values = c(0, 5, 10, 15, 20, 35, 50, 75, 100), missing.values = c("", NA), df = e)

  if (country != "RU") for (v in unique(e$variant_ics)) e[[paste0("ics_", v, "_support")]] <- ifelse(e$variant_ics == v, e$ics_support, NA)
  
  for (v in intersect(variables_solidarity_support_short, names(e))) e[[sub("_short", "", v, "_long")]] <- e[[sub("_short", "", v)]]
  for (v in intersect(variables_solidarity_support_short, names(e))) e[[sub("_short", "", v)]] <- ifelse(e$variant_long, e[[sub("_short", "", v)]], e[[v]])
  e$share_solidarity_short_supported <- rowMeans((e[, sub("_short", "", variables_solidarity_support_short)]) > 0, na.rm = T)  
  e$share_solidarity_short_opposed <- rowMeans((e[, sub("_short", "", variables_solidarity_support_short)]) < 0, na.rm = T)  
  e$share_solidarity_supported <- e$share_solidarity_supported_true <- rowMeans((e[, variables_solidarity_support]) > 0, na.rm = T)
  e$share_solidarity_opposed <- e$share_solidarity_opposed_true <- rowMeans((e[, variables_solidarity_support]) < 0, na.rm = T)  
  e$share_solidarity_supported_round <- round(rowMeans((e[, variables_solidarity_support]) > 0, na.rm = T), 1)
  e$share_solidarity_opposed_round <- round(rowMeans((e[, variables_solidarity_support]) < 0, na.rm = T), 1) 
  e$share_solidarity_diff <- e$share_solidarity_supported_true - e$share_solidarity_opposed_true
  e$share_solidarity_ratio <- e$share_solidarity_supported_true/(e$share_solidarity_supported_true + e$share_solidarity_opposed_true)
  if (country == "RU") e$share_solidarity_supported <- rowMeans((e[, variables_solidarity_support[-3]]) > 0, na.rm = T) # To fix mistake that in RU, expanding_security_council wasn't asked to control group
  if (country == "RU") e$share_solidarity_opposed <- rowMeans((e[, variables_solidarity_support[-3]]) < 0, na.rm = T)
  e$share_solidarity_supported_no_commitment <- rowMeans((e[, variables_solidarity_no_commitment]) > 0, na.rm = T)
  e$share_solidarity_opposed_no_commitment <- rowMeans((e[, variables_solidarity_no_commitment]) < 0, na.rm = T)  
  e$share_solidarity_supported_no_info <- rowMeans((e[, variables_solidarity_no_info]) > 0, na.rm = T)
  e$share_solidarity_opposed_no_info <- rowMeans((e[, variables_solidarity_no_info]) < 0, na.rm = T)  
  label(e$share_solidarity_short_supported) <- "share_solidarity_short_supported: 0-1. [Only in pilot] Share of plausible global solidarity policies supported, when variant is Short (i.e. only 5 policies are presented)."
  label(e$share_solidarity_short_opposed) <- "share_solidarity_short_opposed: 0-1. [Only in pilot] Share of plausible global solidarity policies opposed, when variant is Short (i.e. only 5 policies are presented)."
  label(e$share_solidarity_supported) <- "share_solidarity_supported: 0-1. Share of plausible global solidarity policies (somewhat or strongly) supported (among the 10)."
  label(e$share_solidarity_opposed) <- "share_solidarity_opposed: 0-1. Share of plausible global solidarity policies (somewhat or strongly) opposed (among the 10)."
  label(e$share_solidarity_diff) <- "share_solidarity_diff: -1-1. share_solidarity_supported - share_solidarity_opposed."
  label(e$share_solidarity_ratio) <- "share_solidarity_ratio: 0-1. share_solidarity_supported/(share_solidarity_supported + share_solidarity_opposed."
  label(e$share_solidarity_supported_no_commitment) <- "share_solidarity_supported_no_commitment: Share of plausible global solidarity policies that have not feature existing commitment (there are 6 variables_solidarity_no_commitment) (somewhat or strongly) supported"
  label(e$share_solidarity_opposed_no_commitment) <- "share_solidarity_opposed_no_commitment: Share of plausible global solidarity policies that have not feature existing commitment (there are 6 variables_solidarity_no_commitment) (somewhat or strongly) opposed."
  label(e$share_solidarity_supported_no_info) <- "share_solidarity_supported_no_info: Share of plausible global solidarity policies that aren't mentioned in the info treatment (there are 2: debt_relif, aviation_levy) (somewhat or strongly) supported."
  label(e$share_solidarity_opposed_no_info) <- "share_solidarity_opposed_no_info: Share of plausible global solidarity policies that aren't mentioned in the info treatment (there are 2: debt_relif, aviation_levy) (somewhat or strongly) opposed."
  for (v in variables_solidarity_support) if (!(country == "RU" & grepl("council", v))) e[[paste0(v, "_control")]] <- ifelse(e$info_solidarity, NA, e[[v]])
  
  e$well_being <- e$variant_well_being <- NA
  for (v in variables_well_being) { 
    e$variant_well_being[!is.na(e[[v]])] <- sub("well_being_", "", v)
    e$well_being[!is.na(e[[v]])] <- e[[v]][!is.na(e[[v]])] }
  label(e$well_being) <- "well_being: Subjective well-being, depending on variant_well_being (two wordings: Gallup/WVS; two scales: 0-10/1-10)."
  e$variant_well_being_scale <- ifelse(grepl("0", e$variant_well_being), "0", "1")
  e$variant_well_being_wording <- ifelse(grepl("gallup", e$variant_well_being), "Gallup", "WVS")
  
  e$variant_wealth_tax <- e$wealth_tax_support <- NA
  for (v in variables_wealth_tax_support) e$variant_wealth_tax[!is.na(e[[v]])] <- sub("_tax_support", "", v)
  e$variant_wealth_tax <- relevel(factor(e$variant_wealth_tax), "hic")
  for (v in variables_wealth_tax_support) e$wealth_tax_support[!is.na(e[[v]])] <- e[[v]][!is.na(e[[v]])] %in% "Yes"
  e <- create_item("wealth_tax_support", labels = c("No" = 0, "Yes" = 1), values = c(0, 1), missing.values = c("", NA), df = e)
  
  e$humanist <- grepl("Humans", e$group_defended)
  e$universalist <- grepl("Sentient|Humans", e$group_defended)
  e$antispecist <- grepl("Sentient", e$group_defended)
  e$nationalist <- grepl("Fellow", e$group_defended)
  e$individualist <- grepl("self", e$group_defended)
  
  if (country != "RU") {
    e$split_nb_global <- rowSums(!is.na(e[, variables_split_many_global]))
    e$split_many_global <- e$split_many_global_when_appear <- rowSums(e[, variables_split_many_global], na.rm = T)
    e$split_many_global[e$variant_split %in% c(1, "Few")] <- e$split_nb_global[e$variant_split %in% c(1, "Few")] <- NA
    e$split_many_global_when_appear[!e$split_nb_global %in% 1:4] <- NA 
    label(e$split_nb_global) <- "split_nb_global: NA/0-4. Number of split_many random spending categories that are global issues (NA when variant split_few)."
    label(e$split_many_global) <- "split_many_global: NA/0-100. Percentage allocated to global issues in split_many (NA when variant split_few)."
    label(e$split_many_global_when_appear) <- "split_many_global_when_appear: NA/0-100. Percentage allocated to global issues in split_many (NA when no global issue appear (split_nb_global == 0) or variant split_few)."
    
    e$split_both_global <- ifelse(e$variant_split == 1, e$revenue_split_few_global, e$split_many_global)
    e$split_both_global[e$split_nb_global %in% 0] <- NA
    e$split_both_nb_global <- ifelse(e$variant_split == 1, 1, e$split_nb_global)
    label(e$split_both_global) <- "split_both_global: 0-100. Percentage allocated to global issues in split_many or split_few (depending on the variant asked)."
    label(e$split_both_nb_global) <- "split_both_nb_global: 0-4. Number of spending categories that are global issues in split_many or split_few (depending on the variant asked)."
    
    for (v in variables_split_agg) {
      e[[v]] <- pmin(e[[sub("_agg", "", v)]], 35)
      e <- create_item(v, labels = c("0" = 0, "5" = 5, "10" = 10, "15" = 15, "20" = 20, "25" = 25, "30" = 30, "35-100" = 35), values = c(0, 5, 10, 15, 20, 25, 30, 35), missing.values = c("", NA), df = e)
    }
    
    e$mean_order_many_global <- rowMeans(e[, sub("many_", "many_order_", variables_split_many_global)], na.rm = T) 
    label(e$mean_order_many_global) <- "mean_order_many_global: 0-5. Mean order of appearance of global spending categories in split_many (lower order means they appear on top)."
    
    e$ncqg_order <- ifelse(!is.na(e$ncqg_order), ifelse(e$ncqg_order %in% 1, "increasing", "decreasing"), NA)
    e$vote_intl_coalition_order <- ifelse(e$vote_intl_coalition_order_more_likely == 1, "more_first", "less_first")
  }
  
  # Orders with full randomization: revenue_split_few, revenue_split_many, solidarity_support, why_hic_help_lic, maritime_split
  # Orders with random flip: ncqg, transfer_how, vote_intl_coalition, gcs_comprehension
  e$transfer_how_order <- ifelse(e$transfer_how_order_agencies == 1, "global_first", "local_first")
  e$gcs_comprehension_order <- ifelse(e$gcs_comprehension_order %in% 1, "increase_first", "decrease_first")
  
  # for (j in names(list_random_order)) {
  #   max_j <- if (j == "solidarity_support_") 10 else 5
  #   for (k in 1:max_j) e[[paste0(j, "order_", k)]] <- NA
  #   for (var in list_random_order[[j]]) {
  #     for (order in 1:max_j) {
  #       rows <- which(e[[paste0(j, "order_", var)]] == order)
  #       e[rows, paste0(j, "order_", order)] <- as.numeric(e[[paste0(j, var)]][rows])
  #     }
  #   }
  # }
  
  # NAs for questions not asked
  # TODO update for RU
  e$race_asked <- e$country %in% "US"
  e$custom_redistr_asked <- e$cut %in% 0 & country != "RU" # Asked in all non-pilot except RU
  e$radical_redistr_asked <- e$why_hic_help_lic_asked <- e$global_movement_asked <- e$cut %in% 0 | e$variant_radical_transfer %in% 1 # Asked in all non-pilot
  if (country != "RU") for (v in c("winners", "losers")) e[[paste0("custom_redistr_", v)]] <- e[[paste0("custom_redistr_", v)]]/10
  # e$global_movement_asked <- e$cut %in% 0 | e$variant_radical_transfer %in% 1
  # e$transfer_how_asked <- e$cut %in% 0 | e$variant_radical_transfer %in% 0
  for (l in c("race", "global_movement", "why_hic_help_lic", "custom_redistr")) {
    for (v in eval(str2expression(paste0("variables_", l)))) e[[v]][!e[[paste0(l, "_asked")]]] <- NA
  }
  
  e$my_tax_global_nation_external <- my_taxes_global_nation[country] 
  label(e$my_tax_global_nation_external) <- "my_tax_global_nation_external: 0-100. Relative support for my_tax_global_nation in Global Nation (2024) survey."
  e$my_tax_global_nation_2023 <- my_taxes_global_nation_2023[country]
  label(e$my_tax_global_nation_2023) <- "my_taxes_global_nation_2023: 0-100. Relative support for my_tax_global_nation in Global Nation (2023) survey."
  
  if (country != "RU") {
    e$custom_redistr_unsatisfied_unskip <- ifelse(e$custom_redistr_asked, !e$custom_redistr_satisfied & !e$custom_redistr_skip, NA)
    e$custom_redistr_both_satisfied_skip <- ifelse(e$custom_redistr_asked, e$custom_redistr_satisfied & e$custom_redistr_skip, NA) # flag bad quality
    e$variant_sliders <- ifelse(e$variant_sliders %in% 1, "concentrated", "diffuse")
    label(e$variant_sliders) <- "variant_sliders: Concentrated/Diffuse. Values of the initial position of sliders in custom_redistr. Concentrated/Diffuse: Winners: 40/60; Losers: 10/20; Degree: 7/2."
    
    # unused: variant_radical_transfer, variant_comprehension, variant_synthetic
    e$variant_split <- ifelse(e$variant_split == 2, "Many", "Few") 
    # e$variant_realism <- ifelse(e$variant_realism == 1, "Info", "No info") # => info_solidarity
    e$variant_ncqg_maritime <- ifelse(e$variant_ncqg_maritime %in% 0, "maritime", e$variant_ncqg)
  }

  e$n <- paste0(country, 1:nrow(e))
  if (!country %in% c("RU", "SA")) {
    e$conjoint_number <- ifelse(e$conjoint == "Candidate A", 1, ifelse(e$conjoint == "Candidate B", 2, NA))
    label(e$conjoint_number) <- "conjoint_number: A: 1; B: 2; Neither: NA Conjoint analysis choice (recoded from conjoint)."
    e$conjoint_misleading <- ifelse(is.na(e$conjoint_number), 1, e$conjoint_number)
    label(e$conjoint_misleading) <- "conjoint_misleading: A or Neither: 1; B: 2. Conjoint analysis choice (recoded from conjoint, used in conjoint.R). /!\\ Misleading since Neither is recoded as 1."
    for (v in intersect(variables_conjoint_domains, names(e))) {
      e[[paste0(v, "_original")]] <- e[[v]]
      e[[v]] <- policies_domains[e[[v]]] # common policy name for all countries
      label(e[[v]]) <- paste0(v, ": Policy domain n°", substr(v, 5, 5), " of the conjoint analysis (cf. policies_domains).")
    }
    policies_l <- unlist(setNames(policies_conjoint[[languages_country[[country]][1]]], conjoint_attributes))
    for (v in intersect(variables_conjoint_policies, names(e))) {
      e[[paste0(v, "_original")]] <- e[[v]]
      e[[v]] <- policies_code[e[[v]]]
      for (j in names(correct_policies)) e[[v]][grepl(j, e[[paste0(v, "_original")]])] <- correct_policies[j]
      # e[[v]] <- policies_l[policies_code[e[[v]]]] # policy name in country's main language (replace 1 by paste0("EN-", country)) for english
      label(e[[v]]) <- paste0(v, ": Policy code of domain", substr(v, 7, 7), " for Candidate ", substr(v, 5, 5), " in the conjoint analysis (cf. policies_code).")
    }  
    for (leaning in c("", "_strict", "_party", "_party_strict")) { for (i in 1:2) {
        e[[paste0("leaning_conjoint_", i, leaning)]] <- 1
        max_i <- apply(sapply(e[, eval(str2expression(paste0("variables_conjoint_policies_", i)))], function(x) eval(str2expression(paste0("policies_leaning", leaning)))[x, country]), 1, max)
        min_i <- apply(sapply(e[, eval(str2expression(paste0("variables_conjoint_policies_", i)))], function(x) eval(str2expression(paste0("policies_leaning", leaning)))[x, country]), 1, min)
        e[[paste0("leaning_conjoint_", i, leaning)]][max_i == 2] <- 2
        e[[paste0("leaning_conjoint_", i, leaning)]][min_i == 0] <- 0 
        e[[paste0("leaning_conjoint_", i, leaning)]][max_i - min_i == 2] <- -1
        e <- create_item(paste0("leaning_conjoint_", i, leaning), labels = c("Inconsistent" = -1, "Left" = 0, "Unclear" = 1, "Right" = 2), values = -1:2, df = e, 
                         annotation = paste0("leaning_conjoint_", i, leaning, ": [-1: Inconsistent; 0: Left; 1: Unclear; 2: Right]. Political leaning of the program of Candidate ", i, " in the conjoint analysis", if (grepl("_strict", leaning)) "(strict version, i.e. considering less_aid as Right and millionaire_tax as Left)."))
        e[[paste0("consistent_conjoint_", i, leaning)]] <- e[[paste0("leaning_conjoint_", i, leaning)]] != -1
        label(e[[paste0("consistent_conjoint_", i, leaning)]]) <- paste0("consistent_conjoint_", i, leaning, ": T/F. Political leaning of the program of Candidate ", i, "is consistent (i.e. only Left and Unclear or Right and Unclear policies).", if (grepl("_strict", leaning)) "(strict version, i.e. considering less_aid as Right and millionaire_tax as Left).")
      } 
      e[[paste0("consistent_conjoints", leaning)]] <- e[[paste0("consistent_conjoint_1", leaning)]] & e[[paste0("consistent_conjoint_2", leaning)]]
    }
    label(e$consistent_conjoints) <- "consistent_conjoints: T/F. Political leaning of the programs of both Candidates are consistent (consistent_conjoint_1 & consistent_conjoint_2, cf. policies_leaning)."
    label(e$consistent_conjoints_strict) <- "consistent_conjoints_strict: T/F. Political leaning of the programs of both Candidates are consistent (consistent_conjoint_1_strict & consistent_conjoint_2_strict, cf. policies_leaning_strict) (strict version, i.e. considering less_aid as Right and millionaire_tax as Left)."
    label(e$consistent_conjoints_party) <- "consistent_conjoints_party: T/F. Political leaning of the programs of both Candidates are consistent (consistent_conjoint_1_party & consistent_conjoint_2_party, cf. policies_leaning_party) (party version, i.e. leaning is based on the party that endorses the policy)."
    label(e$consistent_conjoints_party_strict) <- "consistent_conjoints_party_strict: T/F. Political leaning of the programs of both Candidates are consistent (consistent_conjoint_1_party_strict & consistent_conjoint_2_party_strict, cf. policies_leaning_party_strict) (party version, i.e. leaning is based on the party that endorses the policy; & strict version, i.e. considering less_aid as Right and millionaire_tax as Left)."
  }
  e$global_movement_support <- e$global_movement_spread | e$global_movement_demonstrate | e$global_movement_donate | e$global_movement_strike
  e$global_movement_part <- e$global_movement_demonstrate | e$global_movement_donate | e$global_movement_strike
  # e$global_movement_any <- as.logical(rowSums(e[, variables_global_movement[2:5]]))
  # e$global_movement_any[!e$global_movement_asked] <- NA 
  # e$why_hic_help_lic_any <- as.logical(rowSums(e[, variables_why_hic_help_lic[1:3]]))
  # e$why_hic_help_lic_duty[!e$why_hic_help_lic_asked] <- NA
  
  return(e)
}


##### Load data #####
start_time <- Sys.time()
survey_data <- setNames(lapply(countries, function(c) { prepare(country = c, scope = "final", fetch = F, convert = T, remove_id = T, rename = T, pilot = FALSE, weighting = T) }), countries) # remove_id = F
all <- Reduce(function(df1, df2) { merge(df1, df2, all = T) }, survey_data)
list2env(survey_data, envir = .GlobalEnv)
all$weight <- all$weight_country * (adult_pop[all$country]/sum(adult_pop[unique(all$country)])) / (sapply(all$country, function(c) { sum(all$country == c)})/(nrow(all)))

e <- all <- compute_custom_redistr(all, name = "all") # 4 min 
beep()
# # Pilots
# pilot_data <- setNames(lapply(pilot_countries, function(c) { prepare(country = c, scope = "final", fetch = T, remove_id = T, convert = T, rename = T, pilot = TRUE, weighting = T) }), paste0(pilot_countries, "p")) # remove_id = F
# pilot <- Reduce(function(df1, df2) { merge(df1, df2, all = T) }, pilot_data)
# list2env(pilot_data, envir = .GlobalEnv) # 35 in both pilot and all: 16 in PL, 14 in GB, 5 in US
# beep()
# 
data_all <- setNames(lapply(countries, function(c) { prepare(country = c, scope = "all", fetch = F, convert = T, rename = T, pilot = FALSE, weighting = FALSE) }), countries) # remove_id = F
a <- Reduce(function(df1, df2) { merge(df1, df2, all = T) }, data_all)
a$weight <- 1
rm(survey_data, data_all)
beep()
Sys.time() - start_time # 10 min


##### Export custom redistr #####
mean_custom_redistr_stats <- list()
for (v in names(mean_custom_redistr)) { 
  write.csv2(data.frame(quantiles = seq(0.001, 1, .001), revenus = round(mean_custom_redistr[[v]])[2:1001]), paste0("../interactive_graph/mean_custom_redistr/", v, ".csv"), row.names = F)
  share_winners <- max(which(mean_custom_redistr[[v]] > current_inc))
  if (share_winners > -Inf) mean_custom_redistr_stats[[v]] <- c("share_winners" = (share_winners-1)/10, "min_income" = round(mean_custom_redistr[[v]][1]), "transfer" = round(100*sum(mean_custom_redistr[[v]][1:share_winners] - current[1:share_winners])/sum(current_inc[1:1000]), 2)) 
  else warning(paste("Problem in mean_custom_redistr for ", v))
}


##### Latent variable; policy features #####
zscores_data <- no.na(as.data.frame(lapply(variables_interest, function(v) (e[[v]] - wtd.mean(e[[v]], e$weight))/sqrt(wtd.var(as.numeric(e[[v]]), e$weight)))), 0)
loadings <- setNames(as.numeric(factanal(zscores_data, 1)$loadings), variables_interest)
e$latent_support_global_redistr <- 0
for (i in 1:length(variables_interest)) e$latent_support_global_redistr <- e$latent_support_global_redistr + loadings[i]*zscores_data[, i]
e$latent_support_global_redistr <- (e$latent_support_global_redistr - wtd.mean(e$latent_support_global_redistr, e$weight))/sqrt(wtd.var(e$latent_support_global_redistr, e$weight))
names(zscores_data) <- variables_interest
(kmo <- KMO(cor(zscores_data, use = "pairwise.complete.obs"))) # Overall MSA = .92, lowest MSAi: individualist (.39), nationalist (.53), universalist (.66)
rm(zscores_data)

e$gcs_lost <- setNames(c(17, 48, 18, 39, 13, 24, 14, 48, 30, 101, 88), countries)[e$country] # features["amount_lost", main_languages[e$country]]
e$gcs_price_increase <- features["price_increase", main_languages[e$country]]
for (v in paste0(c("affected", "transfer"), "_top", c(1,1,3,3))) e[[v]] <- as.numeric(features[v, main_languages[e$country]])/100
# MIRT
negative_variables_interest <- c("share_solidarity_opposed", "global_movement_no", "why_hic_help_lic_none", "nationalist", "individualist")
for (v in negative_variables_interest) e[[paste0("minus_", v)]] <- -e[[v]]
variables_interest_positive <- variables_interest
for (v in negative_variables_interest) variables_interest_positive[v] <- paste0("minus_", v)
e$irt_global_redistr <- fscores(mirt(e[, variables_interest_positive], 1, itemtype = "graded", weights = e$weight)) 
all <- e


##### Lottery draw #####
# sample(all$n[all$gcs_understood], 1) # PL229
# sample(all$n[all$variant_warm_glow == "donation"], 1) # GB238
# all$donation[all$n == "GB238"] # 10% to plant trees => 90£ for them
# for (v in c("own", "US")) for (c in countries) all$gcs_actual_support[all$country == c & all$variant_belief == ifelse(v == "own", "Own", "US")] <- wtd.mean(d(c)[[paste0("gcs_belief_", tolower(v))]], weights = d(c)$weight)
# sample(all$n[which(abs(all$gcs_actual_support - all$gcs_belief) == min(abs(all$gcs_actual_support - all$gcs_belief)))], 1) # US1257
# 
# temp <- prepare(country = "PL", scope = "final", fetch = T, convert = T, rename = T, pilot = FALSE, weighting = F, remove_id = F)
# as.character(temp$id[temp$n == "PL229"]) 
# temp <- prepare(country = "GB", scope = "final", fetch = T, convert = T, rename = T, pilot = FALSE, weighting = F, remove_id = F)
# as.character(temp$id[temp$n == "GB238"]) 
# temp <- prepare(country = "US", scope = "final", fetch = T, convert = T, rename = T, pilot = FALSE, weighting = F, remove_id = F)
# as.character(temp$id[temp$n == "US1257"]) 
# rm(temp)


##### Conjoint analysis #####
create_conjoint_sample <- function(df = all) {
  df$program_a <- sapply(1:nrow(df), function(n) {paste(df[n, paste0("F-1-1-", 1:5)], collapse = ' ')})
  df$program_b <- sapply(1:nrow(df), function(n) {paste(df[n, paste0("F-1-2-", 1:5)], collapse = ' ')})
  df$millionaire_tax_in_a <- grepl("foreign_policy1", df$program_a)
  df$millionaire_tax_in_b <- grepl("foreign_policy1", df$program_b)
  df$cut_aid_in_a <- grepl("foreign_policy2", df$program_a)
  df$cut_aid_in_b <- grepl("foreign_policy2", df$program_b)
  df$foreign3_in_a <- grepl("foreign_policy3", df$program_a)
  df$foreign3_in_b <- grepl("foreign_policy3", df$program_b)
  df$millionaire_tax_in_program <- df$millionaire_tax_in_a
  df$cut_aid_in_program <- df$cut_aid_in_a
  df$foreign3_in_program <- df$foreign3_in_a
  df$program <- df$program_a
  df$program_preferred <- df$conjoint == "Candidate A"
  df$leaning_conjoint <- df$leaning_conjoint_1
  df$profile <- "A"
  temp <- df
  temp$millionaire_tax_in_program <- temp$millionaire_tax_in_b
  temp$cut_aid_in_program <- temp$cut_aid_in_b
  temp$foreign3_in_program <- temp$foreign3_in_b
  temp$leaning_conjoint <- temp$leaning_conjoint_2
  temp$program <- temp$program_b
  temp$program_preferred <- temp$conjoint == "Candidate B"
  temp$profile <- "B"
  call <- rbind(df, temp)
  call <- call[, intersect(names(call), c(variables_conjoint_all, variables_conjoint_consistency_all, variables_sociodemos_all, "country", "country_name", "n", "stayed", "millionaire_agg", "vote_voters", "vote_Eu", "vote_JP", "saudi",
                                          "vote_factor", "program", "program_preferred", "cut_aid_in_program", "millionaire_tax_in_program", "foreign3_in_program", "weight", "weight_country", "leaning_conjoint", "profile"))]
  call$millionaire_vote <- ifelse(call$millionaire_tax_in_program | (call$vote_factor == "Non-voter, PNR or Other"), as.character(call$vote_factor), "millionaire_out")
  call$millionaire_vote <- relevel(factor(call$millionaire_vote), "millionaire_out")
  call$program_preferred_left <- ifelse(call$vote_factor == "Left", call$program_preferred, NA)
  call$program_preferred_center_right <- ifelse(call$vote_factor == "Center-right or Right", call$program_preferred, NA)
  call$program_preferred_right <- ifelse(call$vote_factor %in% c("Center-right or Right", "Far right"), call$program_preferred, NA)
  call$program_preferred_far_right <- ifelse(call$vote_factor == "Far right", call$program_preferred, NA)
  call$program_preferred_far_right[call$country == "US"] <- call$program_preferred_right[call$country == "US"]
  call$program_preferred_pnr <- ifelse(call$vote_factor == "Non-voter, PNR or Other", call$program_preferred, NA)
  return(call)
}
call <- create_conjoint_sample(all)
calla <- create_conjoint_sample(a)


##### Export fields #####
# write.csv(all[,c("country_name", "field", "comment_field", "variant_field")], "../data_raw/fields/fields.csv")
# write.csv(all[,c("country_name", "field_en", "comment_field_en", "variant_field")], "../data_raw/fields/fields_en.csv")


##### NLP #####
classify_gpt <- function(prompt, max_tokens = 250) {
  res <- POST(
    url = "https://api.openai.com/v1/chat/completions",
    add_headers(Authorization = paste("Bearer", readLines("openai_key.txt")), `Content-Type` = "application/json"),
    body = toJSON(list(model = "gpt-4.1", messages = list(list(role = "user", content = prompt)), max_tokens = max_tokens, temperature = 0), auto_unbox = TRUE))
  stop_for_status(res)
  resp <- content(res, as = "text", encoding = "UTF-8")
  resp_list <- fromJSON(resp)
  resp_list$choices$message$content
}
gpt_prompt <- function(response_text) {
  lbls <- paste0("* ", field_names, ": ", names(field_names), collapse = "\n")
  paste0("Given the following survey responses, classify them into all applicable categories from the list below. Return a machine-readable comma-separated list of category keywords (use the keywords only, not the descriptions).",
    "Each response can be classified in multiple categories.\n\nSurvey response: \"", response_text, "\"\n\nCategories:\n", lbls, "\n\nCategory keywords:")
}
# start_time <- Sys.time()
# for (k in field_names) all[[paste0("field_gpt_", k)]] <- F
# failed_rows <- c()
# for (i in 1:nrow(all)) { # 1:nrow(all) failed_rows which(all$country == "RU")
#   text <- as.character(all$field[i])
#   if (!is.na(text) && nchar(trimws(text)) > 0) {
#     prompt <- gpt_prompt(text)
#     cat(sprintf("Classifying row %d/%d...\n", i, nrow(df)))
#     tryCatch({
#       gpt_result <- classify_gpt(prompt)
#       kwords <- unique(trimws(unlist(strsplit(gpt_result, ","))))
#       for (k in kwords) all[i, paste0("field_gpt_", k)] <- T
#       # # Build result row
#       # row_out <- as.list(rep(0, length(field_names)))
#       # names(row_out) <- field_names
#       # for (k in kwords) if (k %in% field_names) row_out[[k]] <- T
#       # results[[i]] <- row_out
#     }, error = function(e) {
#       failed_rows <- c(failed_rows, i)
#       cat("Classification failed for row", i, ":", conditionMessage(e), "\n")
#       # results[[i]] <- c(setNames(rep(NA, length(field_names)), field_names))
#     })
#     Sys.sleep(1.2) # Stay within API limits (60/min for GPT-3.5-turbo); adjust if needed
#   } else all$field_gpt_nothing[i] <- T # results[[i]] <- c(setNames(c(rep(F, length(field_names)-1), T), field_names))
# }
# Sys.time() - start_time  # ~5h?
# all <- all[, setdiff(names(all), setdiff(names(all)[grepl("field_gpt_", names(all))], variables_field_gpt))] # purge extra variables that GPT created by mistake
# all_gpt <- all[, c("n", variables_field_gpt)]
# all_gpt$field_nb_gpt <- rowSums(all_gpt[, variables_field_gpt])
# saveRDS(all_gpt, "../data_raw/fields/all_gpt.rds")

all_gpt <- readRDS("../data_raw/fields/all_gpt.rds")
e <- all <- merge(all, all_gpt, all = T)


##### Codebook #####
export_codebook(p, "../questionnaire/codebook_p.csv", stata = FALSE, omit = c(1, 2, 7, 9:13, 197))
# export_codebook(all, "../questionnaire/codebook.csv", stata = FALSE, omit = c(2, 7, 9:13, 197))


##### Save #####
save.image(".RData")
