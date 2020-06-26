#' Quickly calculate the proportion of values in a column
#'
#' @param data a tibble or data.frame
#' @param column a column to be counted
#' @param na.rm a logical to remove NAs or not
#'
#' @return a tibble
#' @export
#'
#' @examples
#' prop(mtcars, am)
prop <- function(data, column, na.rm = TRUE) {

  `%>%` <- magrittr::`%>%`

  data %>%
    dplyr::count( {{ column }} ) %>%
    dplyr::mutate(prop = n/sum(n, na.rm = na.rm)) %>%
    as_tibble()
}
