##### Radical redistribution: example world income tax #####
# Data fetch and preparation
gethin <- read.csv("../../robustness_global_redistr/data_ext/fisher-gethin-redistribution-2024-06-27.csv") # Fisher-Post & Gethin (2023) https://www.dropbox.com/scl/fi/yseottljqpzom1lrqga5c?e=1

inflation <- read.xlsx("../../robustness_global_redistr/data_ext/inflation_imf.xlsx") # IMF WEO (Oct 2024) https://www.imf.org/external/datamapper/PCPIPCH@WEO/WEOWORLD/VEN
gethin <- merge(gethin, inflation, all.x = T)
for (y in 2018:2024) gethin[[paste0("inflation_", y)]][is.na(gethin[[paste0("inflation_", y)]]) | gethin[[paste0("inflation_", y)]] == "no data"] <- 1
for (y in 2018:2024) gethin[[paste0("inflation_", y)]] <- as.numeric(gethin[[paste0("inflation_", y)]])
gethin$inflation_2023_2024 <- (1+gethin$inflation_2023/100)*(1+gethin$inflation_2024/100)

growth <- read.xlsx("../../robustness_global_redistr/data_ext/growth_imf.xlsx") # Real GDP growth, IMF WEO (Oct 24), Accessed on 12/21/2024, https://www.imf.org/external/datamapper/NGDP_RPCH@WEO/OEMDC/ADVEC/WEOWORLD
gethin <- merge(gethin, growth, all.x = T)
gethin$growth_2020_2024 <- (1+gethin$growth_2020/100)*(1+gethin$growth_2021/100)*(1+gethin$growth_2022/100)*(1+gethin$growth_2023/100)*(1+gethin$growth_2024/100)
gethin$growth_2020_2024[is.na(gethin$growth_2020_2024)] <- 1

# Income is expressed in PPP $ 2024 equal-split (we inflate all 2019 LCU quantiles using country growth, add inflation up to 2022 with defl, convert to 2022 $ PPP with xppp_us, add U.S. inflation up to 2024)
gethin$lcu19_growth_ppp24 <- gethin$growth_2020_2024 * mean(gethin$inflation_2023_2024[gethin$iso == "US"], na.rm = T) / (gethin$xppp_us * gethin$defl) 
gethin$disposable_inc <- gethin$a_pdi * gethin$lcu19_growth_ppp24 # a: average, pdi: disposable (pretax - direct taxes + gov_soc: social assistance transfers)

# Nominal income
ppp <- read.xlsx("../../robustness_global_redistr/data_ext/ppp.xlsx") # 10/21/2025 https://databank.worldbank.org/source/world-development-indicators/Series/PA.NUS.PRVT.PP#
gethin <- merge(gethin, ppp, all.x = T)
gethin$disposable_inc_mer <- gethin$disposable_inc * no.na(gethin$ppp2022, wtd.mean(gethin$ppp2022, gethin$npop))
# gethin$disposable_inc_mer <- gethin$disposable_inc * gethin$ppp2022

# Tax revenue from a given linear tax, in proportion of world income (slightly underestimated, at the threshold percentile)
tax_revenue <- function(distr = thousandile_world_disposable_inc, weight = NULL, rate = .1, threshold = 48e3) {
  if (is.null(weight)) return(sum(pmax(0, rate*(distr - threshold)), na.rm = T)/sum(distr, na.rm = T)) 
  else return(sum(pmax(0, rate*(distr - threshold)) * weight, na.rm = T)/sum(distr * weight, na.rm = T)) } 
# Tax cost of funding a given income floor (= poverty gap), in proportion of world income
tax_cost <- function(threshold = 2555, distr = thousandile_world_disposable_inc, weight = NULL) {
  if (is.null(weight)) return(sum(pmax(0, threshold - distr), na.rm = T)/sum(distr, na.rm = T)) 
  else return(sum(pmax(0, threshold - distr) * weight, na.rm = T)/sum(distr * weight, na.rm = T)) } 

# Constants
countries <- c("FR", "US")
countries_names <- c("France", " U.S.")
countries_iso3 <- c("FRA", "USA")
eur_per_dollar <- c(0.926, 1) # 04/25
pop <- sapply(countries, function(c) mean(gethin$npop[gethin$iso == c], na.rm = T))
world_population <- 8231613070 # UN, 2025, Accessed 12/21/2024, https://population.un.org/dataportal/data/indicators/49/locations/900/start/2024/end/2025/table/pivotbylocation?df=e5e54b33-f396-4e7a-a2e6-938af4215c20
(inflation_2023_2024 <- sapply(countries, function(c) mean(gethin$inflation_2023_2024[gethin$iso == c], na.rm = T)))
(xppp_us <- sapply(countries, function(c) mean(gethin$xppp_us[gethin$iso == c], na.rm = T)))
usd_lcu <- xppp_us * inflation_2023_2024 / inflation_2023_2024["US"]

# PPP
gdp_cost_tax_top8 <- sapply(unique(gethin$iso), function(c) (tax_cost(6300, gethin$disposable_inc[gethin$iso == c], gethin$weight[gethin$iso == c])))
sum(sapply(unique(gethin$iso), function(c) pmax(0, (100*gdp_cost_tax_top8[c])*sum(gethin$disposable_inc[gethin$iso == c] * gethin$weight[gethin$iso == c], na.rm = T))), na.rm=T)/
  sum(sapply(unique(gethin$iso), function(c) sum(gethin$disposable_inc[gethin$iso == c] * gethin$weight[gethin$iso == c], na.rm = T)), na.rm=T) # 8.8%
# gdp_cost_tax_top8 <- sapply(unique(gethin$iso), function(c) (tax_cost(6220, gethin$disposable_inc[gethin$iso == c], gethin$weight[gethin$iso == c])))
# sum(sapply(unique(gethin$iso), function(c) pmax(0, (100*gdp_cost_tax_top8[c])*sum(gethin$disposable_inc[gethin$iso == c] * gethin$weight[gethin$iso == c], na.rm = T))), na.rm=T)/
#   sum(sapply(unique(gethin$iso), function(c) sum(gethin$disposable_inc[gethin$iso == c] * gethin$weight[gethin$iso == c], na.rm = T)), na.rm=T) # 8.6%

gdp_contribution_tax_top8 <- sapply(unique(gethin$iso), function(c) (tax_revenue(gethin$disposable_inc[gethin$iso == c], gethin$weight[gethin$iso == c], .15, 48e3)
                                                                     + tax_revenue(gethin$disposable_inc[gethin$iso == c], gethin$weight[gethin$iso == c], .15, 80e3)
                                                                     + tax_revenue(gethin$disposable_inc[gethin$iso == c], gethin$weight[gethin$iso == c], .15, 120e3)
                                                                     + tax_revenue(gethin$disposable_inc[gethin$iso == c], gethin$weight[gethin$iso == c], .45, 8e5))) # 1e6
sum(sapply(unique(gethin$iso), function(c) pmax(0, (100*gdp_contribution_tax_top8[c])*sum(gethin$disposable_inc[gethin$iso == c] * gethin$weight[gethin$iso == c], na.rm = T))), na.rm=T)/
  sum(sapply(unique(gethin$iso), function(c) sum(gethin$disposable_inc[gethin$iso == c] * gethin$weight[gethin$iso == c], na.rm = T)), na.rm=T) # 8.9%

gdp_cost_tax_top5 <- sapply(unique(gethin$iso), function(c) (tax_cost(5500, gethin$disposable_inc[gethin$iso == c], gethin$weight[gethin$iso == c])))
sum(sapply(unique(gethin$iso), function(c) pmax(0, (100*gdp_cost_tax_top5[c])*sum(gethin$disposable_inc[gethin$iso == c] * gethin$weight[gethin$iso == c], na.rm = T))), na.rm=T)/
  sum(sapply(unique(gethin$iso), function(c) sum(gethin$disposable_inc[gethin$iso == c] * gethin$weight[gethin$iso == c], na.rm = T)), na.rm=T) # 6.8%

gdp_contribution_tax_top5 <- sapply(unique(gethin$iso), function(c) (tax_revenue(gethin$disposable_inc[gethin$iso == c], gethin$weight[gethin$iso == c], .1, 63e3)
                                                                     + tax_revenue(gethin$disposable_inc[gethin$iso == c], gethin$weight[gethin$iso == c], .15, 80e3)
                                                                     + tax_revenue(gethin$disposable_inc[gethin$iso == c], gethin$weight[gethin$iso == c], .15, 95e3)
                                                                     + tax_revenue(gethin$disposable_inc[gethin$iso == c], gethin$weight[gethin$iso == c], .25, 8e5))) # 1e6
sum(sapply(unique(gethin$iso), function(c) pmax(0, (100*gdp_contribution_tax_top5[c])*sum(gethin$disposable_inc[gethin$iso == c] * gethin$weight[gethin$iso == c], na.rm = T))), na.rm=T)/
  sum(sapply(unique(gethin$iso), function(c) sum(gethin$disposable_inc[gethin$iso == c] * gethin$weight[gethin$iso == c], na.rm = T)), na.rm=T) # 6.8%

# nominal
sum(sapply(unique(gethin$iso), function(c) pmax(0, (100*gdp_cost_tax_top8[c])*sum(gethin$disposable_inc_mer[gethin$iso == c] * gethin$weight[gethin$iso == c], na.rm = T))), na.rm=T)/
  sum(sapply(unique(gethin$iso), function(c) sum(gethin$disposable_inc_mer[gethin$iso == c] * gethin$weight[gethin$iso == c], na.rm = T)), na.rm=T) # 5.2%

sum(sapply(unique(gethin$iso), function(c) pmax(0, (100*gdp_contribution_tax_top8[c])*sum(gethin$disposable_inc_mer[gethin$iso == c] * gethin$weight[gethin$iso == c], na.rm = T))), na.rm=T)/
  sum(sapply(unique(gethin$iso), function(c) sum(gethin$disposable_inc_mer[gethin$iso == c] * gethin$weight[gethin$iso == c], na.rm = T)), na.rm=T) # 9.8%

sum(sapply(unique(gethin$iso), function(c) pmax(0, (100*gdp_cost_tax_top5[c])*sum(gethin$disposable_inc_mer[gethin$iso == c] * gethin$weight[gethin$iso == c], na.rm = T))), na.rm=T)/
  sum(sapply(unique(gethin$iso), function(c) sum(gethin$disposable_inc_mer[gethin$iso == c] * gethin$weight[gethin$iso == c], na.rm = T)), na.rm=T) # 4.2%

sum(sapply(unique(gethin$iso), function(c) pmax(0, (100*gdp_contribution_tax_top5[c])*sum(gethin$disposable_inc_mer[gethin$iso == c] * gethin$weight[gethin$iso == c], na.rm = T))), na.rm=T)/
  sum(sapply(unique(gethin$iso), function(c) sum(gethin$disposable_inc_mer[gethin$iso == c] * gethin$weight[gethin$iso == c], na.rm = T)), na.rm=T) # 7.7%

# world_disposable_inc_mer <- compute_world_distrib_from_gethin("disposable_inc_mer") # nominal $ 2024
# quantile_world_disposable_inc_mer <- c(quadratic_interpolations(pmax(0, world_disposable_inc_mer$disposable_inc_mer_mean), pmax(0, world_disposable_inc_mer$disposable_inc_mer_thre), 
#                                                                    c((0:99)/100, .999, 1), seq(0.000, .998, 0.001)), world_disposable_inc_mer$disposable_inc_mer_mean[101:102] %*% c(.9, .1))

## Thresholds in LCU 2024 (from PPP $ 2024)
48e3*usd_lcu
120e3*usd_lcu
1e6*usd_lcu
# per year 
round(42e3*usd_lcu/1e3)*1e3
round(120e3*usd_lcu/1e3)*1e3
round(1e6*usd_lcu/1e3)*1e3
# per month
round(48e3*usd_lcu/1e2/12)*1e2 # 3k
round(63e3*usd_lcu/1e2/12)*1e2 # 4k
round(80e3*usd_lcu/1e2/12)*1e2 # 5k
round(95e3*usd_lcu/1e2/12)*1e2 # 6k
round(120e3*usd_lcu/1e2/12)*1e2 # 
round(800e3*usd_lcu/1e2/12)*1e2 # 50k
round(1e6*usd_lcu/1e4/12)*1e4
round(6220*usd_lcu/12)
round(6300*usd_lcu/12) # 396€
round(5500*usd_lcu/12) # 396€
# per day
round(6220*usd_lcu/365)

# Poverty rate
mean(thousandile_world_disposable_inc < 6300)*world_population/1e9 # 3.8G people with less than €400 per month
mean(thousandile_world_disposable_inc < 5500)*world_population/1e9 # 3.5G people with less than €350 per month (42.5%)

# Share of top income affected by new tax (in %)
1-mean(thousandile_world_disposable_inc < 48e3) # 7.9% at world level
(share_affected_tax_top8 <- round(sapply(countries, function(c) 100 - 1e-3*min(gethin$p[gethin$iso == c & gethin$disposable_inc >= 48e3], na.rm = T))))
# FR DE
# 31 40
1-mean(thousandile_world_disposable_inc < 63e3) # 4.9% at world level
(share_affected_tax_top5 <- round(sapply(countries, function(c) 100 - 1e-3*min(gethin$p[gethin$iso == c & gethin$disposable_inc >= 63e3], na.rm = T))))
# FR DE
# 13 27

# Contribution as country share of GDP
(gdp_received_tax_top8 <- sapply(countries, function(c) round(100*tax_cost(6300, gethin$disposable_inc[gethin$iso == c], gethin$weight[gethin$iso == c]), 2)))
round(100*gdp_contribution_tax_top8 - gdp_received_tax_top8, 1)
# FR   US 
# 4.7  17
(gdp_received_tax_top5 <- sapply(countries, function(c) round(100*tax_cost(6300, gethin$disposable_inc[gethin$iso == c], gethin$weight[gethin$iso == c]), 2)))
round(100*gdp_contribution_tax_top5 - gdp_received_tax_top5, 1)
# FR   US 
# 3.1  13