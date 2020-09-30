run_pipeline <- function(param_set,
                         n_replicates = 1,
                         seed_start = 1) {

  load("data/param_space.rda")
  sim_pars <- param_space[param_set, ]

  iw_sims <- run_iw_sims(
    n_replicates = n_replicates,
    sim_pars = sim_pars,
    n_mainland_spec = 1000,
    seed_start = seed_start
  )

  iw_brts <- extract_first_lineage_brts(iw_sims)

  phylo <- DDD::brts2phylo(times = iw_brts)

  output <- list(iw_sims = iw_sims, iw_brts = iw_brts, phylo = phylo)

  # save_file


}

