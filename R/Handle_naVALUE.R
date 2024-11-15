#' Handle Missing Values
#' Fills or removes missing values based on user input
#' @param x First numeric vector
#' @param y Second numeric vector
#' @param method Missing value handling method: "complete", "mean"
#' @return List of processed vectors
handle_na <- function(x, y, method = "mean") {
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
