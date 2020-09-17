test_that("use", {

  totaltime <- 1
  sim_pars <- c(1, 1, 20, 0.01, 1)
  n_mainland_spec <- 1000
  replicates <- 2

  set.seed(
    1,
    kind = "Mersenne-Twister",
    normal.kind = "Inversion",
    sample.kind = "Rejection"
  )

  expect_silent(
    out <- run_iw_sims(
      totaltime = totaltime,
      sim_pars = sim_pars,
      n_mainland_spec = n_mainland_spec,
      replicates = replicates
    )
  )
  # Ran once to generate reference file
  # saveRDS(out, file = "tests/reference_objects/simple_iw_sim.rds") #nolint
  expect_known_value(
    object = out,
    file = "../reference_files/simple_iw_sim.rds",
    update = FALSE
  )


  expect_length(out, 2)
  expect_length(out[[1]], 7)
  expect_length(out[[1]][[1]], 4)
  expect_equal(out[[1]][[1]]$island_age, totaltime)
  expect_equal(out[[1]][[1]]$not_present, 994)
  expect_equal(nrow(out[[1]][[1]]$brts_table), 9)


  expect_length(out[[2]], 10)
  expect_length(out[[2]], 10)
  expect_length(out[[2]][[1]], 4)
  expect_equal(out[[2]][[1]]$island_age, totaltime)
  expect_equal(out[[2]][[1]]$not_present, 991)
  expect_equal(nrow(out[[2]][[1]]$brts_table), 10)
})

test_that("abuse", {
  expect_error(run_iw_sims("123"))
})
