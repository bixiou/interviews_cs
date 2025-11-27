##### Generate email list #####
names_US <- read.xlsx("../data_ext/common_names.xlsx", sheet = "names_US")
surnames_US <- read.xlsx("../data_ext/common_names.xlsx", sheet = "surnames_US")
domains <- read.xlsx("../data_ext/common_names.xlsx", sheet = "domains")
emails_US <- names_US %>% rename(fname = name, fn = n) %>% inner_join(surnames_US[,1:2] %>% rename(lname = surname, sn = n), by = character()) %>%
  inner_join(domains[domains$country %in% c("all", "US"),] %>% rename(dn = n), by = character()) %>%
  mutate(email = paste0(tolower(name), ".", tolower(surname), "@", domain), freq = n.x * n.y * n/270e6) %>% arrange(desc(freq)) %>% dplyr::select(email, freq)
emails_US$freq <- round(emails_US$freq)
write.csv(emails_US[1:1e5,], "../data_ext/common_emails_US.csv", quote = F, row.names = F) 
# freq is the expected number of such combinations in the U.S. adult population (divided by the market share of the domain, it gives the expected number of Surname Name in the adult pop)
# When >2% of emails hard bounce (email doesn't exist), reputation is lowered, more emails placed as spam, eventually IP or sender is blocked. Plus, there are spam-traps: one hit and user is blocked.
# Using kickbox.com, turns out 42% of emails around rank 100k (freq=81) are invalid; 43% at 30k (200); 20% around 10k (404); 23% at 2k (947).
# It costs $60 to verify existence of 10k emails, $400 for 100k, $2000 for 1M. This doesn't address the spam-trap issue.
# A 1 min survey costs 0.25€/resp on prolific. A 3-5 min survey costs €2.6/resp. with i.hempel@bilendi.com 
# B2C providers charge ~$0.2/contact and about 1% of those contacted accept the interview (provided it's paid) BUT bounce rate can be high.
# B2C providers: Experian Marketing Services, Acxiom, InfoUSA, bookyourdata, activecampaign.com, infoglobaldata.com
# DataToLeads charge $.001/contact, then we need verification cost, then Mailchimp costs ~.01/mail.