package("BalancedSampling")
n <- 75
interest_vars <- c("gcs_support", "latent_support_global_redistr", "man", "age_factor", "vote_factor", "education_factor", "income_factor") 
auxiliary_vars <- c("gcs_support", "latent_support_global_redistr")
df <- readRDS("../hidden/GB_anon.rds") # N=217 sample of volunteers

df$inclusion_weight <- df$weight_vote_gcs * n/sum(df$weight_vote_gcs)  
selected_subsample <- cube(df$inclusion_weight, df[, c("inclusion_weight", interest_vars)]) # Bug!
selected_subsample <- cube(df$inclusion_weight, as.matrix(df[, c("inclusion_weight", auxiliary_vars)]))
selected_subsample <- cube(df$inclusion_weight, as.matrix(df[, c("inclusion_weight", c())]))
length(selected_subsample) # 67 rather than 75
