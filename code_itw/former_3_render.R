##### labels_vars #####
{
  labels_vars <- c(
  "(Intercept)" = "Constant",
  "finished" = "Finished",
  "excluded" = "Excluded",
  "country" = "Country",
  "region" = "Region",
  "country_region" = "Region",
  "gender" = "Gender",
  "age_exact" = "Age",
  "country_name" = "Country",
  "couple" = "Lives with partner",
  "hh_size" = "Household size",
  "zipcode" = "Postal code",
  "urbanity" = "Degree of urbanization",
  "urbanity_factor" = "Urbanicity",
  "urbanity_na_as_city" = "Urbanicity",
  "region_factor" = "Region",
  "millionaire" = "Likelihood of becoming millionaire",
  "millionaire_agg" = "Likelihood of becoming millionaire",
  "millionaire_factor" = "Will become millionaire",
  "urban" = "Urban",
  "age" = "Age",
  "age_factor" = "Age",
  "Nb_children__14" = "Number of children below 14",
  "income" = "Income",
  "income_factor" = "Income quartile",
  "income_quartile" = "Income quartile",
  "income_factor" = "Income quartile",
  "income_decile" = "Income decile",
  "income_quartile" = "Income quartile",
  "education" = "Highest diploma",
  "education_factor" = "Diploma",
  # "diploma" = "Highest diploma",
  "post_secondary" = "Education: Post secondary",
  # "diploma_25_64" = "Highest diploma among 25-64",
  # "education" = "Highest diploma (ISCED class)",
  "education_original" = "Highest diploma",
  "employment_agg" = "Employment status",
  "employment_status" = "Employment status",
  "employment_18_64" = "Employment among 18-64",
  "race" = "Race",
  "race_white" = "Race: White",
  "race_black" = "Race: Black",
  "race_hispanic" = "Race: Hispanic",
  "race_asian" = "Race: Asian",
  "foreign" = "Foreign origin",
  "foreign_born_family" = "Were you or your parents born in a foreign country?",
  "foreign_born" = "Foreign born",
  "foreign_origin" = "Foreign origin (self or parent(s) foreign born)",
  "home_tenant" = "Home: tenant",
  "home_owner" = "Home: owner",
  "home_landlord" = "Home: landlord",
  "home_hosted" = "Home: hosted",
  "owner" = "Owner",
  "swing_state" = "Swing State",
  "vote" = "Vote",
  "vote_original" = "Vote",
  "vote_factor" = "Vote",
  "vote3" = "Vote",
  "vote_all" = "Vote (actual and hypothetical)",
  "vote_us" = "Vote",
  "vote_fr_voters" = "Vote (voters)",
  "vote_fr_non_voters" = "Vote (non voters)",
  "vote_agg" = "Vote (actual and hypothetical)",
  "vote_participation" = "Voted at last election",
  "voted" = "Voted at last election",
  # "vote_us_voters" = "Vote (voters)",
  # "vote_us_non_voters" = "Vote intention (non voters)",
  "revenue_split_few_domestic_tax_reduction" = "Domestic: Reduction in the income tax",
  "revenue_split_few_domestic_tax_reduction_agg" = "Domestic: Reduction in the income tax",
  "split_many_global_when_appear" = "Share allocated to Global spending options\nwhen such options are part of the 5 (out of 13) randomly selected ones",
  "split_many_global" = "Share allocated to Global spending options<br>when 5 out of 13 options are randomly selected<br>(4 out of 13 being of Global nature)",
  "donation" = "Share donated to plant trees",
  "donation_agg" = "Share donated to plant trees",
  "gcs_support" = "Global climate scheme (GCS)", # "Supports the Global Climate Plan", # "Soutient le Plan mondial pour le climat", #"Global climate scheme (GCS)", # 
  # "gcs_support_100" = "Support for the GCS",
  # "gcs_support_90" = "Support for a Global Climate Scheme at $90/tCO2",
  "gcs_support_control" = "Supports the Global Climate Scheme (GCS)",
  "gcs_belief" = "Belief about GCS support",
  "gcs_belief_own" = "Belief about GCS support in own country",
  "gcs_belief_us" = "\nBelief about GCS support in the U.S.\n(except for the U.S.: support in the EU)",
  "ncs_support" = "Supports the National Climate Scheme", 
  "ics_support" = "Supports Int'l Climate Scheme (any variant)",
  "ics_high_color_support" = "$ atop('     Supports the GCS if its other members* cover 64-72% of world emissions',          
                                     '*' * bold('High color') * ': High + Distributive effects displayed using colors on world map')", 
  "ics_high_support" = "$ atop('                    Supports the GCS if its other members* cover 64-72% of world emissions', 
                               '*' * bold(High) * ': Global South + China + EU + various HICs (UK, Japan, South Korea, Canada...)')", 
  "ics_mid_support" = "$ atop('Supports the GCS if its other members* cover 56% of world emissions', 
                              '                                                                   *' * bold('Mid') * ': Global South + China')", 
  "ics_low_support" = "$ atop('Supports the GCS if its other members* cover 25-33% of world emissions', 
                              '                                                                            *' * bold('Low') * ': Global South + EU')", # The syntax $ paste uses plotmath, cf. https://www.rdocumentation.org/packages/grDevices/versions/3.6.2/topics/plotmath
  # "ics_high_support" = "Supports the GCS if its other members* cover 64-72% of world emissions\n*High: Global South + China + EU + various HICs (UK, Japan, South Korea, Canada...)", 
  # "ics_high_color_support" = "Supports the GCS if its other members* cover 64-72% of world emissions\n*High color: High + Distributive effects displayed using colors on world map", 
  # "ics_mid_support" = "Supports the GCS if its other members* cover 56% of world emissions\n*Mid: Global South + China", 
  # "ics_low_support" = "Supports the GCS if its other members* cover 25-33% of world emissions\n*Low: Global South + EU", 
  "attention_test" = "Attention test",
  # "global_tax_support" = "Supports tax on millionaires' wealth with 30% funding low-income countries if\nGlobal: implemented by all other countries",
  # "hic_tax_support" = "Supports tax on millionaires' wealth with 30% funding low-income countries if\nHigh-income: implemented by all other HICs and not by some MICs (such as China)",
  # "intl_tax_support" = "Supports tax on millionaires' wealth with 30% funding low-income countries if\nInternational: implemented by some (e.g. EU, UK, Brazil) and not by others (e.g. U.S., China)",
  "global_tax_support" = "Global: implemented by all other countries",
  "hic_tax_support" = "High-income: implemented by all other HICs and not by some MICs (such as China)",
  "intl_tax_support" = "International: implemented by some (e.g. EU, UK, Brazil) and not by others (e.g. U.S., China)",
  "wealth_tax_support" = "Supports int'l tax on millionaires with 30% funding LICs (any variant)",
  # "global_tax_global_share" = "Preferred share of global tax for LICs (in %)",
  "group_defended" = "Group defended when voting",
  "survey_biased" = "Survey biased", 
  "survey_biased_yes" = "Survey is biased", 
  "survey_biased_left" = "Survey is left-wing biased", 
  "survey_biased_right" = "Survey is right-wing biased", 
  "survey_biased_no" = "Survey is not biased", 
  "interview" = "Agrees for interview",
  "duration" = "Duration",
  "duration_feedback" = "Duration: feedback",
  "gcs_comprehension" = "As a result of the GCS, gasoline price would...", 
  "share_policies_supported" = "Share of policies supported",
  "dropout" = "Dropped out",
  "my_tax_global_nation" = '"My taxes should go towards solving global problems"',
  "my_tax_global_nation_external" = '"My taxes ... global problems" (Global Nation, 2024)',
  "convergence_support" = '"Governments should actively cooperate to have all countries\nconverge in terms of GDP per capita by the end of the century"',
  "nationalist" = "Fellow citizens", # "Nationalist",
  "universalist" = "Humans or Sentient beings", # "Universalist",
  "individualist" = "Family and self", # "Individualist",
  "humanist" = "Humans", # "Humanist",
  "antispecist" = "Sentient beings (humans and animals)", # "Antispeciesist",
  "woman" = "Gender: Woman",
  "man" = "Gender: Man",
  "global_tax_more_30p" = "Preferred share of global wealth tax for low-income countries: ≥ 30%",
  "global_tax_more_10p" = "Preferred share of global wealth tax<br>for low-income countries: ≥ 10%",
  "branch_gcs" = "Treatment",
  # "maritime_split_ldc" = "Maritime levy revenue preferred allocation to:\nSustainable transition in LDCs",
  # "maritime_split_companies" = "Maritime levy revenue preferred allocation to:\nShipping companies to mitigate price increases",
  # "maritime_split_decarbonization" = "Maritime levy revenue preferred allocation to:\nRD&D of zero-emission fuels and ships",
  "maritime_split_ldc" =       "Sustainable transition in LDCs",
  "maritime_split_companies" = "Shipping companies to mitigate price increases",
  "maritime_split_decarbonization" = "RD&D of zero-emission fuels and ships",
  "why_hic_help_lic_responsibility" = "Responsibility: Historical responsibility of HICs for situation in LICs", # High-income countries have a historical responsibility for the current situation in low-income countries
  "why_hic_help_lic_interest" = "Interest: Long-term interest of HICs to help LICs", # In the long run, it is in the interest of high-income countries to help low-income countries
  "why_hic_help_lic_duty" = "Duty: Helping countries in need is the right thing to do", # Helping those in need is the right thing to do. This is also true at the international level
  "why_hic_help_lic_none" = "None of the above",
  "global_movement_no" = "Would not support such a movement",
  "global_movement_spread" = "Could sign a petition and spread ideas",
  "global_movement_demonstrate" = "Could attend a demonstration",
  "global_movement_strike" = "Could go on strike",
  "global_movement_donate" = "Could donate [$100] to a strike fund",
  "global_movement_support" = "Would support a global movement to tackle CC, tax millionaires,\n and fund LICs (either petition, demonstrate, strike, or donate)",
  "global_movement_part" = "Would be part of a global movement to tackle CC, tax millionaires,\n and fund LICs (either demonstrate, strike, or donate)",
  "likely_solidarity" = "Likelihood of significant transfers from HICs to LICs in next 15 years",
  "solidarity_support_billionaire_tax" = "Minimum tax of 2% on billionaires' wealth, in voluntary countries", # A minimum tax of 2% on the wealth of billionaires, in voluntary countries
  "solidarity_support_corporate_tax" = "Raise global minimum tax on profit from 15% to 35%, allocating revenues to countries based on sales", 
  # Raising the globally agreed minimum tax rate on profits of multinational firms from 15% to 35%, closing loopholes and allocating revenues to countries where sales are made
  "solidarity_support_expanding_security_council" = "Expand Security Council to new permanent members (e.g. India, Brazil, African Union), restrict veto use", 
  # Expanding the UN Security Council (in charge of peacekeeping) to new permanent members such as India, Brazil, and the African Union, and restricting the use of the veto
  "solidarity_support_foreign_aid" = "At least 0.7% of developed countries' GDP in foreign aid", # Developed countries contributing at least 0.7% of their GDP in foreign aid and development assistance
  "solidarity_support_debt_relief" = "Debt relief for vulnerable countries, suspending payments until they are more able to repay", # Debt relief for vulnerable countries by suspending repayments until they are better able to repay, promoting their development
  "solidarity_support_bridgetown" = "Bridgetown initiative: MDBs expanding sustainable investments in LICs, and at lower interest rates", # Institutions like the World Bank investing in many more sustainable projects in lower-income countries, and offering lower interest rates (the Bridgetown initiative)
  "solidarity_support_loss_damage" = "L&D: Developed countries financing a fund to help vulnerable countries cope with climate Loss and damage", # Developed countries financing a fund to help vulnerable countries cope with loss and damage from climate change
  "solidarity_support_ncqg_300bn" = "NCQG: Developing countries providing $300 bn a year in climate finance for developing countries", # Developed countries providing $300 billion a year (0.4% of their GDP) to finance climate action in developing countries
  "solidarity_support_shipping_levy" = "International levy on shipping carbon emissions, returned to countries based on population", # An international levy on carbon emissions from shipping, funding national budgets in proportion to population
  # "solidarity_support_shipping_levy" = "International levy on carbon emissions from shipping,\nfinancing countries' budgets in proportion to their population", # "Global maritime fuel levy with equal pc revenue sharing", # 
  "solidarity_support_aviation_levy" = "International levy on aviation carbon emissions, raising prices by 30%, returned to countries based on population", # An international levy on carbon emissions from aviation, raising ticket prices by 30% and funding national budgets in proportion to population
  "share_solidarity_supported" = "Share of plausible global policies supported",
  "share_solidarity_opposed" = "Share of plausible global policies opposed",
  "share_solidarity_ratio" = "Ratio of share of plausible policies supported over supported or opposed",
  "share_solidarity_diff" = "Difference between share of plausible policies supported and opposed",
  "latent_support_global_redistr" = "Latent support\nfor global redistribution (standardized)",
  "irt_global_redistr" = "Latent support\nfor global redistribution (MIRT)",
  "share_solidarity_supported_round" = "Share of plausible global policies supported",
  "share_solidarity_opposed_round" = "Share of plausible global policies opposed",
  "share_solidarity_supported_true" = "Share of plausible global policies supported",
  "share_solidarity_opposed_true" = "Share of plausible global policies opposed",
  "ncqg" = "Preferred North-to-South climate grant funding in 2035", # Preferred North-to-South climate funding
  "ncqg_full" = "Preferred North-to-South climate grant funding in 2035",
  "transfer_how_agencies" = "Development aid agencies", # Transfers to public development aid agencies which then finance suitable projects
  "transfer_how_govt_conditional" = "Government, conditional on financing poverty reduction", # Transfers to the national government conditioned on the use of funds for poverty reduction programs
  "transfer_how_govt_unconditional" = "Government, unconditional", # Unconditional transfers to the national government
  "transfer_how_local_authorities" = "Local authorities", # Unconditional transfers to local authorities (municipality, village chief...)
  "transfer_how_ngo" = "Local NGOs with democratic processes", # Transfers to local NGOs with democratic decision-making processes
  "transfer_how_social_protection" = "Targeted cash transfers (child allowances, disability & elderly pensions)", # Cash transfers to parents (child allowances), to the disabled and to the elderly
  "transfer_how_cash_unconditional" = "Unconditional cash transfers to each household", # Unconditional cash transfers to each household
  "sustainable_future" = "Prefers sustainable future", 
  "sustainable_future_A" = "Prefers sustainable future\n(Variant: Scenario A = Sustainable)", 
  "sustainable_future_B" = "Prefers sustainable future\n(Variant: Scenario B = Sustainable)", 
  "top_tax_support" = "Supports tax on world top income to finance global poverty reduction\n(Any variant)",
  "top1_tax_support" = "Supports tax on world top 1% to finance global poverty reduction\n(Additional 15% tax on income over [$120k/year in PPP])",
  "top3_tax_support" = "Supports tax on world top 3% to finance global poverty reduction\n(Additional 15% tax over [$80k], 30% over [$120k], 45% over [$1M])",
  "top_tax_support_affected" = "Supports tax on world top income to finance global poverty reduction\n(Any variant)",
  "top1_tax_support_affected" = "Supports tax on world top 1% to finance global poverty reduction\n(Additional 15% tax on income over [$120k/year in PPP])",
  "top3_tax_support_affected" = "Supports tax on world top 3% to finance global poverty reduction\n(Additional 15% tax over [$80k], 30% over [$120k], 45% over [$1M])",
  "top1_tax_support_binary" = "Supports tax on world top 1% to finance global poverty reduction\n(Additional 15% tax on income over [$120k/year in PPP])",
  "top3_tax_support_binary" = "Supports tax on world top 3% to finance global poverty reduction\n(Additional 15% tax over [$80k], 30% over [$120k], 45% over [$1M])",
  "affected_top1" = "Percentage of fellow citizens affected by top 1% tax",
  "transfer_top1" = "Percentage of GDP transferred abroad in top 1% tax",
  "affected_top3" = "Percentage of fellow citizens affected by top 3% tax",
  "transfer_top3" = "Percentage of GDP transferred abroad in top 3% tax",
  "income_exact_affected_top3_tax" = "Affected by the top 3% tax (income > $PPP 80k)",
  "income_exact_affected_top1_tax" = "Affected by the top 1% tax (income > $PPP 120k)",
  "income_exact_affected_top_tax" = "Affected by the top tax (any variant)",
  "gcs_price_increase" = "Inflation due to the GCS (in %)",
  "gcs_lost" = "Net monetary cost of the GCS (in $/month)",
  "vote_intl_coalition" = "More likely to vote for party if part of worldwide coalition for climate action and global redistribution",
  "reparations_support" = "Supports reparations for colonization and slavery in the form of funding education and technology transfers",
  "custom_redistr_winners" = "Preferred share of winners",
  "custom_redistr_losers" = "Preferred share of losers",
  "custom_redistr_winners_agg" = "Preferred share of winners",
  "custom_redistr_losers_agg" = "Preferred share of losers",
  "custom_redistr_self_lose" = "Loses in own custom redistribution",
  "custom_redistr_degree" = "Preferred degree of redistribution",
  "custom_redistr_income_min" = "Implied minimum income (in PPP $/month)",
  "custom_redistr_transfer" = "Implied transfer (in % of world income)",
  "custom_redistr_income_min_ceiling" = "Minimum income implied by the custom redistribution (in $/month)",
  "custom_redistr_transfer_ceiling" = "Transfer implied by the custom redistribution (in % of world income)",
  "custom_redistr_untouched" = "Has not touched the sliders",
  "custom_redistr_satisfied_touched" = "Touched sliders and satisfied",
  "well_being_gallup_0" = "Well-being: Gallup, 0-10 scale",
  "well_being_gallup_1" = "Well-being: Gallup, 1-10 scale",
  "well_being_wvs_0" = "Well-being: World Values Survey, 0-10 scale",
  "well_being_wvs_1" = "Well-being: World Values Survey, 1-10 scale",
  "well_being" = "Subjective well-being",
  "variant_field" = "Open-ended field variant",
  "variant_split" = "Revenue split variant",
  "variant_belief" = "GCS belief variant",
  "variant_warm_glow" = "Warm glow variant",
  "variant_ics" = "Int'l CS variant",
  "info_solidarity" = "Info on global policies",
  # "money" = "Money; own income; cost of living; inflation",
  # "relationships" = "Relationships; love; emotions", # also includes emotions
  # "job" = "Work; (un)employment; business",
  # "inequality" = "Poverty; inequality",
  # "global_inequality" = "Global poverty; hunger; global inequality",
  # "health" = "Health; healthcare system", 
  # "immigration" = "Criticism of immigration; national preference",
  # "corruption" = "Corruption; criticism of the government",
  # "environment" = "Environment; climate change",
  # "security" = "Security; violence; crime; judicial system",
  # "discrimination" = "Discrimination; gender inequality; racism; LGBT",
  # "rights" = "Rights; democracy; freedom; slavery",
  # "happiness" = "Happiness; peace of mind", # What do people mean by inner peace? What hassles occupy their mind? In what sense is their life not peaceful?
  # "war_peace" = "War; peace",
  # "taxes_welfare" = "Tax system; welfare benefits; public services",
  # "far_right_criticism" = "Criticism of far right; Trump; tariffs",
  # "mistrust" = "Social division; fake news; (social) media",
  # "animals" = "Animal welfare",
  # "religion" = "Religion; sin; God",
  # "housing" = "Housing",
  # "education" = "Education",
  # "old_age" = "Old age; retirement; ageing society",
  # "family" = "Family; children; childcare", # my child?
  # "global_issue" = "International issues",
  # "own_country" = "Own country referred", 
  # "other" = "Other topic; unclear; vague",
  # "nothing" = "Nothing; don't know; empty",
    setNames(names(all), names(all))
  )
  for (v in names(all)) { # intersect(c(socio_demos, socio_demos_us), names(all)), 
    if (grepl("-", Label(all[[v]])) & labels_vars[v] == v) labels_vars[v] <- sub("(.*)- ", "", Label(all[[v]]))
    if (grepl("_control", v) & labels_vars[v] == v) labels_vars[v] <- labels_vars[sub("_control", "", v)]
    if (grepl("TRUE / FALSE", Levels(all[[v]])[1])) labels_vars[paste0(v, "TRUE")] <- labels_vars[v]
    else for (l in setdiff(Levels(all[[v]]), NA)) {
      if (!paste0(v, l) %in% names(labels_vars)) labels_vars[paste0(v, l)] <- paste0(labels_vars[v], ": ", l)
    }
  }
  for (v in field_names) labels_vars[paste0("field_gpt_", v)] <- labels_vars[paste0("field_manual_", v)] <- keywords_labels[v]
  for (v in names(keywords_labels)) labels_vars[paste0("field_keyword_", v)] <- keywords_labels[v]
  for (v in names(keywords_comment_labels)) labels_vars[paste0("comment_keyword_", v)] <- keywords_comment_labels[v]
  for (v in comment_names) labels_vars[paste0("comment_gpt_", v)] <- labels_vars[paste0("comment_manual_", v)] <- names(comment_names)[comment_names == v]
}

##### heatmaps_defs #####
{
heatmaps_defs <- list()
heatmaps_defs <- list(
  "gcs_support" = list(vars = "gcs_support", conditions = ">= 1", width = 900, height = 150),
  "gcs_support_control" = list(vars = "gcs_support", conditions = ">= 1", width = 900, height = 150),  
  "belief" = list(vars = variables_gcs_belief, conditions = "", nb_digits = 0, width = 1000, height = 230), 
  "gcs_belief" = list(vars = c("gcs_support_control", variables_gcs_belief), conditions = "", nb_digits = 0, width = 1000, height = 250), 
  "variables_ics" = list(vars = variables_ics, conditions = ">= 1", width = 1550, height = 340), 
  "gcs_all" = list(vars = variables_gcs_all, conditions = "", nb_digits = 0, width = 1000, height = 300), 
  "gcs_ics" = list(vars = variables_gcs_ics, conditions = ">= 1", width = 1550, height = 400), 
  "gcs_ics_all" = list(vars = variables_gcs_ics_all, conditions = "", nb_digits = 0, width = 1550, height = 500), 
  "ncs_gcs_ics" = list(vars = variables_ncs_gcs_ics, conditions = ">= 1", width = 1550, height = 430), 
  "ncs_gcs_ics_all" = list(vars = variables_ncs_gcs_ics_all, conditions = "", nb_digits = 0, width = 1550, height = 550), 
  "ncs_gcs_ics_all_control" = list(vars = variables_ncs_gcs_ics_all_control, conditions = "", nb_digits = 0, width = 1550, height = 570), 
  "ncs_gcs_ics_all_control_median_belief" = list(vars = variables_ncs_gcs_ics_all_control, conditions_var = c("", "", "median", "median", rep("", 4)), nb_digits = 0, width = 1550, height = 540), 
  "ncs_gcs_ics_all_control_features" = list(vars = c(variables_ncs_gcs_ics_all_control, "gcs_price_increase", "gcs_lost"), conditions = "", nb_digits = 0, width = 1550, height = 610), 
  "ncs_gcs_ics_all_control_features_median_belief" = list(vars = c(variables_ncs_gcs_ics_all_control, "gcs_price_increase", "gcs_lost"), conditions_var = c("", "", "median", "median", rep("", 6)), nb_digits = 0, width = 1550, height = 610), 
  "duration" = list(vars = variables_duration, conditions = "", width = 800, height = 900),
  "share_solidarity_supported" = list(vars = c("share_solidarity_supported"), conditions = c(""), width = 1550, height = 450),
  "transfer_how" = list(vars = variables_transfer_how, conditions = c(">= 1", "< 0", "> 1"), sort = T, width = 1100, height = 400), 
  "solidarity_support" = list(vars = variables_solidarity_support_control, sort = T, width = 1200, height = 540),
  "solidarity_support_climate" = list(vars = variables_solidarity_support_control[6:10], sort = T, width = 1200, height = 350),
  "solidarity_support_incl_info" = list(vars = variables_solidarity_support, sort = T, width = 1200, height = 540),
  "global_movement" = list(vars = variables_global_movement, conditions = ">= 1", width = 1000, height = 320), 
  "global_movement_all" = list(vars = variables_global_movement_all, conditions = ">= 1", width = 1000, height = 400), 
  "why_hic_help_lic" = list(vars = variables_why_hic_help_lic, conditions = ">= 1", width = 1100, height = 270), 
  "reparations_support" = list(vars = "reparations_support", conditions = c("", ">= 1", "/"), width = 1000, height = 170), 
  "my_tax_global_nation" = list(vars = "my_tax_global_nation", conditions = c("", ">= 1", "/"), width = 1050, height = 170), 
  "convergence_support" = list(vars = "convergence_support", conditions = c("", ">= 1", "/"), width = 1150, height = 200), 
  "top_tax" = list(vars = c("top1_tax_support", "top3_tax_support"), conditions = c(">= 1", "/"), width = 1300, height = 200),
  "top_tax_all_share" = list(vars = c("top1_tax_support", "affected_top1", "transfer_top1", "top3_tax_support", "affected_top3", "transfer_top3"), conditions_var = rep(c("/", "", ""), 2), width = 1300, height = 380, proportion = T),
  "top_tax_all_positive" = list(vars = c("top1_tax_support", "affected_top1", "transfer_top1", "top3_tax_support", "affected_top3", "transfer_top3"), conditions_var = rep(c(">= 1", "", ""), 2), width = 1300, height = 380, proportion = T),
  "top_tax_all_negative" = list(vars = c("top1_tax_support", "affected_top1", "transfer_top1", "top3_tax_support", "affected_top3", "transfer_top3"), conditions_var = rep(c("<= -1", "", ""), 2), width = 1300, height = 380, proportion = T),
  "top_tax_affected_share" = list(vars = c("top_tax_support_affected", "income_exact_affected_top_tax", "top1_tax_support_affected", "income_exact_affected_top1_tax", "top3_tax_support_affected", "income_exact_affected_top3_tax"), conditions_var = rep(c("/", ""), 3), width = 1300, height = 380, proportion = T),
  "top_tax_affected_positive" = list(vars = c("top_tax_support_affected", "income_exact_affected_top_tax", "top1_tax_support_affected", "income_exact_affected_top1_tax", "top3_tax_support_affected", "income_exact_affected_top3_tax"), conditions_var = rep(c(">= 1", ""), 3), width = 1300, height = 380, proportion = T),
  "wealth_tax_support" = list(vars = variables_wealth_tax_support, conditions = ">= 1", width = 1100, height = 250),
  "custom_redistr_all" = list(vars = c(variables_custom_redistr_most, "custom_redistr_untouched", "custom_redistr_satisfied_touched"), conditions = "", width = 1200, height = 560),
  "custom_redistr_most" = list(vars = variables_custom_redistr_most, conditions = "", width = 1200, height = 510),
  "custom_redistr_satisfied" = list(vars = variables_custom_redistr_most[1:5], conditions = c("", "median"), width = 1200, height = 350),
  "main_radical_redistr" = list(vars = c("ncs_support", "gcs_support", "ics_support", "wealth_tax_support", variables_radical_redistr), conditions = c(">= 1"), width = 1100, height = 700),
  "radical_redistr" = list(vars = variables_radical_redistr, conditions = c(">= 1", "/"), width = 1100, height = 500),
  "radical_redistr_some" = list(vars = variables_radical_redistr[c(1:4,8)], conditions = c(">= 1", "/"), width = 1100, height = 350),
  "radical_redistr_all" = list(vars = c(variables_radical_redistr, "my_tax_global_nation_external"), conditions = c(">= 1", "/"), width = 1420, height = 650),
  "radical_redistr_few" = list(vars = c("top1_tax_support", "top3_tax_support", "convergence_support", "reparations_support", "my_tax_global_nation"), conditions = c(">= 1", "/"), width = 1100, height = 350),
  "radical_redistr_main" = list(vars = c("top1_tax_support", "top3_tax_support", "convergence_support", "reparations_support", "my_tax_global_nation", "my_tax_global_nation_external"), conditions = c(">= 1", "/"), width = 1100, height = 400), # TODO
  "well_being" = list(vars = variables_well_being, conditions = "", width = 1000, height = 300),
  "group_defended_3" = list(vars = variables_group_defended_3, conditions = ">= 1", width = 900, height = 250),
  "group_defended_4" = list(vars = variables_group_defended_4, conditions = ">= 1", width = 900, height = 270),
  "group_defended_5" = list(vars = variables_group_defended_5, conditions = ">= 1", width = 900, height = 350),
  "split_few" = list(vars = variables_split_few, conditions = c("", ">= 1"), width = 1000, height = 350), # white color at 20
  "split_many" = list(vars = variables_split_many, conditions = c("", ">= 1"), width = 1000, height = 700),
  "split_many_global" = list(vars = variables_split_many_global, conditions = c("", ">= 1"), width = 1100, height = 380), 
  "field_manual" = list(vars = variables_field_manual, conditions = ">= 1", sort = T, width = 850, height = 900),
  "field_keyword" = list(vars = variables_field_keyword, conditions = ">= 1", sort = T, width = 850, height = 1300),
  "field_keyword_main" = list(vars = variables_field_keyword_main, conditions = ">= 1", sort = T, width = 850, height = 900),
  "field_gpt" = list(vars = variables_field_gpt, conditions = ">= 1", sort = T, width = 850, height = 900),
  "comment_manual" = list(vars = variables_comment_manual, conditions = ">= 1", sort = T, width = 850, height = 450),
  "comment_keyword" = list(vars = variables_comment_keyword, conditions = ">= 1", sort = T, width = 850, height = 300),
  # "comment_gpt" = list(vars = variables_comment_gpt, conditions = ">= 1", sort = T, width = 850, height = 610),
  "synthetic_indicators" = list(vars = c("latent_support_global_redistr", "share_solidarity_supported_true", "share_solidarity_opposed_true", "share_solidarity_diff", "share_solidarity_ratio"), conditions = c("", "median"), sort = F, width = 950, height = 500, nb_digits = 2),
  "irt" = list(vars = c("latent_support_global_redistr", "irt_global_redistr", "share_solidarity_supported_true", "share_solidarity_opposed_true", "share_solidarity_diff", "share_solidarity_ratio"), conditions = c("", "median"), sort = F, width = 950, height = 500, nb_digits = 2),
  "sustainable_future" = list(vars = "sustainable_future", conditions = ">= 1", width = 900, height = 150), 
  "sustainable_futures" = list(vars = c("sustainable_future", "sustainable_future_A", "sustainable_future_B"), conditions = ">= 1", width = 1000, height = 270)
)


##### vars_heatmaps #####
vars_heatmaps <- c() # c("convergence_support", "my_tax_global_nation", "reparations_support") 
# TODO: automatize conditions = ">= 1" for binary vars; automatize folder creation; remove dependencies on objects such as countries_names_fr; remove NULL

heatmaps_defs <- fill_heatmaps(vars_heatmaps, heatmaps_defs)
}

##### barres_defs #####
{
barres_defs <- list( # It cannot contained unnamed strings (e.g. it can contain "var" = "var" but not simply "var")
  "split_few" = list(vars = variables_split_few_agg, width = 850, rev_color = T, add_means = T, show_legend_means = T, transform_mean = function(x) {x/100}), 
  "maritime_split_decarbonization" = list(height = 250),
  "maritime_split_companies" = list(height = 250),
  "maritime_split_ldc" = list(height = 250),
  "split_many" = list(vars = variables_split_many_agg, width = 850, rev_color = T, add_means = T, show_legend_means = T, transform_mean = function(x) {x/100}),
  "split_many_global" = list(vars = variables_split_many_global_agg, width = 850, rev_color = T, add_means = T, show_legend_means = T, transform_mean = function(x) {x/100}),
  "group_defended" = list(vars = "group_defended", width = 870, height = 600),
  "donation_agg" = list(vars = "donation_agg", width = 900, height = 550, add_means = T, transform_mean = function(x) {x/100}),
  "foreign_born_family" = list(vars = "foreign_born_family", width = 900, height = 550),
  "reparations_support" = list(vars = "reparations_support", width = 880, height = 450),
  "millionaire" = list(vars = "millionaire", width = 770, height = 550),
  "sustainable_future" = list(vars = "sustainable_future", width = 550, height = 550),
  "survey_biased" = list(vars = "survey_biased", width = 650, height = 550),
  "gcs_comprehension" = list(vars = "gcs_comprehension", width = 750, height = 550),
  "convergence_support" = list(vars = "convergence_support", width = 1200, height = 550),
  "vote_intl_coalition" = list(vars = "vote_intl_coalition", width = 810, height = 550),
  "ncqg_full" = list(vars = "ncqg_full", width = 850, height = 550),
  "ncqg" = list(vars = "ncqg", width = 850, height = 550),
  "gcs_support_control" = list(vars = "gcs_support_control", width = 700, height = 550),
  "solidarity_support_aviation_levy" = list(vars = "solidarity_support_aviation_levy", width = 920, height = 550),
  "solidarity_support_billionaire_tax" = list(vars = "solidarity_support_billionaire_tax", width = 1000, height = 550),
  # "maritime_split" = list(vars = "maritime_split", width = 850, height = 550),
  "share_solidarity_supported" = list(vars = "share_solidarity_supported_round", width = 820, height = 500, add_means = T, show_legend_means = T), 
  "share_solidarity_opposed" = list(vars = "share_solidarity_opposed_round", width = 820, height = 500, add_means = T, show_legend_means = T),
  "likely_solidarity" = list(vars = "likely_solidarity", width = 700),
  "custom_redistr_winners_agg" = list(vars = "custom_redistr_winners_agg", width = 750),
  "custom_redistr_losers_agg" = list(vars = "custom_redistr_losers_agg", width = 1200),
  "custom_redistr_transfer_ceiling" = list(vars = "custom_redistr_transfer_ceiling", width = 700),
  "custom_redistr_income_min_ceiling" = list(vars = "custom_redistr_income_min_ceiling", width = 850)
)

vars_barres <- c() # 

barres_defs <- fill_barres(vars_barres, barres_defs) # , df = us1
barresN_defs <- fill_barres(vars_barres, barres_defs, along = "country_name")

vars_barres1 <- c("split_few", "split_many", "split_many_global") # , "maritime_split" TODO: no error when variable not found
vars_barresN <- setdiff(names(barres_defs), vars_barres1)

barres_defs_nolabel <- list( 
  "group_defended" = list(vars = "group_defended", width = 980),
  "ncqg_full" = list(vars = "ncqg_full", width = 800),
  "ncqg" = list(vars = "ncqg", width = 1270),
  "convergence_support" = list(vars = "convergence_support", width = 400),
  "donation_agg" = list(vars = "donation_agg", width = 720),
  "reparations_support" = list(vars = "reparations_support", width = 910),
  "vote_intl_coalition" = list(vars = "vote_intl_coalition", width = 450),
  "sustainable_future" = list(vars = "sustainable_future", width = 400),
  "likely_solidarity" = list(vars = "likely_solidarity", width = 700),
  "share_solidarity_supported" = list(vars = "share_solidarity_supported_round", width = 860, add_means = T, show_legend_means = T),
  "share_solidarity_opposed" = list(vars = "share_solidarity_opposed_round", width = 860, add_means = T, show_legend_means = T)
)
barresN_defs_nolabel <- list( # It cannot contained unnamed strings (e.g. it can contain "var" = "var" but not simply "var")
  "ncqg_full" = list(vars = "ncqg_full", width = 1200),
  "ncqg" = list(vars = "ncqg", width = 1180),
  "convergence_support" = list(vars = "convergence_support", width = 1000),
  "group_defended" = list(vars = "group_defended", width = 1600, height = 600),
  "donation_agg" = list(vars = "donation_agg", width = 1000),
  "foreign_born_family" = list(vars = "foreign_born_family", width = 800),
  "reparations_support" = list(vars = "reparations_support", width = 1500),
  "millionaire" = list(vars = "millionaire", width = 1200),
  "vote_intl_coalition" = list(vars = "vote_intl_coalition", width = 810),
  "sustainable_future" = list(vars = "sustainable_future", width = 550),
  "survey_biased" = list(vars = "survey_biased", width = 650),
  "gcs_comprehension" = list(vars = "gcs_comprehension", width = 750),
  "share_solidarity_supported" = list(vars = "share_solidarity_supported_round", width = 1450, add_means = T, show_legend_means = T),
  "share_solidarity_opposed" = list(vars = "share_solidarity_opposed_round", width = 1450, add_means = T, show_legend_means = T),
  "likely_solidarity" = list(vars = "likely_solidarity", width = 700),
  "custom_redistr_winners_agg" = list(vars = "custom_redistr_winners_agg", width = 1500),
  "custom_redistr_losers_agg" = list(vars = "custom_redistr_losers_agg", width = 1500),
  "custom_redistr_transfer_ceiling" = list(vars = "custom_redistr_transfer_ceiling", width = 1500),
  "custom_redistr_income_min_ceiling" = list(vars = "custom_redistr_income_min_ceiling", width = 1200)
)
barres_defs_nolabel <- fill_barres(c(), barres_defs_nolabel)
barresN_defs_nolabel <- fill_barres(c(), barresN_defs_nolabel, along = "country_name")
}


##### Regular Figures #####
barres_multiple(barres_defs)
barres_multiple(barresN_defs[vars_barresN])
barres_multiple(barres_defs_nolabel, nolabel = T)
barres_multiple(barresN_defs_nolabel, nolabel = T)
heatmap_multiple(heatmaps_defs)
for (v in unique(all$variant_field)) heatmap_multiple(heatmaps_defs["field_manual"], data = all[all$variant_field == v,], name = paste0("field_", v, "_manual"))


##### Main Figures #####
# 4. Revenue split: country_comparison/split_main_means_nolegend + country_comparison/split_main_nb0_nolabel
plot_along("country_name", vars = c("revenue_split_few_global", "revenue_split_few_domestic_education_healthcare", "split_many_global", variables_split_many_global), # TODO! add dashed line at 20%
           labels = break_strings(labels_vars[c("revenue_split_few_global", "revenue_split_few_domestic_education_healthcare", "split_many_global", variables_split_many_global)], max_length = 46, sep = "<br>"),
           name = "split_main_means_nolegend", no_legend = T, levels_along = levels_default_list, save = T, return_mean_ci = F, df = all, width = 600, height = 500, shapes = c(19, 15, 0:6, 18, 8, 17)) 
plot_along("country_name", vars = c("revenue_split_few_global", "revenue_split_few_domestic_education_healthcare", "split_many_global", variables_split_many_global), 
           name = "split_main_nb0_nolabel", no_label = T, conditions = "== 0", to_percent = T, levels_along = levels_default_list, save = T, return_mean_ci = F, df = all, width = 370, height = 500, shapes = c(19, 15, 0:6, 18, 8, 17)) 

# 5a. ICS: mean of variant 
legend_ncs_gcs_ics <- c("Supports the National Climate Scheme", "Supports the Global Climate Scheme (GCS)", 
                        "Supports the GCS if coverage is **Low**<br>Other members: Global South + EU<br>(25-33% of world emissions)",
                        "Supports the GCS if coverage is **Mid**<br>Global South + China<br>(56% of world emissions)",
                        "Supports the GCS if coverage is **High**<br>Global South + China + EU + various HICs<br>(UK, Japan, Korea, Canada...; 64-72% of emissions)",
                        "Supports the GCS if coverage is **High**, **color** variant<br>Global South + China + EU + various HICs<br>+ Distributive effects shown using colors on world map")
plot_along("country_name", vars = variables_ncs_gcs_ics_control, levels_along = levels_default_list, labels = legend_ncs_gcs_ics, save = T, return_mean_ci = F, df = all, width = 1000, height = 480, origin = 50, plot_origin_line = T) 

# 5b. Wealth tax by coverage
legend_wealth_tax <- c("**Global**:<br>Implemented by<br>All other countries", 
                       "**High-income**:<br>All other HICs and<br>not some MICs (such as China)",
                       "**International**:<br>Some countries (e.g. EU, UK, Brazil)<br>and not others (e.g. U.S., China)")
plot_along("country_name", vars = variables_wealth_tax_support, labels = legend_wealth_tax, levels_along = levels_default_list, save = T, return_mean_ci = F, df = all, width = 820, height = 400, origin = 50, plot_origin_line = T) 

# 6. conjoint: foreign aid + global tax
plot_along(along = "millionaire_tax_in_program", vars = "program_preferred", subsamples = "country_name", save = T, plotly = F, return_mean_ci = F, df = call[!call$country %in% c("SA", "RU"),], width = 400, height = 370, 
           covariates = c("millionaire_tax_in_program", "cut_aid_in_program", "foreign3_in_program"), levels_subsamples = levels_default_list[-c(11,12)], colors = "black", origin = 0, plot_origin_line = T, no_legend = T) 
plot_along(along = "cut_aid_in_program", vars = "program_preferred", subsamples = "country_name", save = T, plotly = F, return_mean_ci = F, df = call[!call$country %in% c("SA", "RU"),], width = 400, height = 370, 
           covariates = c("millionaire_tax_in_program", "cut_aid_in_program", "foreign3_in_program"), levels_subsamples = levels_default_list[-c(11,12)], colors = "black", origin = 0, plot_origin_line = T, no_legend = T) 

plot_along(along = "millionaire_tax_in_program", vars = "program_preferred", subsamples = "country_name", save = T, plotly = F, return_mean_ci = F, df = call[!call$country %in% c("SA", "RU"),], width = 400, height = 370, name = "program_preferred_by_millionaire_tax_in_program_controls",
           covariates = c("millionaire_tax_in_program", "cut_aid_in_program", "foreign3_in_program", control_variables[-11]), levels_subsamples = levels_default_list[-c(11,12)], colors = "black", origin = 0, plot_origin_line = T, no_legend = T) 
plot_along(along = "cut_aid_in_program", vars = "program_preferred", subsamples = "country_name", save = T, plotly = F, return_mean_ci = F, df = call[!call$country %in% c("SA", "RU"),], width = 400, height = 370, name = "program_preferred_by_cut_in_aid_in_program_controls",
           covariates = c("millionaire_tax_in_program", "cut_aid_in_program", "foreign3_in_program", control_variables[-11]), levels_subsamples = levels_default_list[-c(11,12)], colors = "black", origin = 0, plot_origin_line = T, no_legend = T) 

plot_along(along = "millionaire_tax_in_program", vars = "program_preferred", subsamples = "country_name", save = T, plotly = T, return_mean_ci = F, df = call[!call$country %in% c("SA", "RU"),], width = 400, height = 370,
           weight = "weight", name = "program_preferred_by_millionaire_tax_in_program_dem", covariates = "millionaire_tax_in_program", levels_subsamples = levels.pol[-c(10,11)], colors = "black", origin = 0, plot_origin_line = T, no_legend = T)

# plot_along(along = "millionaire_tax_in_program", vars = "program_preferred", subsamples = "country_name", save = T, plotly = T, return_mean_ci = F, df = call[!call$country %in% c("SA", "RU"),], width = 400, height = 370,
#            weight = "weight", name = "program_preferred_by_millionaire_tax_in_program_pol", covariates = "millionaire_tax_in_program", levels_subsamples = levels.pol[-c(10,11)], colors = "black", origin = 0, plot_origin_line = T, no_legend = T)
# plot_along(along = "cut_aid_in_program", vars = "program_preferred", subsamples = "country_name", save = T, plotly = T, return_mean_ci = F, df = call[!call$country %in% c("SA", "RU"),], width = 400, height = 370,
#            weight = "weight", name = "program_preferred_by_cut_aid_in_program_pol", covariates = "cut_aid_in_program", levels_subsamples = levels.pol[-c(10,11)], colors = "black", origin = 0, plot_origin_line = T, no_legend = T)
# plot_along(along = "millionaire_tax_in_program", vars = "program_preferred", subsamples = "country_name", save = T, plotly = T, return_mean_ci = F, df = call[!call$country %in% c("SA", "RU"),], width = 400, height = 370,
#            weight = "weight", name = "program_preferred_by_millionaire_tax_in_program_pol_US", covariates = "millionaire_tax_in_program", levels_subsamples = levels_pol_US, colors = "black", origin = 0, plot_origin_line = T, no_legend = T)
# plot_along(along = "cut_aid_in_program", vars = "program_preferred", subsamples = "country_name", save = T, plotly = T, return_mean_ci = F, df = call[!call$country %in% c("SA", "RU"),], width = 400, height = 370,
#            weight = "weight", name = "program_preferred_by_cut_aid_in_program_pol_US", covariates = "cut_aid_in_program", levels_subsamples = levels_pol_US, colors = "black", origin = 0, plot_origin_line = T, no_legend = T)
# plot_along(along = "millionaire_tax_in_program", vars = "program_preferred", subsamples = "country_name", save = T, plotly = T, return_mean_ci = F, df = call[!call$country %in% c("SA", "RU"),], width = 400, height = 370,
#            weight = "weight", name = "program_preferred_by_millionaire_tax_in_program_dem", covariates = "millionaire_tax_in_program", levels_subsamples = levels.dem, colors = "black", origin = 0, plot_origin_line = T, no_legend = T)
# plot_along(along = "cut_aid_in_program", vars = "program_preferred", subsamples = "country_name", save = T, plotly = T, return_mean_ci = F, df = call[!call$country %in% c("SA", "RU"),], width = 400, height = 370,
#            weight = "weight", name = "program_preferred_by_cut_aid_in_program_dem", covariates = "cut_aid_in_program", levels_subsamples = levels.dem, colors = "black", origin = 0, plot_origin_line = T, no_legend = T)

# 7. Warm glow 
plot_along(along = "variant_warm_glow", vars = "gcs_support", subsamples = "country_name", save = T, plotly = F, return_mean_ci = F, df = all[all$variant_warm_glow != "NCS" & !all$country %in% c("SA", "RU") ,], width = 400, height = 370, 
           covariates = c("variant_warm_glow", control_variables[-11]), levels_subsamples = levels_default_list[-c(11,12)], colors = "black", origin = 0, plot_origin_line = T, no_legend = T, condition = " > 0") 

plot_along(along = "info_solidarity", vars = "share_solidarity_supported", subsamples = "country_name", save = T, plotly = F, return_mean_ci = F, df = all, width = 400, height = 370, 
           covariates = c("info_solidarity", control_variables[-11]), levels_subsamples = levels_default_list, colors = "black", origin = 0, plot_origin_line = T, no_legend = T) 

# 8. Realistic policies 1336 x 737
heatmap_multiple(heatmaps_defs[c("solidarity_support")])


##### Special Figures #####
## Custom Redistr
barres_multiple(barres_defs[c("custom_redistr_winners_agg", "custom_redistr_losers_agg", "custom_redistr_income_min_ceiling", "custom_redistr_transfer_ceiling")], df = all[all$custom_redistr_satisfied > 0,])

## Open-ended Fields
for (l in c("_manual", "_keyword", "_gpt")) for (v in unique(all$variant_field)) heatmap_multiple(heatmaps_defs[paste0("field", l)], data = all[all$variant_field == v,], name = paste0("field_", v, l))

## Radical Redistr
global_nation <- heatmap_table(vars = heatmaps_defs[["radical_redistr_all"]]$vars, labels = heatmaps_defs[["radical_redistr_all"]]$labels, along = "country_name", data = all, levels = levels_default, conditions = "/")
global_nation[9,] <- c(wtd.mean(all$my_tax_global_nation_2023, all$weight, na.rm = T), wtd.mean(all$my_tax_global_nation_2023, all$weight * all$country_name %in% countries_Eu, na.rm = T), my_taxes_global_nation_2023)
row.names(global_nation)[9] <- "\"My taxes ... global problems\" (Global Nation, 2023)" # 2024
save_plot(as.data.frame(global_nation), filename = "../xlsx/country_comparison/radical_redistr_all_share")
pdf("../figures/country_comparison/radical_redistr_all_share.pdf", width = 1150/72, height = 500/72)
heatmap_plot(global_nation, proportion = T, percent = T)
# save_plot(filename = "country_comparison/radical_redistr_all_share", width = 1550, height = 500, format = "pdf")
invisible(dev.off())

## Vote Representativeness
vote_by_country_pnr_out <- dataNK("vote", df = c(list(all[all$country_name %in% countries_EU,]), lapply(countries[c(1:8,11)], function(c) d(c))), miss=F, weights = T, rev=F, weight_non_na = F)[c(2:4,1),]
vote_by_country <- sweep(vote_by_country_pnr_out, 2, colSums(vote_by_country_pnr_out), FUN = "/")
colnames(vote_by_country) <- c("EU", countries_names[c(1:8,11)])
row.names(vote_by_country) <- c("Left", "Center-right or Right", "Far right", "Non-voter, PNR or Other")
true_vote_by_country <- vote_by_country
for (c in colnames(vote_by_country)[-1]) for (i in row.names(vote_by_country)) true_vote_by_country[i, c] <- replace_na(pop_freq[[names_countries[c]]]$vote[i], 0)
true_vote_by_country[,"EU"] <- c(c(.2597, .368, .3264)*(1 - .4926)/sum(c(.2597, .368, .3264)), .4926) # Allocating Non-attached MEPs to groups in proportion to group sizes
colnames(vote_by_country) <- colnames(vote_by_country_pnr_out) <- paste0(colnames(vote_by_country), ": Weighted sample")
colnames(true_vote_by_country) <- paste0(colnames(true_vote_by_country), ": Election results")
vote_data <- cbind(vote_by_country, true_vote_by_country)[,c(1,11,2,12,3,13,4,14,5,15,6,16,7,17,8,18,9,19,10,20)]
vote_EU <- cbind(vote_by_country[,2:6], true_vote_by_country[,2:6])[,c(1,6,2,7,3,8,4,9,5,10)]
vote_non_EU <- cbind(vote_by_country[,c(1,7:10)], true_vote_by_country[,c(1,7:10)])[,c(1,6,2,7,3,8,4,9,5,10)]
barres(vote_EU, file="country_comparison/vote_EU", labels = colnames(vote_EU), legend = row.names(vote_EU), color=c("red", "lightblue", "darkblue", "grey"), rev_color = FALSE, nsp=F, sort=F, export_xls = F, thin=T, save = T, miss=T, rev=F, grouped = F, width = 680, height = 430)
barres(vote_non_EU, file="country_comparison/vote_non_EU",  labels = colnames(vote_non_EU),legend = row.names(vote_non_EU), color=c("red", "lightblue", "darkblue", "grey"), rev_color = FALSE, nsp=F, sort=F, export_xls = F, thin=T, save = T, miss=F, rev=F, grouped = F, width = 680, height = 430)
barres(vote_data, file="country_comparison/vote_representativeness",  labels = colnames(vote_data),legend = row.names(vote_data), color=c("red", "lightblue", "darkblue", "grey"), rev_color = FALSE, nsp=F, sort=F, export_xls = F, thin=T, save = T, miss=F, rev=F, grouped = F, width = 680, height = 680)

true_vote_by_country_pnr_out <- sweep(true_vote_by_country, 2, (1 - true_vote_by_country[4,]), FUN = "/")
vote_EU_pnr_out <- cbind(vote_by_country_pnr_out[,2:6], true_vote_by_country_pnr_out[,2:6])[,c(1,6,2,7,3,8,4,9,5,10)]
vote_non_EU_pnr_out <- cbind(vote_by_country_pnr_out[,c(1,7:10)], true_vote_by_country_pnr_out[,c(1,7:10)])[,c(1,6,2,7,3,8,4,9,5,10)]
vote_pnr_out_EU <- cbind(vote_by_country_pnr_out, true_vote_by_country_pnr_out)[,c(1,11,2,12,3,13,4,14,5,15,6,16,7,17,8,18,9,19,10,20)]
vote_pnr_out <- cbind(vote_by_country_pnr_out, true_vote_by_country_pnr_out)[,c(2,12,3,13,4,14,5,15,6,16,7,17,8,18,9,19,10,20)]
barres(vote_EU_pnr_out, file="country_comparison/vote_EU_pnr_out", labels = colnames(vote_EU_pnr_out), legend = row.names(vote_EU_pnr_out), color=c("red", "lightblue", "darkblue", "grey"), rev_color = FALSE, nsp=F, sort=F, export_xls = F, thin=T, save = T, miss=T, rev=F, grouped = F, width = 1200, height = 430)
barres(vote_non_EU_pnr_out, file="country_comparison/vote_non_EU_pnr_out",  labels = colnames(vote_non_EU_pnr_out),legend = row.names(vote_non_EU_pnr_out), color=c("red", "lightblue", "darkblue", "grey"), rev_color = FALSE, nsp=F, sort=F, export_xls = F, thin=T, save = T, miss=T, rev=F, grouped = F, width = 1300, height = 430)
barres(vote_pnr_out_EU, file="country_comparison/vote_pnr_out_EU", labels = colnames(vote_pnr_out_EU), legend = row.names(vote_pnr_out_EU), color=c("red", "lightblue", "darkblue", "grey"), rev_color = FALSE, nsp=F, sort=F, export_xls = F, thin=T, save = T, miss=T, rev=F, grouped = F, width = 1500, height = 680)
barres(vote_pnr_out, file="country_comparison/vote_pnr_out", labels = colnames(vote_pnr_out), legend = row.names(vote_pnr_out), color=c("red", "lightblue", "darkblue", "grey"), rev_color = FALSE, nsp=F, sort=F, export_xls = F, thin=T, save = T, miss=T, rev=F, grouped = F, width = 1500, height = 680, display_values = FALSE)


## Revenue split
split_few <- array(NA, dim = c(5, 12), dimnames = list(variables_split_few, (names(levels_default_list)[-11])))
split_few_pol <- array(NA, dim = c(5, 13), dimnames = list(variables_split_few, levels_pol))
split_few_pol_US <- array(NA, dim = c(5, 13), dimnames = list(variables_split_few, levels_pol_US))
split_few_dem <- array(NA, dim = c(5, 13), dimnames = list(variables_split_few, levels_dem))
for (c in names(levels_default_list)[-11]) for (v in variables_split_few) split_few[v, c] <- with(all[all$country_name %in% levels_default_list[[c]],], wtd.mean(eval(str2expression(v)), weight))/100
for (c in levels_pol) for (v in variables_split_few) split_few_pol[v, c] <- with(all[all[[special_levels[[c]]$var]] %in% special_levels[[c]]$value,], wtd.mean(eval(str2expression(v)), weight))/100
for (c in levels_pol_US) for (v in variables_split_few) split_few_pol_US[v, c] <- with(all[all[[special_levels[[c]]$var]] %in% special_levels[[c]]$value,], wtd.mean(eval(str2expression(v)), weight))/100
for (c in levels_dem) for (v in variables_split_few) split_few_dem[v, c] <- with(all[all[[special_levels[[c]]$var]] %in% special_levels[[c]]$value,], wtd.mean(eval(str2expression(v)), weight))/100
split_many <- array(NA, dim = c(13, 12), dimnames = list(variables_split_many, (names(levels_default_list)[-11])))
for (c in names(levels_default_list)[-11]) for (v in variables_split_many) split_many[v, c] <- with(all[all$country_name %in% levels_default_list[[c]],], wtd.mean(eval(str2expression(v)), weight))
split_many <- sweep(split_many, 2, colSums(split_many), "/")
split_few_global_nb0 <- sapply(rev(names(levels_default_list)[-11]), function(c) with(all[all$country_name %in% levels_default_list[[c]],], wtd.mean(revenue_split_few_global > 0, weight)))
split_few_global_nb0_pol <- sapply(rev(levels_pol), function(c) with(all[all[[special_levels[[c]]$var]] %in% special_levels[[c]]$value,], wtd.mean(revenue_split_few_global > 0, weight)))
split_few_global_nb0_pol_US <- sapply(rev(levels_pol_US), function(c) with(all[all[[special_levels[[c]]$var]] %in% special_levels[[c]]$value,], wtd.mean(revenue_split_few_global > 0, weight)))
split_few_global_nb0_dem <- sapply(rev(levels_dem), function(c) with(all[all[[special_levels[[c]]$var]] %in% special_levels[[c]]$value,], wtd.mean(revenue_split_few_global > 0, weight)))
# dimnames(split_few) <- list(labels_vars[variables_split_few], names(levels_default_list))
# dimnames(split_many) <- list(labels_vars[variables_split_many], names(levels_default_list))

barres(data = split_few, file = "../figures/country_comparison/split_few_bars", save = T, export_xls = T, color = color(9)[c(1,6:9)], sort = F, miss = F, legend = labels_vars[variables_split_few], labels = names(levels_default_list)[-11], width = 1200, height = 550)
barres(data = split_few, file = "../figures/country_comparison/split_few_bars_nb0", add_means = split_few_global_nb0, name_mean = "Share allocating at least 5% to Global", save = T, export_xls = T, color = color(9)[c(1,6:9)], sort = F, miss = F, legend = labels_vars[variables_split_few], labels = names(levels_default_list)[-11], width = 1200, height = 600)
barres(data = split_many, file = "../figures/country_comparison/split_many_bars", save = T, export_xls = T, color = color(19)[c(1:4,11:19)], sort = F, miss = F, legend = labels_vars[variables_split_many], labels = names(levels_default_list)[-11], width = 1200, height = 800)
barres(data = split_few_pol, file = "../figures/country_comparison/split_few_pol", add_means = split_few_global_nb0_pol, name_mean = "Share allocating at least 5% to Global", save = T, export_xls = T, color = color(9)[c(1,6:9)], sort = F, miss = F, legend = labels_vars[variables_split_few], labels = levels.pol, width = 1200, height = 600)
barres(data = split_few_pol_US, file = "../figures/country_comparison/split_few_pol_US", add_means = split_few_global_nb0_pol_US, name_mean = "Share allocating at least 5% to Global", save = T, export_xls = T, color = color(9)[c(1,6:9)], sort = F, miss = F, legend = labels_vars[variables_split_few], labels = levels_pol_US, width = 1200, height = 600)
barres(data = split_few_dem, file = "../figures/country_comparison/split_few_dem", add_means = split_few_global_nb0_dem, name_mean = "Share allocating at least 5% to Global", save = T, export_xls = T, color = color(9)[c(1,6:9)], sort = F, miss = F, legend = labels_vars[variables_split_few], labels = levels.dem, width = 1200, height = 600)


## Custom redistr
wtd.median(all$custom_redistr_transfer, weight = all$weight * all$custom_redistr_satisfied_touched, na.rm = T) # 3.9% world GDP
barres_multiple(barres_defs[c("custom_redistr_income_min_ceiling", "custom_redistr_transfer_ceiling")], df = all[all$custom_redistr_satisfied > 0,])
barres_multiple(barresN_defs_nolabel[c("custom_redistr_income_min_ceiling", "custom_redistr_transfer_ceiling")], df = all[all$custom_redistr_satisfied > 0,], nolabel = T)
head(all$custom_redistr_income_min_ceiling)
heatmap_multiple(heatmaps_defs[c("custom_redistr_all", "custom_redistr_most")])
heatmap_multiple(heatmaps_defs[c("custom_redistr_satisfied")], data = all[all$custom_redistr_satisfied > 0,])

## Top tax
heatmap_multiple(heatmaps_defs["top_tax_all"], data = all[all$top_tax_support != 0,], weight_non_na = F)
heatmap_multiple(heatmaps_defs[c("top_tax_affected_share", "top_tax_affected_positive")], weight_non_na = F)

## Country ranking
heatmap_multiple(heatmaps_defs["synthetic_indicators"], levels = c(levels_default[1:2], countries_names[names(sort(-sapply(countries, function(c) round(wtd.mean(all$latent_support_global_redistr, all$weight * (if (c != "all") all$country %in% c), na.rm = T), 3))))]))
heatmap_multiple(heatmaps_defs["synthetic_indicators"], name = "synthetic_indicators_pol", levels = levels_pol)
heatmap_multiple(heatmaps_defs["synthetic_indicators"], name = "synthetic_indicators_dem", levels = levels_dem)
heatmap_multiple(heatmaps_defs["synthetic_indicators"], name = "synthetic_indicators_pol_US", levels = levels_pol_US)
heatmap_multiple(heatmaps_defs["irt"], name = "irt_pol", levels = levels_pol)

## Likely solidarity
barres_multiple(barres_defs["likely_solidarity"], df = all[all$info_solidarity == F,])
barres_multiple(barres_defs_nolabel["likely_solidarity"], nolabel = T, df = all[all$info_solidarity == F,])
barres_multiple(barresN_defs["likely_solidarity"], df = all[all$info_solidarity == F,])
barres_multiple(barresN_defs_nolabel["likely_solidarity"], nolabel = T, df = all[all$info_solidarity == F,])

# levels_pol
heatmap_multiple(heatmaps_defs["solidarity_support"], name = "solidarity_support_pol", levels = levels_pol)
heatmap_multiple(heatmaps_defs["radical_redistr"], name = "radical_redistr_pol", levels = levels_pol)
heatmap_multiple(heatmaps_defs["main_radical_redistr"], name = "main_radical_redistr_pol", levels = levels_pol)
heatmap_multiple(heatmaps_defs["solidarity_support"], name = "solidarity_support_pol_US", levels = levels_pol_US)
heatmap_multiple(heatmaps_defs["radical_redistr"], name = "radical_redistr_pol_US", levels = levels_pol_US)
heatmap_multiple(heatmaps_defs["main_radical_redistr"], name = "main_radical_redistr_pol_US", levels = levels_pol_US)
heatmap_multiple(heatmaps_defs["field_manual"], name = "field_manual_pol", levels = levels_pol)
heatmap_multiple(heatmaps_defs["field_manual"], name = "field_manual_pol_US", levels = levels_pol_US)

# levels_dem
heatmap_multiple(heatmaps_defs["solidarity_support"], name = "solidarity_support_dem", levels = levels_dem)
heatmap_multiple(heatmaps_defs["radical_redistr"], name = "radical_redistr_dem", levels = levels_dem)
heatmap_multiple(heatmaps_defs["main_radical_redistr"], name = "main_radical_redistr_dem", levels = levels_dem)
heatmap_multiple(heatmaps_defs["field_manual"], name = "field_manual_dem", levels = levels_dem)


## Conjoint by vote x country
plot_along(along = "millionaire_tax_in_program", vars = c("program_preferred", "program_preferred_left", "program_preferred_right", "program_preferred_pnr"), subsamples = "country_name", save = T, plotly = F, return_mean_ci = F, df = call[!call$country %in% c("SA", "RU"),], width = 700, height = 600, weight_non_na = F, 
           labels_along = setNames(c("<b>All</b>", "Left", "Center- to Far right", "Non-voter/PNR/Other"), c("program_preferred", "program_preferred_left", "program_preferred_right", "program_preferred_pnr")), legend_top = T,
           colors = c("black", "salmon", "darkblue", "purple"), covariates = c("millionaire_tax_in_program", "cut_aid_in_program", "foreign3_in_program"), levels_subsamples = levels_default_list[-c(11,12)], origin = 0, plot_origin_line = T, name = "program_preferred_by_millionaire_tax_vote_country") 
plot_along(along = "cut_aid_in_program", vars = c("program_preferred", "program_preferred_left", "program_preferred_right", "program_preferred_pnr"), subsamples = "country_name", save = T, plotly = F, return_mean_ci = F, df = call[!call$country %in% c("SA", "RU"),], width = 700, height = 600, weight_non_na = F, 
           labels_along = setNames(c("<b>All</b>", "Left", "Center- to Far right", "Non-voter/PNR/Other"), c("program_preferred", "program_preferred_left", "program_preferred_right", "program_preferred_pnr")), legend_top = T,
           colors = c("black", "salmon", "darkblue", "purple"), covariates = c("millionaire_tax_in_program", "cut_aid_in_program", "foreign3_in_program"), levels_subsamples = levels_default_list[-c(11,12)], origin = 0, plot_origin_line = T, name = "program_preferred_by_cut_aid_vote_country") 


## Conjoint on consistent programs
plot_along(along = "millionaire_tax_in_program", vars = "program_preferred", subsamples = "country_name", save = T, plotly = T, return_mean_ci = F, df = call[!call$country %in% c("SA", "RU") & call$consistent_conjoints,], width = 400, height = 370, 
           covariates = "millionaire_tax_in_program", levels_subsamples = levels_default_list[-c(11,12)], colors = "black", origin = 0, plot_origin_line = T, no_legend = T, name = "program_preferred_by_millionaire_tax_in_program_consistent") 
plot_along(along = "cut_aid_in_program", vars = "program_preferred", subsamples = "country_name", save = T, plotly = T, return_mean_ci = F, df = call[!call$country %in% c("SA", "RU") & call$consistent_conjoints,], width = 400, height = 370, 
           covariates = "cut_aid_in_program", levels_subsamples = levels_default_list[-c(11,12)], colors = "black", origin = 0, plot_origin_line = T, no_legend = T, name = "program_preferred_by_cut_aid_in_program_consistent") 

plot_along(along = "millionaire_tax_in_program", vars = "program_preferred", subsamples = "country_name", save = T, plotly = T, return_mean_ci = F, df = call[!call$country %in% c("SA", "RU") & call$consistent_conjoints_strict,], width = 400, height = 370,
           covariates = "millionaire_tax_in_program", levels_subsamples = levels_default_list[-c(11,12)], colors = "black", origin = 0, plot_origin_line = T, no_legend = T, name = "program_preferred_by_millionaire_tax_in_program_consistent_strict")
plot_along(along = "cut_aid_in_program", vars = "program_preferred", subsamples = "country_name", save = T, plotly = T, return_mean_ci = F, df = call[!call$country %in% c("SA", "RU") & call$consistent_conjoints_strict,], width = 400, height = 370,
           covariates = "cut_aid_in_program", levels_subsamples = levels_default_list[-c(11,12)], colors = "black", origin = 0, plot_origin_line = T, no_legend = T, name = "program_preferred_by_cut_aid_in_program_consistent_strict")

summary(lm(program_preferred ~ millionaire_tax_in_program + cut_aid_in_program, data = call, weights = weight))
# Effects are preserved when inconsistent programs are removed (considering the two policies as consistent with any program). Cf. Cuesta et al. (22)
summary(lm(program_preferred ~ millionaire_tax_in_program + cut_aid_in_program, data = call, weights = weight, subset = call$consistent_conjoints))
# The effect of cutting aid disappears when removing left-leaning programs where it is present; while wealth tax is preserved when removing right-leaning programs where it is present. => Cutting aid is harmful only for left-leaning programs; wealth tax is helpful for any program.
summary(lm(program_preferred ~ millionaire_tax_in_program + cut_aid_in_program, data = call, weights = weight, subset = call$consistent_conjoints_strict))


## Variance decompositions
# In case of error, define the dep_var as binary/numeric; and remove variables that are potentially colinear (e.g. urbanity when region is present, due to NA being colinear)
lmgs <- list() # ~1 min per run
variance_decomposition <- function(dep_var, covariates, filename = NULL, reuse = F, df = all, width = 500, height = 500, labels = NULL) {
  if (is.null(labels) & exists("labels_vars")) labels <- labels_vars[sort(covariates)]
  if (reuse && exists("lmgs") && !is.null(filename) && filename %in% names(lmgs)) lmg <- lmgs$filename
  else lmg <- calc.relimp(lm(reg_formula(dep_var, covariates, as_factor = T), data = df, weights = weight), type = c("lmg"), rela = F, rank= F) 
  plot <- barres(data = t(as.matrix(lmg@lmg[sort(names(lmg@lmg))])), labels = labels, legend = "% of response variances", show_ticks = F, rev = F, digits = 1)
  print(plot)
  save_plotly(plot, width = width, height = height, folder = paste0("../figures/", deparse(substitute(df)), "/"), filename = filename)
  write.csv(rbind(sort(lmg@lmg, decreasing = T), c("R^2", lmg@R2)), paste0("../tables/", deparse(substitute(df)), "/", filename, ".csv"))
  if (exists("lmgs") & !is.null(filename)) lmgs[filename] <<- lmg
  else return(lmg)
}
variance_decomposition(dep_var = "share_solidarity_supported", covariates = control_variables_lmg[c(1,3:9,16)], height = 370, filename = "lmg_share_solidarity_supported_few")
variance_decomposition(dep_var = "share_solidarity_supported", covariates = control_variables_lmg[3:9], height = 370, filename = "lmg_share_solidarity_supported_few_wo_vote_country")
variance_decomposition(dep_var = "share_solidarity_supported", covariates = c(control_variables_lmg[c(1,3:9,16)], "group_defended"), height = 370, filename = "lmg_share_solidarity_supported_few_group")
variance_decomposition(dep_var = "gcs_support > 0", covariates = control_variables_lmg[c(1,3:9,16)], height = 370, filename = "lmg_gcs_support_few")
variance_decomposition(dep_var = "gcs_support > 0", covariates = control_variables_lmg[3:9], height = 370, filename = "lmg_gcs_support_few_wo_vote_country")
variance_decomposition(dep_var = "gcs_support > 0", covariates = c(control_variables_lmg[c(1,3:9,16)], "group_defended"), height = 370, filename = "lmg_gcs_support_few_group")
# variance_decomposition(dep_var = "vote", covariates = c(control_variables_lmg[c(1,3:9,16)], "group_defended"), height = 370, filename = "lmg_gcs_support_few_group")

for (l in names(lmgs)) print(paste0("R² ", l, ": ", round(lmgs[[l]]@R2, 4)))
summary(lm(reg_formula("gcs_support > 0", control_variables_lmg), data = all, weights = weight))$adj.r.squared # .11 (simple R²: .12)
# summary(lm(reg_formula("gcs_support > 0", c(control_variables_lmg, "age_exact*vote_original", "vote_agg*urbanity_factor*gender")), data = all, weights = weight))$adj.r.squared # .13 (simple R²: .22)
summary(lm(reg_formula("share_solidarity_supported", control_variables_lmg), data = all, weights = weight))$adj.r.squared # .17 (simple R²: .18)
# summary(lm(reg_formula("share_solidarity_supported", c(control_variables_lmg, "age_exact*vote_original", "vote_agg*urbanity_factor*gender")), data = all, weights = weight))$adj.r.squared # .21 (simple R²: .29)


## Word clouds
stopwords <- c(unlist(sapply(c("french", "english", "german", "spanish", "russian", "italian", "arabic"), function(v) stopwords::stopwords(v))), # Polish & Japanese not supported
               "people", "survey", ".......", "....", "...", "..", "need", "wish", "needs", "wishes", "want", "greatest", "injustice", "important", "issue", "issues", "neglected", "think", "nothing", "particular", "umfrage", "dass", "plus", "encuesta", "comments", "nie", "brak", "ankieta", "mam", "bardzo", "że", "jest", "sondaggio", "enquête")

for (c in c("all", countries)) for (v in paste0(c("field", "comment_field"), c("", "", "_en", "_en"))) {
  size_wordcloud <- if (grepl("comment", v)) 250/72 else 350/72
  pdf(paste0("../figures/", c, "/", v, ".pdf"), width = size_wordcloud, height = size_wordcloud)
  rquery.wordcloud(gsub("thanks", "thank", d(c)[[v]]), max.words = 70, colorPalette = "Blues", excludeWords = stopwords, weights = d(c)$weight) 
  invisible(dev.off())
}
for (c in c("all", countries)) for (v in sub("_field", "", variables_field)) for (var in c("field", "field_en")) {
  size_wordcloud <- if (v %in% c("injustice", "concerns")) 250/72 else 400/72
  pdf(paste0("../figures/", c, "/", v, "_", var, ".pdf"), width = size_wordcloud, height = size_wordcloud)
  rquery.wordcloud(d(c)[[var]][d(c)$variant_field %in% v], weights = d(c)$weight[d(c)$variant_field %in% v], max.words = 70, colorPalette = "Blues", excludeWords = c(stopwords)) 
  invisible(dev.off())
} 


##### Warm glow 2SLS Table #####
first_stage <- lm((likely_solidarity > 0) ~ info_solidarity, data = e, weights = weight)
iv_model <- ivreg(share_solidarity_supported ~ (likely_solidarity > 0) | info_solidarity, data = e, weights = weight)
# first_stage_f <- summary(iv_model, diagnostics = TRUE)$diagnostics["Weak instruments", "statistic"]
ols_model <- lm(share_solidarity_supported ~ (likely_solidarity > 0), data = e, weights = weight)
direct_effect <- lm(share_solidarity_supported ~ info_solidarity, data = e, weights = weight)
stargazer(first_stage, iv_model, ols_model, direct_effect,
          column.labels = c("IV 1st Stage", "IV 2nd Stage", "OLS", "Direct Effect"), model.names = FALSE, no.space = TRUE,
          keep.stat = c("n", "rsq", "f"), label = "tab:iv", dep.var.caption = "", #, "adj.rsq"), dep.var.caption = "Dependent variable:" ,
          dep.var.labels = c("\\makecell{Believes global\\\\redistr. likely}", "Share of plausible global policies supported"),
          covariate.labels = c("Information treatment", "Believes global redistribution likely", "(Intercept)"),
          type = "latex", style = "default", out = "../tables/IV.tex", float = FALSE,
          title = "Effect on support for global redistribution of believing that it is likely.")  # add.lines = list(c("1st Stage F-statistic", round(first_stage_f, 2), "", "", ""))


##### Conjoint Analysis #####
policies.names <- as.matrix(read.xlsx("../questionnaire/sources.xlsx", sheet = "Policies", rowNames = T)) #, rows = c(1, 16:41), cols = 1:6))
policies.names <- policies.names[is.na(as.numeric(row.names(policies.names))), ] # NAs by coercion normal
formula_cjoint <- as.formula("selected ~ econ_issues + society_issues + climate_pol + tax_system + foreign_policy")
amce <- ca <- list() # We should have "Old qualtrics format detected." (otherwise it would assume new format and delete the first observation).

# Requires: amce, variables_conjoint_all, variables_conjoint_policies, policies_conjoint, conjoint_attributes, policies.names, formula_cjoint, languages_country, files ../conjoint_analysis/[lang].dat
compute_conjoint <- function(df_names = countries[!countries %in% c("SA", "RU")], export = T, include_indifferent = T, subset = "", weights = "weight", width = 1000, height = 700, max_length_string = 75, font = 16) {
  # subset should be the name of a T/F variable
  coefs <- list() # We should have "Old qualtrics format detected." (otherwise it would assume new format and delete the first observation).
  for (df in df_names) { # c([!countries %in% c("SA", "RU")], paste0(pilot_countries, "p"))
    print(df)
    data <- d(df)[if (subset != "") d(df)[[subset]] else T, c(variables_conjoint_all, 'conjoint_misleading', 'conjoint', 'country', 'weight', 'n')]
    main_language <- languages_country[[sub("p", "", df)]][1]
    csv.path <- paste0("../conjoint_analysis/ca_", df, "_", subset, ".csv")
    write.csv(data, csv.path, row.names = FALSE) # !is.na(d(df)$conjoint_number) 'conjoint_number', 
    temp <- readLines(csv.path)
    writeLines(c(temp[1], temp), csv.path)
    
    # /!\ If bugs, it's because a patched version of cjoint should be installed (cf. .Rprofile)
    
    ca <- read.qualtrics(csv.path, responses = 'conjoint_misleading', covariates = c(variables_conjoint_policies), respondentID = "n") # names(d(n))[cols_conjoint] , letter = "F"
    names(ca)[1] <- "n"
    ca <- merge(data[, intersect(names(data), c("country", "conjoint", "weight", "n"))], ca) # vote "conjoint_number", 
    design_cjoint <- makeDesign(filename = paste0("../conjoint_analysis/", main_language, ".dat")) 
    
    # To allow for ties, replace selected==NA by 0.5 and previously make conjoint_r_number == "" for respondents who chose "neither" (read.qualtrics removes NA from ca but keeps "" which it converts into selected==NA).
    if (nrow(ca) < 2*nrow(data)) warning(paste("/!\\ The question was not asked to", nrow(data) - nrow(ca)/2, "respondents in ", df))
    if (include_indifferent) ca$selected[ca$conjoint %in% "Neither of them"] <- .5
    else ca <- ca[!ca$conjoint %in% "Neither of them",]
    if (any(is.na(ca))) warning(paste("/!\\", sum(sapply(1:nrow(ca), function(i) any(is.na(ca[i,]))))), "rows with some NAs have been removed in ", df)
    for (lang in c(paste0("EN-", ifelse(df == "JP", "JA", df)), main_language)) if (lang %in% names(policies_conjoint)) {
      key <- paste0(lang, if (subset != "") "_", subset, if (!include_indifferent) "_wo_neither", if (is.null(weights)) "_unweighted" else if (weights != "weight") paste0("_", weights))
      coefs[[key]] <- amce(formula_cjoint, ca[sapply(1:nrow(ca), function(i) !any(is.na(ca[i,]))),], design = design_cjoint, cluster = FALSE, weights = weights)
      policies_l <- c(unlist(setNames(policies_conjoint[[lang]], conjoint_attributes)), "-" = "-")
      for (i in 1:length(coefs[[key]]$attributes)) coefs[[key]]$user.names[[i+1]] <- names(policies_conjoint[[lang]])[i]
      for (i in 1:length(coefs[[key]]$user.levels)) coefs[[key]]$user.levels[[i]] <- break_strings(policies_l[coefs[[key]]$user.levels[[i]]], max_length = max_length_string, sep = "\n")
    }
  }
  
  if (export) for (j in names(coefs)) amce[[j]] <<- coefs[[j]]
  if (export) for (key in names(coefs)) { # for (df in df_names) { for (key in paste0(c(paste0("EN-", ifelse(df == "JP", "JA", df)), languages_country[[sub("p", "", df)]][1]), "_", subset)) if (lang %in% names(policies_conjoint)) {
    pdf(paste0("../figures/all/conjoint_", key, ".pdf"), width = width/72, height = height/72) 
    plot(coefs[[key]], xlab = "Average Marginal Component Effect", text.size = font)
    invisible(dev.off())
    # save_plot(filename = paste0("conjoint_", lang), folder = paste0('../figures/', df, '/'), width = 1100, height = 700, method='dev', trim = F, format = 'pdf') 
  } 
}

compute_conjoint(subset = "consistent_conjoints")
compute_conjoint(subset = "consistent_conjoints_strict")
# compute_conjoint(include_indifferent = FALSE)
# compute_conjoint(weights = NULL)
compute_conjoint()


##### Rename cropped files #####
for (folder in c("../figures/country_comparison/cropped", "../figures/all/cropped")) { # "C:/Users/fabre/Downloads") { # 
  for (file in list.files(folder)) file.rename(file.path(folder, file), file.path(folder, sub(" \\(cropped\\) \\(pdfresizer\\.com\\)", "", file)))
}
