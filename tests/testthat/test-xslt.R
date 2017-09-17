context("Transformation")

test_that("XML document gets properly transformed using a stylesheet", {
  doc <- read_xml(system.file("examples/cd_catalog.xml", package = "xslt"))
  style <- read_xml(system.file("examples/cd_catalog.xsl", package = "xslt"))
  orig <- read_xml("cd_catalog.html")
  
  # Test several times to make sure the original docs do not get corrupted
  for(i in 1:5){
    html <- xml_xslt(doc, style)
    expect_equal(as.character(html, options = "as_html"), as.character(orig, options = "as_html"))    
  }
})

# Example from https://github.com/ropensci/xslt/issues/1
test_that("XSLT output mode=text", {
  doc <- read_xml(system.file("examples/example.xml", package = "xslt"))
  style <- read_xml(system.file("examples/list.xsl", package = "xslt"))
  for(i in 1:5){
    output <- xml_xslt(doc, style)
    expect_is(output, "character")    
  }
})
