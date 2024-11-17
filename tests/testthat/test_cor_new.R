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


