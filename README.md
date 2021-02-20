
<!-- README.md is generated from README.Rmd. Please edit that file -->

# PackageBluishgreen

<!-- badges: start -->

[![R-CMD-check](https://github.com/Kevin-Haigis-Lab/PackageBluishgreen/workflows/R-CMD-check/badge.svg)](https://github.com/Kevin-Haigis-Lab/PackageBluishgreen/actions)
<!-- badges: end -->

The goal of PackageBluishgreen is to …

## Installation

You can install the released version of PackageBluishgreen from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("PackageBluishgreen")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(PackageBluishgreen)

data <- system.file("extdata", "unmicst-OP1513_lung_TUNEL.csv", package = "PackageBluishgreen") %>%
  readr::read_csv(col_types = readr::cols())

head(data)
#> # A tibble: 6 x 14
#>   CellID DAPI_nucleiMask FITC_nucleiMask X_centroid Y_centroid column_centroid
#>    <dbl>           <dbl>           <dbl>      <dbl>      <dbl>           <dbl>
#> 1      1           8031.           6842.     20320.      1210.          20320.
#> 2      2           4820.           3696      20324.      1321.          20324.
#> 3      3           8178.           3300.     20148.      1403.          20148.
#> 4      4           8438.           3906.     20290.      1455.          20290.
#> 5      5           8220.           5726.     21130.      1460.          21130.
#> 6      6           8514.           2288.     19261.      1483.          19261.
#> # … with 8 more variables: row_centroid <dbl>, Area <dbl>,
#> #   MajorAxisLength <dbl>, MinorAxisLength <dbl>, Eccentricity <dbl>,
#> #   Solidity <dbl>, Extent <dbl>, Orientation <dbl>
```
