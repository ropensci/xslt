#include <Rcpp.h>
#include <string>
using namespace Rcpp;

#include <libxslt/xsltutils.h>
#include <libxslt/transform.h>
#include "xslt_types.h"

// [[Rcpp::export]]
SEXP doc_xslt_apply(XPtrDoc doc, XPtrDoc xslt) {
  xmlDocPtr docPtr = xmlCopyDoc(doc.checked_get(), 1);
  xmlDocPtr sheetPtr = xmlCopyDoc(xslt.checked_get(), 1);
  xsltStylesheetPtr	xsltPtr = xsltParseStylesheetDoc(sheetPtr);
  xmlDocPtr res = xsltApplyStylesheet(xsltPtr, docPtr, NULL);
  if(xsltPtr->method && !strcmp("text", (char *) xsltPtr->method)){
    xmlChar * str; int len;
    xsltSaveResultToString(&str, &len, res, xsltPtr);
    return Rcpp::CharacterVector(std::string((char*) str, len));    
  }
  xmlFreeDoc(docPtr);
  xmlFreeDoc(sheetPtr);
  return XPtrDoc(res);
}
