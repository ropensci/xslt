# xslt

> XSLT 1.0 Transformations

[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/xslt)](http://cran.r-project.org/package=xslt)
[![CRAN RStudio mirror downloads](http://cranlogs.r-pkg.org/badges/xslt)](http://cran.r-project.org/web/packages/xslt/index.html)

An extension for the 'xml2' package to transform XML documents by applying an XSL stylesheet.

## Usage

Basic example included with the package:

```r
doc <- read_xml(system.file("examples/cd_catalog.xml", package = "xslt"))
style <- read_xml(system.file("examples/cd_catalog.xsl", package = "xslt"))
html <- xml_xslt(doc, style)
cat(as.character(html))
```
