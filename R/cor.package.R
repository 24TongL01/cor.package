#' cor.package: A Package for Correlation Analysis
#'
#' @description
#' The cor.package provides efficient and flexible tools for:
#'
#' - Calculating correlation coefficients using customizable methods (cor_new).
#'
#' - Handling missing values in datasets (handle_na).
#'
#' - Computing and visualizing correlation matrices for high-dimensional data (efficient_corr_matrix).
#'
#' - Calculating correlation coefficients more efficiently using Rcpp (cor_new_rcpp_wrapper).
#'
#'
#' ## Main Functions
#' - `cor_new()`: Computes the correlation between two numeric vectors.
#'
#' - `handle_na()`: Handles missing values in numeric datasets.
#'
#' - `efficient_corr_matrix()`: Computes the correlation at the high dimensional level.
#'
#' - `cor_new_rcpp_wrapper()`: Realizing cor_new() using C++.
#'
#' @examples
#' library(cor.package)
#' x = c(1, 2, 3, NA, 5)
#' y = c(2, 4, NA, 8, 10)
#' #Pearson correlation with mean imputation
#' cor_new(x, y, method = "pearson", na_handle = "mean")
#' #Spearman correlation with complete case handling
#' cor_new(x, y, method = "spearman", na_handle = "complete")
#' #Kendall correlation
#' cor_new(x, y, method = "kendall")
#'
#'
#' @keywords internal
"_PACKAGE"
