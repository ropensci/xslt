# xslt

> XSLT 1.0 Transformations

[![Build Status](https://travis-ci.org/ropensci/xslt.svg?branch=master)](https://travis-ci.org/ropensci/xslt)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/ropensci/xslt?branch=master&svg=true)](https://ci.appveyor.com/project/jeroen/xslt)
[![Coverage Status](https://codecov.io/github/ropensci/xslt/coverage.svg?branch=master)](https://codecov.io/github/ropensci/xslt?branch=master)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/xslt)](http://cran.r-project.org/package=xslt)
[![CRAN RStudio mirror downloads](http://cranlogs.r-pkg.org/badges/xslt)](http://cran.r-project.org/web/packages/xslt/index.html)
[![Github Stars](https://img.shields.io/github/stars/ropensci/xslt.svg?style=social&label=Github)](https://github.com/ropensci/xslt)

An extension for the 'xml2' package to transform XML documents by applying an XSL stylesheet.

## Usage

Basic example included with the package:

```r
doc <- read_xml(system.file("examples/cd_catalog.xml", package = "xslt"))
style <- read_xml(system.file("examples/cd_catalog.xsl", package = "xslt"))
html <- xml_xslt(doc, style)
cat(as.character(html))
```
