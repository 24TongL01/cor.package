

# cor.package

<!-- badges: start -->

<!-- badges: end -->

**cor.package** is an R package designed for efficiently calculating correlation coefficients and correlation matrices, as well as visualizing the results. It implements custom correlation calculation functions to compare
against R's built-in cor function, with added flexibility(added process of handling NA value and choices of calculating difference types of correlation coefficients) and efficiency(through Rcpp).

## Function

- **cor_new**: Computes three types of correlation coefficients: Pearson, Spearman, and Kendall which are at vector levels.
- **cor_new_rcpp_wrapper**: Computes three types of correlation coefficients under the frame of C++.
- **handle_na**: Provides flexible missing value handling methods, including mean imputation and complete case analysis.
- **efficient_corr_matrix**: Generates high-dimensional correlation coefficients matrices and heatmaps for visualization - at higher dimensional level.


## Installation

You can install the development version of **cor.package** from [GitHub](https://github.com/24TongL01/cor_package) with:

``` r
# install.packages("pak")
pak::pak("24TongL01/cor_package")
```
## Example

``` r
library(cor.package)
x = c(1, 2, 3, NA, 5)
y = c(2, 4, NA, 8, 10)

# Calculate Pearson correlation coefficient
cor_new(x, y, method = "pearson", na_handle = "mean")

# Generate correlation matrix and heatmap
data = mtcars[, 1:5]
result = efficient_corr_matrix(data, method = "spearman")
print(result$plot)

```
