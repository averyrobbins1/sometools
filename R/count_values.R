#' Count values in multiple columns
#'
#' @param data A data.frame or tibble
#' @param ... Columns that you want to count the values of
#'
#' @return
#' @export
#'
#' @examples
#' count_values(mtcars, carb, vs, am)
count_values <- function(data, ...) {

  `%>%` <- magrittr::`%>%`


    dplyr::select(data, ...) %>%
      dplyr::mutate(dplyr::across(dplyr::everything(), as.character)) %>%
      purrr::map_dfr(
        ~ dplyr::count(
          tibble::tibble(value = .x), value, sort = TRUE
          ), .id = "variable"
        )
}
