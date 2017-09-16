#include <Rcpp.h>
#include <string>
using namespace Rcpp;

#include <libxslt/xsltutils.h>
#include <libxslt/transform.h>
#include "xslt_types.h"

// [[Rcpp::export]]
SEXP doc_xslt_apply(XPtrDoc doc, XPtrDoc xslt, std::vector<std::string> params) {
  xmlDocPtr docPtr = xmlCopyDoc(doc.checked_get(), 1);
  xmlDocPtr sheetPtr = xmlCopyDoc(xslt.checked_get(), 1);
  xsltStylesheetPtr	xsltPtr = xsltParseStylesheetDoc(sheetPtr);
  const char * strparam[params.size() + 1];
  for(size_t i = 0; i < params.size(); i++)
    strparam[i] = params.at(i).c_str();
  strparam[params.size()] = NULL;
  xmlDocPtr res = xsltApplyStylesheet(xsltPtr, docPtr, strparam);
  if(xsltPtr->method && !strcmp("text", (char *) xsltPtr->method)){
    xmlChar * str; int len;
    xsltSaveResultToString(&str, &len, res, xsltPtr);
    xmlFreeDoc(docPtr);
    xmlFreeDoc(sheetPtr);
    return Rcpp::CharacterVector(std::string((char*) str, len));    
  }
  xmlFreeDoc(docPtr);
  xmlFreeDoc(sheetPtr);
  return XPtrDoc(res);
}
