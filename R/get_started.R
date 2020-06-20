#' Create frequently used directories
#'
#' Use this function when starting a new project to help keep code and files
#' organized. Following a project-oriented workflow, the working directory
#' should be set as the project directory.
#'
#' get_started creates the following files: data-raw, data-derived, eda, scripts, #' models,  & helpers. See \code{\link{get_started2}} for greater customization #' options.
#'
#' @return
#' @export
#'
#' @examples
#' get_started()
get_started <- function() {
  dirs<- list("data-raw", "data-derived", "eda", "scripts", "models", "helpers")
  purrr::walk(dirs, fs::dir_create)
}
