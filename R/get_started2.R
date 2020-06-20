#' Create custom directories easily
#'
#' Create whatever directories you want. Type in the directory names in quotes
#' separated by commas.
#'
#' @param ... dots
#'
#' @return
#' @export
#'
#' @examples
#' get_started2("data", "reports", "analysis")
get_started2 <- function(...) {
  dirs <- list(...)
  purrr::walk(dirs, fs::dir_create)
}
