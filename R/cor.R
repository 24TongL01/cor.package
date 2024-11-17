#' New Correlation Package
#'
#' This package implements custom correlation calculation functions to compare
#' against R's built-in cor function, with added flexibility and efficiency.



#' Correlation Calculation
#' Calculates correlation coefficients: Pearson, Spearman, or Kendall
#' @param x First numeric vector
#' @param y Second numeric vector
#' @param method Correlation method: "pearson", "spearman", "kendall"
#' @param na_handle Method of dealing with NA value: "Complete", "Mean"
#' @return Correlation coefficient
#' @examples
#' # Pearson correlation with mean imputation
#' x <- c(1, 2, 3, NA, 5)
#' y <- c(2, 4, NA, 8, 10)
#' cor_new(x, y, method = "pearson", na_handle = "mean")
#'
#' # Spearman correlation with complete case handling
#' cor_new(x, y, method = "spearman", na_handle = "complete")
#'
#' # Kendall correlation
#' cor_new(x, y, method = "kendall")
#' @export
cor_new = function(x, y, method = "pearson", na_handle = "mean") {
  # Ensure input is numeric and has same length
  if (!is.numeric(x) || !is.numeric(y)) stop("Inputs must be numeric")
  if (length(x) != length(y)) stop("Inputs must have the same length")

  # Handle na value
  na_result = handle_na(x, y, method = na_handle)
  x = na_result$x
  y = na_result$y

  # Calculate correlation based on method
  if (method == "pearson") {
    # Pearson correlation
    return(sum((x - mean(x)) * (y - mean(y))) /
             (sqrt(sum((x - mean(x))^2)) * sqrt(sum((y - mean(y))^2))))
  } else if (method == "spearman") {
    # Spearman correlation
    rank_x = rank(x)
    rank_y = rank(y)
    return(cor_new(rank_x, rank_y, method = "pearson"))
  } else if (method == "kendall") {
    # Kendall correlation
    concordant = 0
    discordant = 0
    n = length(x)
    for (i in 1:(n - 1)) {
      for (j in (i + 1):n) {
        concordant = concordant + sign(x[i] - x[j]) * sign(y[i] - y[j]) > 0
        discordant = discordant + sign(x[i] - x[j]) * sign(y[i] - y[j]) < 0
      }
    }
    return((concordant - discordant) / (0.5 * n * (n - 1)))
  } else {
    stop("Invalid method. Choose 'pearson', 'spearman', or 'kendall'")
  }
}
