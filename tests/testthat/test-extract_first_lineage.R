test_that("use", {

  sim_pars <- c(1, 1, 2, 3, 4, 5, 4)
  n_mainland_spec <- 1000
  set.seed(1)
  out <- run_iw_sims(
    sim_pars = sim_pars,
    n_mainland_spec = n_mainland_spec
  )

  brts_list <- extract_first_lineage_brts(out)

  expect_length(brts_list, 2)
  expect_equal(brts_list, c(4, 1.2478108191158299))
})
