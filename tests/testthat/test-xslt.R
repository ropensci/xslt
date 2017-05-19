context("XSL Transformation")

test_that("XML document gets properly transformed using a stylesheet", {
  doc <- read_xml(system.file("examples/cd_catalog.xml", package = "xslt"))
  style <- read_xml(system.file("examples/cd_catalog.xsl", package = "xslt"))
  html <- xml_xslt(doc, style)
  orig <- read_xml("cd_catalog.html")
  expect_equal(as.character(html, options = "as_html"), as.character(orig, options = "as_html"))
})

# Example from https://github.com/ropensci/xslt/issues/1
test_that("XSLT output mode=text", {
  doc <- read_xml(system.file("examples/example.xml", package = "xslt"))
  style <- read_xml(system.file("examples/list.xsl", package = "xslt"))
  output <- xml_xslt(doc, style)
  expect_is(output, "character")
})
