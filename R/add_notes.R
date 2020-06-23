#' Quickly record many notes from current R script (not working)
#'
#' \code{add_notes} reads the current active script and looks for special
#' comment markers #!# and records everything between those markers.
#'
#' @return Notes in the specified location.
#' @export
#'
#' @examples
#' add_notes()
add_notes <- function() {

  `%>%` <- magrittr::`%>%`

  # identify the current script
  current_script <- function() {
    rstudioapi::getActiveDocumentContext()$path
  }

  current <- current_script()

  print(paste(current))

  # save current script
  rstudioapi::documentSave(rstudioapi::getActiveDocumentContext()$id)


  current_script_text <- readr::read_lines(current) %>%
    stringr::str_flatten(collapse = " ")

  special_comment_blocks <-
    stringr::str_extract_all(
      current_script_text,
      pattern = "(#!#)(.*)(#!#)"
      )

  return(special_comment_blocks)
}

# idea:
# read a script search for special comments that start and end with #!#
# identify what script it comes from
# add to notes/ directory
# have the name be notes_<name-of-r-script>
# record the date and possibly the time

# figuring out the regex still





