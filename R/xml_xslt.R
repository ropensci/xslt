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
#' @rdname xslt
#' @name xslt
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
  out <- doc_xslt_apply(doc$doc, stylesheet$doc)
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
