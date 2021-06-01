test_that("run_pipeline reference test", {

  set.seed(1)
  out <- run_pipeline(
    param_set = 1,
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
  expect_length(out$iw_brts, 2)
  expect_length(out$phylo, 4)
  expect_true(ape::is.rooted.phylo(out$phylo))
})
