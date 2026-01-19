package("BalancedSampling")
package("Hmisc")

package("sampling")

# /!\ The subsample selected is random and not necessarily of size n (can be of lower size) => To get correct sample size, a dirty fix is to artificially increase n until expected result
select_subsample <- function(n = 75, c = "US", weight_var = "weight_vote_gcs", interest_vars = c(), return = "sample", verbose = FALSE) {
  # vote (non-voters as PNR), vote_agg (hypothetical vote used for non-voters), voted, group_defended, employment_agg, millionaire_factor, share_solidarity_supported, share_solidarity_diff
  df <- readRDS(paste0("../hidden/", c, "_full.rds"))# This works well if anyone from the sample can be selected; doesn't work if only a subset is volunteer
  df$inclusion_weight <- df[[weight_var]] * n/sum(df[[weight_var]])  
  selected_subsample <- cube(df$inclusion_weight, df[, c("inclusion_weight", interest_vars)])
  
  print(paste0("Size subsample: ", length(selected_subsample), "; ", round(mean(df$gcs_support[selected_subsample], )), "% support GCS in subsample"))
  if (return == "sample") return(df[selected_subsample,])
  else if (return == "export") {
    write.csv2(df[selected_subsample,], paste0("../hidden/subsample_n", n, ".csv"))
    if (verbose) return(selected_subsample)
  }
  else if (return == "rest") return(df[setdiff(1:nrow(df), selected_subsample)])
  else if (return == "mail") return(df$interview[selected_subsample])
  else if (return == "n") return(df$n[selected_subsample])
  else return(selected_subsample)
}

select_subsample(n = 75, c = "US", return = "export") # True: 49%
select_subsample(n = 87, c = "GB", return = "export") # True: 58%
temp <- select_subsample(n = 5000, c = "FR", weight_var = "weight_gcs", return = "export") # True: 65%


# Sandbox
n <- 75 # 250 (based on 40% acceptance rate, 75 for 30 people and 250 for 100)
c <- "FR"
interest_vars <- c()
interest_vars <- c("gcs_support", "latent_support_global_redistr") 
interest_vars <- c("gcs_support", "latent_support_global_redistr", "man", "age_factor", "vote_factor", "education_factor", "income_factor") 
weight_var <- "weight_vote_gcs"

df <- readRDS(paste0("../hidden/", c, "_full.rds"))
select_subsample(n = 75, c = "FR", weight_var = "weight_gcs", interest_vars = c() , return = "export")
length(cube(df$inclusion_weight, as.matrix(df[, c("inclusion_weight", interest_vars)])))
wtd.mean(df$gcs_support, df$weight_vote_gcs) # 88%
mean(df$gcs_support) # 80%
# TODO! add gcs_understood to interest_vars

sum(UPpivotal(df$inclusion_weight) >= 1)
sum(df$inclusion_weight)

# all_id <- read.csv("../Adrien's/all_id.csv")
# all_id <- merge(all[,!names(all) %in% c("interview", "country")], all_id, by = "n")
# all_id$volunteer <- grepl("@", all_id$interview)
# for (c in c("IT", "US", "GB", "FR", "PL")) {
#   temp <- wtd.mean(d(c)$gcs_support, d(c)$weight)
#   pop_freq[[c]]$gcs_support <- c(temp/100, 1-temp/100)
#   temp <- all_id[all_id$country == c & all_id$volunteer,]
#   temp$weight <- weighting(temp, c, trim = FALSE)
#   temp$weight_gcs <- weighting(temp, c, variant = "gcs", trim = FALSE)
#   temp$weight_vote <- weighting(temp, c, variant = "vote", trim = FALSE)
#   temp$weight_vote_gcs <- weighting(temp, c, variant = "vote_gcs", trim = FALSE)
#   saveRDS(temp[, names(temp) %in% c("n", variables_sociodemos, "country", "vote_original", "vote", "vote_agg", "voted", "group_defended", "gcs_support", "latent_support_global_redistr", 
#                                     "share_solidarity_diff", "share_solidarity_supported", "interview", "volunteer", "weight", "weight_vote", "weight_gcs", "weight_vote_gcs")], 
#           paste0("../Adrien's/", c, "_full.rds"))
# } 

