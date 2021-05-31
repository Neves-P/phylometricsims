test_that("run_pipeline reference test", {


  out <- run_pipeline(
    param_set = 1,
    n_replicates = 1,
    seed_start = 1,
    save_to_file = FALSE
  )


  # Ran once to generate reference file
  # saveRDS(out, file = "tests/reference_files/simple_pipeline_run.rds") #nolint
  expect_known_value(
    object = out,
    file = "../reference_files/simple_pipeline_run.rds",
    update = FALSE
  )


  expect_length(out, 3)
  expect_length(out$iw_brts[[1]], 2)
  expect_length(out$phylo[[1]], 4)

})
