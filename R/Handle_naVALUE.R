#' Handle Missing Values
#' Fills or removes missing values based on user input
#' @param x First numeric vector
#' @param y Second numeric vector
#' @param method Missing value handling method: "complete", "mean"
#' @return List of processed vectors
#' @examples
#' # Remove rows with missing values
#' x <- c(1, 2, 3, NA, 5)
#' y <- c(2, 4, NA, 8, 10)
#' handle_na(x, y, method = "complete")
#'
#' # Impute missing values with mean
#' handle_na(x, y, method = "mean")
#' @export
handle_na = function(x, y, method = "mean") {
  if (method == "complete") {
    # Remove NA pairs
    complete_cases <- complete.cases(x, y)
    list(x = x[complete_cases], y = y[complete_cases])
  } else if (method == "mean") {
    # Replace NAs with column mean
    x[is.na(x)] = mean(x, na.rm = TRUE)
    y[is.na(y)] = mean(y, na.rm = TRUE)
    list(x = x, y = y)
  } else {
    stop("Invalid NA handling method. Choose 'complete' or 'mean'")
  }
}
