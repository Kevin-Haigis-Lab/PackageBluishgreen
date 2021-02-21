#' Tissue slide information
#'
#' An S3 class to hold the information for an individual slide.
#'
#' @param slide_data The data from the slide.
#'
#' @export tissue_slide
tissue_slide <- function(slide_data) {
  new_tissue_slide(slide_data)
}

new_tissue_slide <- function(data = tibble::tibble()) {
  stopifnot(inherits(data, "data.frame"))
  structure(
    data,
    manual_class = manual_classification(),
    class = c("tissue_slide", class(tibble::tibble()))
  )
}

validate_tissue_slide <- function(ts) {
  stopifnot(inherits(ts, "tissue_slide"))
  stopifnot(inherits(ts, "data.frame"))
  assertr::verify(ts, assertr::has_all_names("x", "y", "fitc"))

  stopifnot(inherits(attr(ts, "manual_class"), "manual_classification"))

  return(TRUE)
}

get_manual_classification <- function(ts) {
  validate_tissue_slide(ts)
  attr(ts, "manual_class")
}

set_manual_classification <- function(ts, manual_class) {
  validate_tissue_slide(ts)
  validate_manual_classification(manual_class)
  attr(ts, "manual_class") <- manual_class
  validate_tissue_slide(ts)
  return(ts)
}
