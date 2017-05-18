#include <Rcpp.h>
#include <string>
using namespace Rcpp;

#include <libxslt/xsltutils.h>
#include <libxslt/transform.h>
#include "xslt_types.h"

// [[Rcpp::export]]
SEXP doc_xslt_apply(XPtrDoc doc, XPtrDoc xslt) {
  xmlDocPtr docPtr = doc.checked_get();
  xsltStylesheetPtr	xsltPtr = xsltParseStylesheetDoc(xslt.checked_get());
  xmlDocPtr res = xsltApplyStylesheet(xsltPtr, docPtr, NULL);
  if(xsltPtr->method && !strcmp("text", (char *) xsltPtr->method)){
    xmlChar * str; int len;
    xsltSaveResultToString(&str, &len, res, xsltPtr);
    return Rcpp::CharacterVector(std::string((char*) str, len));    
  }
  return XPtrDoc(res);
}
