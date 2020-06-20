#' Create custom directories easily
#'
#' Create whatever directories you want.
#'
#' @param ... Names of directories you want to create in quotes.
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
