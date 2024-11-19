test_that("cor_new works correctly", {
  x = c(1, 2, 3, NA, 5)
  y = c(2, 4, NA, 8, 10)

  # test using pearson method
  expect_equal(round(cor_new(x, y, na_handle = "complete"), 2), 1)

  # test using spearman method，and handling NA value
  cor_new_ans = cor_new(x, y, method = "spearman", na_handle = "complete")
  cor_ans = cor(x, y, method = "spearman", use = "complete.obs")
  expect_equal(round(cor_new_ans, 1), round(cor_ans, 1))

  # test using kendall method
  expect_silent(cor_new(x, y, method = "kendall"))
})


test_that("cor_new_rcpp computes Pearson correlation with complete case handling", {
  # Input vectors
  x = c(1, 2, 3, NA, 5)
  y = c(2, 4, NA, 8, 10)

  # Directly call the Rcpp function
  result = cor_new_rcpp(x, y, method = "pearson", na_handle = "complete")

  # Expected result using base R cor function
  expected = cor(c(1, 2, 5), c(2, 4, 10), method = "pearson")

  # Verify the result matches the expected value
  expect_equal(result, expected)
})


