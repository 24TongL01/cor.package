#' Efficient Correlation Matrix Calculation
#' Computes correlation matrix for multiple columns efficiently
#' @param data Data frame or matrix
#' @param method Correlation method
#' @import ggplot2
#' @import reshape2
#' @return A list containing:
#' \itemize{
#'   \item \code{matrix}: A numeric matrix representing the correlations.
#'   \item \code{plot}: A ggplot2 object visualizing the correlation heatmap.
#' }
#' @export
efficient_corr_matrix = function(data, method = "pearson") {
  n = ncol(data)
  corr_matrix = matrix(NA, n, n)
  colnames(corr_matrix) = colnames(data)
  rownames(corr_matrix) = colnames(data)

  for (i in 1:(n - 1)) {
    for (j in (i + 1):n) {
      corr_matrix[i, j] = cor_new(data[[i]], data[[j]], method)
      corr_matrix[j, i] = corr_matrix[i, j]  # Symmetric
    }
  }
  diag(corr_matrix) = 1

  corr_matrix_melted = reshape2::melt(corr_matrix)

  # draw heatplot
  plot = ggplot2::ggplot(data = corr_matrix_melted, ggplot2::aes(x = Var1, y = Var2, fill = value)) +
    ggplot2::geom_tile(color = "white") +
    ggplot2::scale_fill_gradient2(low = "blue", high = "red", mid = "white",
                                  midpoint = 0, limit = c(-1, 1), space = "Lab",
                                  name = "Correlation") +
    ggplot2::theme_minimal() +
    ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 45, vjust = 1, hjust = 1)) +
    ggplot2::labs(x = "Variable 1", y = "Variable 2") +
    ggplot2::coord_fixed()

  return(list(matrix = corr_matrix, plot = plot))
}
