#' Create a new script in models
#'
#' @param script_name a character vector
#' @param author a character vector
#'
#' @return a new script in models
#' @export
#'
#' @examples
#' use_model("01_random_forest")
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
#
#
#
#
# header end --------------------------------------------------------------


# packages ----------------------------------------------------------------

pacman::p_load(tidyverse, tidymodels)
pacman::p_load_gh('averyrobbins1/sometools')

# read data ---------------------------------------------------------------

dat <- read_csv('')

dat %>% glimpse()
"
    )
    readr::write_lines(header, glue::glue("models/{script_name}.R"))
    fs::file_show(glue::glue("models/{script_name}.R"))
  }
}
