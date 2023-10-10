#!/usr/bin/env Rscript

# Getting run work directory
here <- getwd()
notebook <- file.path(here, "hello.Rmd")

htmltools::save_html(html = notebook, file = "test.html")
