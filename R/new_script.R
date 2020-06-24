#' Create a new script in scripts
#'
#' @param script_name a character vector
#' @param author a character vector
#'
#' @return a new script in scripts
#' @export
#'
#' @examples
#' new_script("01_student-total")
new_script <- function(script_name, author = "Avery Robbins") {

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




