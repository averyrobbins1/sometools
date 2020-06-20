#' Source helper functions
#'
#' Quickly source all of the files in a directory called 'helpers'. The
#' 'helpers' directory should be a top level directory inside the project
#' directory.
#'
#'
#' @return
#' @export
#'
#' @examples
#' source_helpers()
source_helpers <- function() {
  walk(
    fs::dir_ls(
      here::here("helpers")
      ), source
    )
}
