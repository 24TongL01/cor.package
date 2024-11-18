// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

#ifdef RCPP_USE_GLOBAL_ROSTREAM
Rcpp::Rostream<true>&  Rcpp::Rcout = Rcpp::Rcpp_cout_get();
Rcpp::Rostream<false>& Rcpp::Rcerr = Rcpp::Rcpp_cerr_get();
#endif

// handle_na
List handle_na(NumericVector x, NumericVector y, std::string method);
RcppExport SEXP _cor_package_handle_na(SEXP xSEXP, SEXP ySEXP, SEXP methodSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericVector >::type x(xSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type y(ySEXP);
    Rcpp::traits::input_parameter< std::string >::type method(methodSEXP);
    rcpp_result_gen = Rcpp::wrap(handle_na(x, y, method));
    return rcpp_result_gen;
END_RCPP
}
// cor_new_rcpp
double cor_new_rcpp(NumericVector x, NumericVector y, std::string method, std::string na_handle);
RcppExport SEXP _cor_package_cor_new_rcpp(SEXP xSEXP, SEXP ySEXP, SEXP methodSEXP, SEXP na_handleSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericVector >::type x(xSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type y(ySEXP);
    Rcpp::traits::input_parameter< std::string >::type method(methodSEXP);
    Rcpp::traits::input_parameter< std::string >::type na_handle(na_handleSEXP);
    rcpp_result_gen = Rcpp::wrap(cor_new_rcpp(x, y, method, na_handle));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_cor_package_handle_na", (DL_FUNC) &_cor_package_handle_na, 3},
    {"_cor_package_cor_new_rcpp", (DL_FUNC) &_cor_package_cor_new_rcpp, 4},
    {NULL, NULL, 0}
};

RcppExport void R_init_cor_package(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}