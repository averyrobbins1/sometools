#' Provide a useful outline of a typical tidymodels workflow
#'
#' @param prefix a character vector
#'
#' @return a character vector
#' @export
#'
#' @examples
#' outline_workflow()
outline_workflow <- function(prefix = NULL) {

x <- glue::glue(
"
# split data & resample ---------------------------------------------------

set.seed(123)

dat_split <- initial_split(dat, prop = 3/4, strata = response)

dat_train <- training(dat_split)
dat_test <- testing(dat_split)

dat_train %>% prop(response)
dat_test %>% prop(response)

dat_cv <- vfold_cv(dat_train, v = 10, repeats = 5, strata = response)
# dat_boot <- bootstraps(dat_train, times = 25, strata = response)

# model spec --------------------------------------------------------------

# add model specification

{prefix}_mod <-
  # model_spec %>%
  set_engine('') %>%
  set_mode('')

# recipe ------------------------------------------------------------------

# add recipe steps

{prefix}_recipe <-
  recipe(response ~ ., data = dat_train)

# workflow ----------------------------------------------------------------

{prefix}_wf <-
  workflow() %>%
  add_model({prefix}_mod) %>%
  add_recipe({prefix}_recipe)

# create grid & tune hyperparameters --------------------------------------

set.seed(123)

{prefix}_grid <-
  grid_latin_hypercube(size = 3)

{prefix}_grid


# {prefix}_grid <-
#   grid_regular(levels = 3)
#
# {prefix}_grid

# regression metrics: metric_set(rmse, rsq, ccc)

{prefix}_res <-
  {prefix}_wf %>%
  tune_grid(
    resamples = dat_cv,
    grid = {prefix}_grid,
    control = control_grid(save_pred = TRUE),
    metrics = metric_set(roc_auc, accuracy, sens, spec)
  )

{prefix}_res %>% collect_metrics()


")

clipr::write_clip(x)

}




