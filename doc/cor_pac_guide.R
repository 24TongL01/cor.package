## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(cor.package)
if (!requireNamespace("bench", quietly = TRUE)) {
    stop("The 'bench' package is required for this vignette. Please install it with install.packages('bench').")
}
library(bench)

## ----example-code_1, echo = TRUE----------------------------------------------
# Example data
x = c(1, 2, 3, NA, 5)
y = c(2, 4, NA, 8, 10)

# Pearson correlation with mean imputation
cor_new(x, y, method = "pearson", na_handle = "mean")

# Spearman correlation with complete case handling
cor_new(x, y, method = "spearman", na_handle = "complete")

# Kendall correlation
cor_new(x, y, method = "kendall")

## ----example-code_2, echo = TRUE----------------------------------------------
# Example data
x = c(1, 2, 3, NA, 5)
y = c(2, 4, NA, 8, 10)

# Remove rows with missing values
handle_na(x, y, method = "complete")

# Impute missing values with the mean
handle_na(x, y, method = "mean")

## ----example-code_3, echo = TRUE----------------------------------------------
# Example: Compute correlation matrix for mtcars dataset
result = efficient_corr_matrix(mtcars[, 1:5], method = "pearson")

# Print the correlation matrix
result$matrix

# Visualize the correlation heatmap
result$plot

## ----example-code_4, echo = TRUE----------------------------------------------
# Correctness Comparison
# Example data
x = c(1, 2, 3, NA, 5)
y = c(2, 4, NA, 8, 10)

# Pearson correlation with mean imputation
custom_result = cor_new(x, y, method = "pearson", na_handle = "complete")
original_result = cor(x, y, method = "pearson", use = "complete.obs")
rcpp_result = cor_new_rcpp_wrapper(x, y, method = "pearson", na_handle = "complete")

# Check if the results are equal
all.equal(custom_result, original_result, rcpp_result)

## ----example-code_5, echo = TRUE----------------------------------------------
# Create a large random dataset for benchmarking
rm(list = ls())
set.seed(123)
x_large = rnorm(1e5)
y_large = rnorm(1e5)
# Benchmark the performance of both functions
benchmark_results = bench::mark(
  cor_new(x_large, y_large, method = "pearson", na_handle = "complete"),
  cor(x_large, y_large, method = "pearson", use = "complete.obs"),
  cor_new_rcpp_wrapper(x_large, y_large, method = "pearson", na_handle = "complete"),
  iterations = 5,
  check = FALSE  # Avoid checking for equality during benchmarking
)

# Print benchmarking results
benchmark_results

