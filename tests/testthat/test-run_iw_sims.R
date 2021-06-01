test_that("use", {

  sim_pars <- c(1, 1, 1, 20, 0.01, 1, 1)
  n_mainland_spec <- 1000
  set.seed(1)
  expect_silent(
    out <- phylometricsims:::run_iw_sims(
      sim_pars = sim_pars,
      n_mainland_spec = n_mainland_spec
    )
  )
  # Ran once to generate reference file
  # saveRDS(out, file = "tests/reference_files/simple_iw_sim.rds") #nolint
  expect_known_value(
    object = out,
    file = "../reference_files/simple_iw_sim.rds",
    update = FALSE
  )


  expect_length(out, 1)
  expect_length(out[[1]], 7)
  expect_length(out[[1]][[1]], 4)
  expect_equal(out[[1]][[1]]$island_age, 1)
  expect_equal(out[[1]][[1]]$not_present, 994)
  expect_equal(nrow(out[[1]][[1]]$brts_table), 9)

})

test_that("abuse", {
  expect_error(run_iw_sims("123"))
})
