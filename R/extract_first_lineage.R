#' Extract first lineagebranching times vector
#'
#' @inheritParams default_params_doc
#'
#' @return List with a level per replicate, each containing a numeric vector
#'   with branching times of first lineage of the simulation.
#'
#' @examples
#' out <- phylometricsims:::run_iw_sims(
#'   sim_pars = c(1, 1, 2, 3, 4, 5, 5),
#'   n_mainland_spec = 1000,
#'   n_replicates = 2,
#'   seed_start = 1
#' )
#'
#' brts_list <- phylometricsims:::extract_first_lineage_brts(out)
#'
#' @author Pedro Neves
extract_first_lineage_brts <- function(iw_sims) {

  first_lineage_brts <- list()

  for (i in seq_along(iw_sims)) {
    first_lineage_brts[[i]] <- iw_sims[[i]][[1]][[2]]$branching_times
  }
  first_lineage_brts
}
