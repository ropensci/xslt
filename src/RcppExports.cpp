// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include "xslt_types.h"
#include <Rcpp.h>

using namespace Rcpp;

#ifdef RCPP_USE_GLOBAL_ROSTREAM
Rcpp::Rostream<true>&  Rcpp::Rcout = Rcpp::Rcpp_cout_get();
Rcpp::Rostream<false>& Rcpp::Rcerr = Rcpp::Rcpp_cerr_get();
#endif

// doc_xslt_apply
SEXP doc_xslt_apply(XPtrDoc doc, XPtrDoc xslt, std::vector<std::string> params);
RcppExport SEXP _xslt_doc_xslt_apply(SEXP docSEXP, SEXP xsltSEXP, SEXP paramsSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< XPtrDoc >::type doc(docSEXP);
    Rcpp::traits::input_parameter< XPtrDoc >::type xslt(xsltSEXP);
    Rcpp::traits::input_parameter< std::vector<std::string> >::type params(paramsSEXP);
    rcpp_result_gen = Rcpp::wrap(doc_xslt_apply(doc, xslt, params));
    return rcpp_result_gen;
END_RCPP
}
// libxml2_version
std::string libxml2_version();
RcppExport SEXP _xslt_libxml2_version() {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    rcpp_result_gen = Rcpp::wrap(libxml2_version());
    return rcpp_result_gen;
END_RCPP
}
// libxslt_version
std::string libxslt_version();
RcppExport SEXP _xslt_libxslt_version() {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    rcpp_result_gen = Rcpp::wrap(libxslt_version());
    return rcpp_result_gen;
END_RCPP
}
