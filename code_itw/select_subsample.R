# package("BalancedSampling")
package("Hmisc")
package("tidyverse")
package("sampling")
# TODO nested subsamples so that the most representative subsamples come first

interest_vars <- c("gcs_support", "gcs_understood", "latent_support_global_redistr", "man", "age_factor", "vote_factor", "education_quota_factor", "income_factor", "region_factor", "urbanity_factor") 

# Cf. https://stats.stackexchange.com/questions/469563/how-to-partition-a-sample-into-representative-subsamples
select_subsample <- function(n = 200, c = "US", weight_var = "weight_all_gcs", auxiliary_vars = interest_vars, return = "sample", verbose = FALSE) {
  set.seed(0)
  # vote (non-voters as PNR), vote_agg (hypothetical vote used for non-voters), voted, group_defended, employment_agg, millionaire_factor, share_solidarity_supported, share_solidarity_diff
  df <- readRDS(paste0("../hidden/", c, "_full.rds"))# This works well if anyone from the sample can be selected; doesn't work if only a subset is volunteer
  df$inclusion_weight <- inclusionprobabilities(df[[weight_var]], n) 
  # balancing_matrix <- model.matrix(~ . -1, data = df[, c("inclusion_weight", intersect(names(df), auxiliary_vars))])
  # selected_subsample <- samplecube(balancing_matrix, df$inclusion_weight, order = 2, method = 2, comment = verbose) == 1
  balancing_matrix <- model.matrix(~ ., data = df[, c(intersect(auxiliary_vars, names(df)))])
  selected_subsample <- samplecube(df$inclusion_weight * balancing_matrix, df$inclusion_weight, order = 2, method = 2, comment = verbose) == 1
  # Alternative with BalancedSampling package:
  # df$inclusion_weight <- getPips(df[[weight_var]], n) # df[[weight_var]] * n/sum(df[[weight_var]])  
  # selected_subsample <- cube(df$inclusion_weight, df[, c("inclusion_weight", auxiliary_vars)])
  
  print(paste0(c, ". Size subsample: ", sum(selected_subsample), "; ", round(mean(df$gcs_support[selected_subsample], )), "% support GCS in subsample"))
  if (verbose | (return == "representativeness")) print(round(colMeans(balancing_matrix[selected_subsample, ]), 2))
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
select_subsample(n = 75, c = "FR", weight_var = "weight_gcs", interest_vars = c() , return = "export")
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
