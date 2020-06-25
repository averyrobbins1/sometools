#' Create a new script in eda
#'
#' @param script_name a character vector
#' @param author a character vector
#'
#' @return a new script in eda
#' @export
#'
#' @examples
#' use_eda("01_initial_look")
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
