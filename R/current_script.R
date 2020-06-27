#' Get the path to the current script
#'
#' @return a character vector
#' @export
#'
#' @examples
#' \dontrun{
#' current_script()
#' }
current_script <- function() {
  rstudioapi::getActiveDocumentContext()$path
}
