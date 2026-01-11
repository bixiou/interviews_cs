library(tidyverse)
library(writexl)
library(ARTofR)


It_contact <- read_delim("IT_id.csv", delim = ";",
                         escape_double = FALSE, trim_ws = TRUE)

#simplify education

It_contact <- It_contact %>%
  mutate(Tertiary_edu = case_when(
    education_factor == "Below upper secondary" | education_factor == "Upper secondary" ~ "Non Tertiary",
    education_factor == "Above upper secondary" ~ "Tertiary",
    TRUE ~ NA_character_
  ))

#Simplify vote

It_contact <- It_contact %>%
  mutate(vote_simple = case_when(
    vote_factor == "Center-right or Right" | vote_factor == "Far right" ~ "Right",
    vote_factor == "Left" ~ "Left",
    vote_factor == "Non-voter, PNR or Other" ~ "Other",
    TRUE ~ NA_character_
  ))

#Cross-tabs and number of people per subgroup

email_crosstab_text_gcs_edu_vote <- It_contact %>%
  group_by(gcs_support, Tertiary_edu, vote_simple, voted) %>%
  summarise(
    emails = paste(interview, collapse = "; "),
    n = n(),
    .groups = "drop"
  )


##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##  ~ Email batches based on groups  ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

emails_long <- email_crosstab_text_gcs_edu_vote %>%
  separate_rows(emails, sep = ";\\s*")

emails_long <- emails_long %>%
  group_by(gcs_support, Tertiary_edu, vote_simple, voted) %>%
  slice_sample(prop = 1) %>%   
  ungroup()

#10 x group
emails_batched <- emails_long %>%
  mutate(
    email_id = row_number(),
    batch = ceiling(email_id / 10)
  )

#random shuffle
emails_batched <- emails_batched %>%
  mutate(batch = sample(batch))

#email batches gruped
email_batches <- emails_batched %>%
  group_by(batch) %>%
  summarise(
    emails = paste(emails, collapse = "; "),
    n = n(),
    .groups = "drop"
  )
