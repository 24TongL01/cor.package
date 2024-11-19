

# cor.package

<!-- badges: start -->

[![R-CMD-check](https://github.com/24TongL01/cor_package/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/24TongL01/cor_package/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

**cor.package** is an R package designed for efficiently calculating correlation coefficients and correlation matrices, as well as visualizing the results. It implements custom correlation calculation functions to compare
against R's built-in cor function, with added flexibility(added process of handling NA values and choices of calculating different types of correlation coefficients) and efficiency(through Rcpp).

- **Improvements compared to in-built cor function**: The cor_new function enhances the original cor function by introducing flexible options for handling missing values (NA) with different approaches. Additionally, for high-dimensional calculations, I incorporated a visualization process in the efficient_corr_matrix function, making it easier to interpret results in complex scenarios. Furthermore, I implemented a C++ function using Rcpp to compare the speed differences between function written in R and C++.

## Key Features
- **Flexible missing value handling**: Easily handle NA values with mean imputation or complete case analysis.
- **Custom correlation calculation**: Calculate Pearson, Spearman, and Kendall coefficients with optimized algorithms.
- **High-dimensional support**: Compute and visualize correlation matrices for high-dimensional datasets with heatmaps.
- **Improved performance**: Leverage C++ for faster computation with the `cor_new_rcpp_wrapper` function.

## Function
- **cor_new**: Computes three types of correlation coefficients: Pearson, Spearman, and Kendall which are at vector levels.
- **cor_new_rcpp_wrapper**: Computes three types of correlation coefficients under the frame of C++.
- **handle_na**: Provides flexible missing value handling methods, including mean imputation and complete case analysis.
- **efficient_corr_matrix**: Generates high-dimensional correlation coefficients matrices and heatmaps for visualization - at higher dimensional level.


## Installation

You can install the development version of **cor.package** from [GitHub](https://github.com/24TongL01/cor_package) with:

``` r
# install.packages("pak")
install.packages("devtools")
devtools::install_github("24TongL01/cor.package")
```

## Dataset
The dataset used in example is in-built cars dataset in R.


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
## Documentation

For detailed documentation and vignettes, check the official GitHub page.

## License

This project is licensed under the [GNU General Public License Version 3 (GPL-3.0)](LICENSE).

By using, modifying, or distributing this software, you agree to the terms and conditions of the GPL-3.0. For more details, see the [full license text](https://www.gnu.org/licenses/gpl-3.0.html).


## Issues and Contributions
If you encounter any issues or have suggestions for improvement, please open an issue on GitHub. Contributions are welcome!
