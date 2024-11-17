test_that("efficient_corr_matrix returns correct structure", {
  data = mtcars[, 1:5]
  result = efficient_corr_matrix(data)

  # test whether the type of outcome is matrix
  expect_true(is.matrix(result$matrix))

  # test whether the type of outcome is ggplot
  expect_s3_class(result$plot, "ggplot")

  # test whether the dimension of the outcome matrix is correct or not
  expect_equal(dim(result$matrix), c(5, 5))
})
