#include <Rcpp.h>
#include <R_ext/Rdynload.h>
#include <libxml/xmlversion.h>
#include <libxml/xmlerror.h>
#include <libxml/parser.h>
#include <libxslt/xsltutils.h>
#include <libexslt/exslt.h>

char xsltlasterr[1024] = {0};

void handleXsltError(void *ctx, const char *msg, ...){
  va_list arg_ptr;
  va_start(arg_ptr, msg);
  vsnprintf(xsltlasterr, 1024, msg, arg_ptr);
  REprintf("xslt error: %s", xsltlasterr);
}

void handleError(void* userData, xmlError* error) {
  std::string message = std::string(error->message);
  message.resize(message.size() - 1); // trim off trailing newline

  if (error->level <= 2) {
    Rcpp::warning("%s [%i]", message, error->code);
  } else {
    Rcpp::stop("%s [%i]", message, error->code);
  }
}

extern "C" {

  void R_init_xslt(DllInfo *info) {
    // Check that header and libs are compatible
    LIBXML_TEST_VERSION

    xmlInitParser();
    xmlSetStructuredErrorFunc(NULL, handleError);

#if LIBXSLT_VERSION > 10115
    xsltInit();
#endif

    xsltSetGenericErrorFunc(NULL, (xmlGenericErrorFunc) handleXsltError);
    exsltRegisterAll();

    /* Required by R 3.4 */
    R_registerRoutines(info, NULL, NULL, NULL, NULL);
    R_useDynamicSymbols(info, (Rboolean) TRUE);
  }

  void R_unload_xlst(DllInfo *info) {
    xsltCleanupGlobals();
  }
}

// [[Rcpp::export]]
std::string libxml2_version(){
  return LIBXML_DOTTED_VERSION;
}

// [[Rcpp::export]]
std::string libxslt_version(){
  return LIBXSLT_DOTTED_VERSION;
}
