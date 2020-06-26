#' Provide a useful outline of a typical tidymodels workflow
#'
#'
#'
#' @return a character vector
#' @export
#'
#' @examples
outline_workflow <- function() {
  save(current_script())
  cat("tree_spec <- \ntree_rec <- \ntree_wf <- \n",
      file = current_script())
}
