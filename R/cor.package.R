#' cor.package: A Package for Correlation Analysis
#'
#' This package provides functions to calculate correlation efficiently.
#' It includes tools for handling missing values, computing Pearson and Spearman correlations,
#' and visualizing correlation matrices.
#'
#' ## Main Functions
#' - `cor_function()`: Computes the correlation between two numeric vectors.
#' - `handle_na()`: Handles missing values in numeric datasets.
#'
#' ## Example
#' ```
#' library(cor.package)
#' x <- c(1, 2, 3, NA, 5)
#' y <- c(5, 4, NA, 2, 1)
#' handle_na(x, y, method = "omit")
#' cor_function(x, y)
#' ```
#'
#' @keywords internal
"_PACKAGE"
