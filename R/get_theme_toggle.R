#' Toggle between light and dark mode in RStudio
#'
#' \code{get_theme_toggle} writes some code to your global .Rprofile file so
#' that you can more easily set up the ability to toggle between light and
#' dark themes in RStudio.
#'
#' @return Updated global .Rprofile with code to help you toggle between
#' light and dark mode.
#' @export
#'
#' @examples
#' get_theme_toggle()
get_theme_toggle <- function() {

  `%>%` <- magrittr::`%>%`

  Rprofile <- readr::read_lines("~/.Rprofile") %>%
    stringr::str_flatten()

  if (stringr::str_detect(Rprofile, "rsthemes::set_theme_light")
    ) {
    cat("You only need to run `get_theme_toggle()` once.\nIt looks like you already have the needed code in your\nglobal .Rprofile file. You should be good.")
  } else {
  theme_code <-
"
.First <- function(){

  if (!require('pacman', quietly = TRUE)) install.packages('pacman')
  pacman::p_load_gh('gadenbuie/rsthemes')

  rsthemes::set_theme_light('Textmate (default)')
  rsthemes::set_theme_dark('Pastel On Dark')
}
"
  readr::write_lines(theme_code, "~/.Rprofile", append = TRUE)

  cat("Restart RStudio. Then go to Tools >> Modify Keyboard Shortcuts.\nIn the search bar (Filter...) type 'toggle dark mode'.\nNext, click inside the box under Shortcuts and supply a desired shortcut.\n`ctrl + shift + D` or `ctrl + alt + D` are both pretty easy to remember.\nClick apply and you can now toggle easily between light and dark mode!")
  }
}

