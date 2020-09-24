test_that("use", {

  totaltime <- 4
  sim_pars <- c(1, 2, 3, 4, 5)
  n_mainland_spec <- 1000
  n_replicates <- 2
  seed_start <- 1

  out <- phylometricsims:::run_iw_sims(
    totaltime = totaltime,
    sim_pars = sim_pars,
    n_mainland_spec = n_mainland_spec,
    n_replicates = n_replicates,
    seed_start = seed_start
  )

  brts_list <- phylometricsims:::extract_first_lineage_brts(out)


  expect_length(brts_list, n_replicates)
  expect_equal(brts_list[[1]], c(4, 1.2478108191158299))
  expect_equal(brts_list[[2]], c(4, 0.2611766125835))

})
