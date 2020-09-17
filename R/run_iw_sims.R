#' Run DAISIE IW simulations
#'
#' @inheritParams default_params_doc
#'
#' @return DAISIE object containing IW simulations.
#' @export
#'
#' @author Pedro Neves
run_iw_sims <- function(totaltime, sim_pars, n_mainland_spec, replicates) {
  sim_output <- DAISIE::DAISIE_sim_constant_rate(
    time = totaltime,
    M = n_mainland_spec,
    pars = sim_pars,
    replicates = replicates,
    divdepmodel = "IW",
    plot_sims = FALSE,
    verbose = FALSE
  )
  return(sim_output)
}
