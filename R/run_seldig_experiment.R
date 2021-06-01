#' Generate phylogenies for sELDIG study
#'
#' Run DAISIE IW simulations and save .tre files of the first lineage on the
#' island if the number of tips at the present exceeds 20. Save intermediate
#' output to /output folder, see Return section for details.
#'
#' @inheritParams default_params_doc
#'
#' @return
#' Saves output object to output and trees folder. Generate .tree file if >
#' 20 tips are created.
#' Output object is a list containing the following elements:
#' * DAISIE IW simulation objects
#' * Corresponding vector of branching times
#' * Corresponding branching times converted to phylo objects
#'
#' @importFrom utils setTxtProgressBar txtProgressBar
#' @seealso [run_pipeline()]
#'
#' @export
#' @author Pedro Neves
#'
#' @examples
#' \dontrun{
#' run_seldig_experiment(n_param_sets_to_run = 3000)
#' }
run_seldig_experiment <- function(n_param_sets_to_run) {

  pb <- txtProgressBar(min = 0, max = n_param_sets_to_run, style = 3)

  seed_time <- as.numeric(Sys.time())
  set.seed(
    seed_time,
    kind = "Mersenne-Twister",
    normal.kind = "Inversion",
    sample.kind = "Rejection"
  )

  for (i in seq_len(n_param_sets_to_run)) {
    run_pipeline(param_set = i)
    setTxtProgressBar(pb, i)
  }

}
