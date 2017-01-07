#' XSLT 1.0 Transformations
#'
#' Transform an XML document by applying an XSL stylesheet.
#'
#' This implementation supports XSLT 1.0 features plus most of the EXSLT set of
#' processor-portable extensions functions. 
#' 
#' Unfortunately XSLT 2.0 or 3.0 features are only available in proprietary libraries
#' and currently unsupported. However XSLT 2.0 is not widely adopted anyway because 
#' it is also unavailable in most browsers.
#'
#' @export
#' @aliases xslt
#' @useDynLib xslt
#' @importFrom xml2 read_xml
#' @param doc xml document as returned by [xml2::read_xml]
#' @param stylesheet another xml document containing the XSL stylesheet
#' @examples doc <- read_xml(system.file("examples/cd_catalog.xml", package = "xslt"))
#' style <- read_xml(system.file("examples/cd_catalog.xsl", package = "xslt"))
#' html <- xml_xslt(doc, style)
#' cat(as.character(html))
xml_xslt <- function(doc, stylesheet){
  UseMethod("xml_xslt")
}

#' @export
xml_xslt.xml_document <- function(doc, stylesheet){
  as_xml2 <- utils::getFromNamespace("xml_document", "xml2")
  stopifnot(inherits(stylesheet, "xml_document"))
  as_xml2(doc_xslt_apply(doc$doc, stylesheet$doc))
}