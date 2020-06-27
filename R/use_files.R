#' Functions to create or open specific files
#'
#' Create a new or open an existing script in one of three directories:
#' models, scripts, or eda.
#'
#' @name use_files
#'
#' @param script_name a character vector
#' @param author a character vector
#'
#' @return a .R file in a specified directory
#'
#'
#'
#' @examples
#' use_model("01_random-forest")
#' use_script("monthly-project")
#' use_eda("explore-canvas")
NULL


#' @describeIn use_files Create a script for modeling
#' @export
use_model <- function(script_name, author = "Avery Robbins") {

  if (!fs::dir_exists("models")) {
    fs::dir_create("models")
  }

  if (fs::file_exists(glue::glue("models/{script_name}.R"))) {
    fs::file_show(glue::glue("models/{script_name}.R"))
  } else {
    header <- glue::glue(
      "
# header start ------------------------------------------------------------
#
# script name: {script_name}.R
#
# script purpose:
#
# author: {author}
#
# date created: {Sys.Date()}
#
# notes:
#
# https://www.tidymodels.org/
#
#
#
# header end --------------------------------------------------------------


# packages ----------------------------------------------------------------

pacman::p_load(tidyverse, tidymodels, vip, tictoc)
pacman::p_load_gh('averyrobbins1/sometools')

# set seed ----------------------------------------------------------------

set.seed(123)

# read data ---------------------------------------------------------------

dat <- read_csv('')

dat %>% glimpse()


# split data & resample ---------------------------------------------------


# model spec --------------------------------------------------------------


# recipe ------------------------------------------------------------------


# workflow ----------------------------------------------------------------


# create grid & tune hyperparameters --------------------------------------


"
    )
    readr::write_lines(header, glue::glue("models/{script_name}.R"))
    fs::file_show(glue::glue("models/{script_name}.R"))
  }
}

#' @describeIn use_files Create a new or open an existing script for
#'  data processing
#' @export
use_script <- function(script_name, author = "Avery Robbins") {

  if (!fs::dir_exists("scripts")) {
    fs::dir_create("scripts")
  }

  if (fs::file_exists(glue::glue("scripts/{script_name}.R"))) {
    fs::file_show(glue::glue("scripts/{script_name}.R"))
  } else {
    header <- glue::glue(
      "
# header start ------------------------------------------------------------
#
# script name: {script_name}.R
#
# script purpose:
#
# author: {author}
#
# date created: {Sys.Date()}
#
# notes:
#
#
#
#
#
# header end --------------------------------------------------------------


# packages ----------------------------------------------------------------

pacman::p_load(tidyverse, janitor)
pacman::p_load_gh('averyrobbins1/sometools')

# read data ---------------------------------------------------------------

dat <- read_csv('')

dat %>% glimpse()
"
    )
    readr::write_lines(header, glue::glue("scripts/{script_name}.R"))
    fs::file_show(glue::glue("scripts/{script_name}.R"))
  }
}


#' @describeIn use_files Create a new or open an existing script for eda
#' @export
use_eda <- function(script_name, author = "Avery Robbins") {

  if (!fs::dir_exists("eda")) {
    fs::dir_create("eda")
  }

  if (fs::file_exists(glue::glue("eda/{script_name}.R"))) {
    fs::file_show(glue::glue("eda/{script_name}.R"))
  } else {
    header <- glue::glue(
      "
# header start ------------------------------------------------------------
#
# script name: {script_name}.R
#
# script purpose:
#
# author: {author}
#
# date created: {Sys.Date()}
#
# notes:
#
#
#
#
#
# header end --------------------------------------------------------------


# packages ----------------------------------------------------------------

pacman::p_load(tidyverse, DataExplorer)
pacman::p_load_gh('averyrobbins1/sometools', 'ropensci/skimr')

# read data ---------------------------------------------------------------

dat <- read_csv('')

dat %>% glimpse()
dat %>% skim()
dat %>% plot_bar()
dat %>% plot_histogram()
"
    )
    readr::write_lines(header, glue::glue("eda/{script_name}.R"))
    fs::file_show(glue::glue("eda/{script_name}.R"))
  }
}
