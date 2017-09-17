context("Parameters")

test_that("parameters are rendered", {
  doc <- xml2::read_xml("doc.xml")
  style <- xml2::read_xml("style.xml")
  expect_equal(xml_xslt(doc, style), "author: \nreviewer: \n")
  expect_equal(xml_xslt(doc, style, c(author="jeroen", reviewer="bert")), 
               "author: jeroen\nreviewer: bert\n")
})
