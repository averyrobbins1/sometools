#' Print every row of data
#'
#' Quickly print every row of your data.
#'
#' @param data Tibble, data.frame, etc. that you want to print.
#'
#' @return A dataset with all of the rows printed to screen.
#' @export
#'
#' @examples
#' mtcars %>% dplyr::count(wt) %>% print_all(.)
print_all <- function(data) {
  print(n = dplyr::nrow(data))
}

