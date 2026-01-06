# VEC Codebook

This is the "VEC Codebook" repository, developed and maintained by Development and Policies Research Center (DEPOCEN).

## Overview

This repository contains the source code and documentation for the VEC (Vietnam Enterprise Census) dataset codebook. The codebook provides comprehensive documentation for data cleaning and processing workflows.

## Structure

- `index.Rmd` - Main introduction page
- `01-intro.Rmd` - Introduction to VEC data
- `02-data-structure.Rmd` - Data structure documentation
- `03-cleaning-process.Rmd` - Data cleaning process
- `04-variables.Rmd` - Variable dictionary and metadata
- `05-results.Rmd` - Results and output documentation
- `06-faqs.Rmd` - Frequently asked questions

## Building and Previewing the Book

To build this book, you need:

1. R (>= 4.0)
2. R packages: `bookdown`, `knitr`, `rmarkdown`

Install required packages:

```r
install.packages(c("bookdown", "knitr", "rmarkdown"))
```

### Preview the Book (Recommended)

The easiest way to preview your book while editing is to use `serve_book()`:

```r
# In RStudio, open vec-codebook.Rproj, then run:
bookdown::serve_book()
```

This will:
- Build the book automatically
- Open it in your browser
- Auto-reload when you make changes to the source files
- Stop the server when you press `Esc` or close the R console

### Build the Book

To build the complete book (for final output):

**Option 1: Using RStudio**
- Open `vec-codebook.Rproj` in RStudio
- Click "Build Book" button in the Build pane (usually top-right)

**Option 2: Using R console**
```r
bookdown::render_book("index.Rmd")
```

The output will be in the `_book/` folder.

## License

All content in this codebook is licensed under a [Creative Commons Attribution-NonCommercial 4.0 International License](https://creativecommons.org/licenses/by-nc/4.0/).

