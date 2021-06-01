if (requireNamespace("lintr", quietly = TRUE)) {
  test_that("Package Style", {
    skip("Temp skip due to brts2phylo import")
    lintr::expect_lint_free()
  })
}
