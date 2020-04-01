#' XSLT 1.0 Transformations
#'
#' Transform an XML document by applying an XSL stylesheet. Usually returns the 
#' transformed [xml_document][xml2::xml_new_document], unless the stylesheet has
#' `<xsl:output method="text">` in which case we return a text string.
#'
#' This implementation supports XSLT 1.0 features plus most of the EXSLT set of
#' processor-portable extensions functions. Unfortunately XSLT 2.0 or 3.0 features
#' are only available in proprietary libraries and currently unsupported. However 
#' XSLT 2.0 is not widely adopted anyway because it is unavailable in most browsers.
#'
#' @export
#' @rdname xslt
#' @name xslt
#' @useDynLib xslt
#' @importFrom xml2 read_xml
#' @importFrom Rcpp sourceCpp
#' @param doc xml document as returned by [xml2::read_xml]
#' @param stylesheet another xml document containing the XSL stylesheet
#' @param params named list or vector with additional XSLT parameters
#' @examples doc <- read_xml(system.file("examples/cd_catalog.xml", package = "xslt"))
#' style <- read_xml(system.file("examples/cd_catalog.xsl", package = "xslt"))
#' html <- xml_xslt(doc, style)
#' cat(as.character(html))
xml_xslt <- function(doc, stylesheet, params){
  UseMethod("xml_xslt")
}

#' @export
xml_xslt.xml_document <- function(doc, stylesheet, params = NULL){
  as_xml2 <- utils::getFromNamespace("xml_document", "xml2")
  stopifnot(inherits(stylesheet, "xml_document"))
  paramstr <- c(rbind(names(params), vapply(params, deparse, character(1))))
  out <- doc_xslt_apply(doc$doc, stylesheet$doc, paramstr)
  if(is.character(out))
    return(out)
  as_xml2(out)
}

#' @export
#' @rdname xslt
xslt_version <- function(){
  list(
    xml2 = as.package_version(libxml2_version()),
    xslt = as.package_version(libxslt_version())
  )
}
