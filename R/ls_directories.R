#' Simple functions to list the contents of a specified directory
#'
#' Create a new or open an existing script in one of three directories:
#' models, scripts, or eda.
#'
#' @name ls_directories
#'
#' @return a character vector of files
#'
#'
#'
#' @examples
#' ls_models()
#' ls_scripts()
#' ls_eda
NULL

#' @describeIn ls_directories List all of the scripts in the models directory
#' @export
ls_models <- function(){
  fs::dir_ls("models")
}

#' @describeIn ls_directories List all of the scripts in the scripts directory
#' @export
ls_scripts <- function(){
  fs::dir_ls("scripts")
}

#' @describeIn ls_directories List all of the scripts in the eda directory
#' @export
ls_eda <- function(){
  fs::dir_ls("eda")
}

#' @describeIn ls_directories List all of the scripts in the data-derived
#' directory
#' @export
ls_data_derived <- function(){
  fs::dir_ls("data-derived")
}

#' @describeIn ls_directories List all of the scripts in the data-raw directory
#' @export
ls_data_raw <- function(){
  fs::dir_ls("data-raw")
}

#' @describeIn ls_directories List all of the scripts in the helpers directory
#' @export
ls_helpers <- function(){
  fs::dir_ls("helpers")
}


