#include <Rcpp.h>
#include <algorithm>
#include <cmath>
#include <vector>
using namespace Rcpp;

// [[Rcpp::export]]
List handle_na_rcpp(NumericVector x, NumericVector y, std::string method) {
  if (method == "complete") {
    // Remove pairs with NA
    LogicalVector complete_cases = (!is_na(x) & !is_na(y));
    x = x[complete_cases];
    y = y[complete_cases];
  }
  return List::create(Named("x") = x, Named("y") = y);
}

// Helper function to calculate Pearson correlation
double pearson_corr(NumericVector x, NumericVector y) {
  int n = x.size();
  double sum_x = 0, sum_y = 0, sum_xy = 0, sum_x2 = 0, sum_y2 = 0;

  for (int i = 0; i < n; ++i) {
    double xi = x[i];
    double yi = y[i];
    sum_x += xi;
    sum_y += yi;
    sum_xy += xi * yi;
    sum_x2 += xi * xi;
    sum_y2 += yi * yi;
  }

  double mean_x = sum_x / n;
  double mean_y = sum_y / n;
  return (sum_xy - n * mean_x * mean_y) /
    std::sqrt((sum_x2 - n * mean_x * mean_x) * (sum_y2 - n * mean_y * mean_y));
}



// [[Rcpp::export]]
double cor_new_rcpp(NumericVector x, NumericVector y, std::string method = "pearson", std::string na_handle = "complete") {
  // Ensure input vectors have the same length
  //if (x.size() != y.size()) {
  //  stop("Input vectors must have the same length.");
  //}

  // Handle NA values
  List handled_data = handle_na_rcpp(x, y, na_handle);
  x = handled_data["x"];
  y = handled_data["y"];

  // Calculate correlation based on the chosen method
  if (method == "pearson") {
    return pearson_corr(x, y);
  }
  //return 0;
}
