#' Run DAISIE IW simulations
#'
#' @inheritParams default_params_doc
#'
#' @return DAISIE object containing IW simulations.
#'
#'@examples
#' out <- phylometricsims:::run_iw_sims(
#'   sim_pars = c(1, 1, 2, 3, 4, 5, 5),
#'   n_mainland_spec = 1000,
#'   n_replicates = 2,
#'   seed_start = 1
#' )
#'
#' @author Pedro Neves
run_iw_sims <- function(sim_pars,
                        n_mainland_spec,
                        n_replicates,
                        seed_start) {

  sim_output <- list()
  seeds <- seed_start:n_replicates

  totaltime <- as.numeric(sim_pars[7])
  pars <- as.numeric(sim_pars[2:6])

  for (i in seq_len(n_replicates)) {

    set.seed(
      seeds[i],
      kind = "Mersenne-Twister",
      normal.kind = "Inversion",
      sample.kind = "Rejection"
    )

    sim_output[[i]] <- DAISIE::DAISIE_sim_constant_rate(
      time = totaltime,
      M = n_mainland_spec,
      pars = pars,
      replicates = 1,
      divdepmodel = "IW",
      plot_sims = FALSE,
      verbose = FALSE
    )
  }

  return(sim_output)
}
