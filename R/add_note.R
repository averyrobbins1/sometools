#' Quickly record a note for future reference
#'
#' @param note The actual note in quotes
#' @param name The name of the notes file that you want to create or add to.
#' Default is "general"
#' @param ext The file extension for the notes file. Default is "Rmd"
#'
#' @return Creates or adds to a file named \code{name} with contents
#'  \code{note}.
#' @export
#'
#' @examples
#' add_note("Remember to tweak the tuning grid for the random forest model",
#' name = "random-forest")
add_note <- function(note, name = "general", ext = "Rmd") {

  if (fs::dir_exists(here::here("notes"))) {
    print(glue::glue("Adding note to {name}!"))
  } else {
    fs::dir_create(here::here("notes"))
    print(glue::glue(
      "Creating 'notes' directory and adding your first note to {name}!")
    )
  }

  fancy_note <-
    glue::glue("----\n",
               "Recorded: {Sys.time()}\n\n",
               "Note: {stringr::str_wrap(note)}\n",
               "----\n\n"
    )

  readr::write_lines(fancy_note,
                     path =
                       here::here(glue::glue("notes/{name}.{ext}")),
                     append = TRUE)
}
