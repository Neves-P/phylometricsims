test_that("function is stub", {
  expect_null(run_sims())
})

test_that("function is stub, has nor args", {
  expect_error(run_sims("123"))
})
