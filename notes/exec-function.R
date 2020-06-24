library(dplyr)
library(purrr)

funs1 <- c(mean = mean, median = median)
args1 <- list(na.rm = TRUE, trim = .1)

mtcars %>%
  map_df(~ funs1 %>%
           map(exec, .x, !!!args1), .id = "var")


# ---------

dat <- mtcars %>% as_tibble()

funs <- c(glimpse = dplyr::glimpse, skim = skimr::skim)

exec(glimpse, dat)

# this!!!!

map(funs, exec, dat)

dat %>% skimr::skim()

c(glimpse, skimr::skim) %>%
  map(exec, dat)

map_dfr(dat, mean, .id = "var")

c(DataExplorer::profile_missing, skimr::skim) %>%
  map(exec, dat)
