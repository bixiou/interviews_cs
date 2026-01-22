package("sampling")
n <- 75
interest_vars <- c("gcs_support", "latent_support_global_redistr", "man", "age_factor", "vote_factor", "education_factor", "income_factor") 
# auxiliary_vars <- c("gcs_support", "latent_support_global_redistr")
df <- readRDS("../hidden/GB_anon.rds") # N=217 sample of volunteers

# df$inclusion_weight <- df$weight_vote_gcs * n/sum(df$weight_vote_gcs)
df$inclusion_weight <- inclusionprobabilities(df$weight_vote_gcs, n)
(selected_subsample <- samplecube(model.matrix(~ . -1, data = df[, c("inclusion_weight", interest_vars)]), df$inclusion_weight, order = 2, method = 2)) 
# (selected_subsample <- samplecube(as.matrix(df[, c("inclusion_weight", auxiliary_vars)]), df$inclusion_weight, order = 2, method = 2))
sum(selected_subsample) # 67 rather than 75

