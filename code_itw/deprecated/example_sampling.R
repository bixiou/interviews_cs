package("sampling")
n <- 75
auxiliary_vars <- c("gcs_support", "latent_support_global_redistr", "man", "age_factor", "vote_factor", "education_factor", "income_factor") 
df <- readRDS("GB_anon.rds") # N=217 sample of volunteers

df$inclusion_weight <- inclusionprobabilities(df$weight_vote_gcs, n)
(selected_subsample <- samplecube(model.matrix(~ . -1, data = df[, c("inclusion_weight", auxiliary_vars)]), df$inclusion_weight, order = 2, method = 2)) 
