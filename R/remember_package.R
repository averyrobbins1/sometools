#' Keep a record of packages
#'
#' @param package_name The package that you want to remember surrounded
#'  in quotes.
#'
#' @return
#' @export
#'
#' @examples
#' remember_package("ggthemr")
remember_package <- function(package_name) {

  if (fs::file_exists(here::here("packages.R"))) {

    packages <- readr::read_lines(here::here("packages.R"))

    if (
      purrr::has_element(
        stringr::str_detect( packages, package_name ), TRUE
        )
      ) {

      print("Package already recorded!")

    } else {

      print("Updating 'packages.R' file!")
      readr::write_lines(package_name, here::here("packages.R"), append = TRUE)

    }

  } else {

    print("Created 'packages.R'!")

    fs::file_create(here::here("packages.R"))

    readr::write_lines(package_name, here::here("packages.R"), append = TRUE)

  }
}



