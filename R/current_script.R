#' Get the path to the current script
#'
#' @return a character vector
#' @export
#'
#' @examples
current_script <- function() {
  rstudioapi::getActiveDocumentContext()$path
}
