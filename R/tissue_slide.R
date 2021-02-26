#' Tissue slide information
#'
#' An S3 class to hold the information for an individual slide.
#'
#' @param slide_data The data from the slide.
#'
#' @return A \code{tissue_slide} object that is a subclass of a tibble.
#'
#' @examples
#' pancreas_slide <- tissue_slide(pancreas)
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
  assertr::verify(ts, assertr::has_all_names("x", "y"))

  stopifnot(inherits(attr(ts, "manual_class"), "manual_classification"))

  return(TRUE)
}

#' Get the manual classification from a tissue slide
#'
#' Extract the manual classification from a tissue slide. This property should
#' not be set manually (ironically). Instead using the \code{cluster_manually()}
#' function. See the example below for a demonstration.
#'
#' @param ts A tissue slide that has been manually classified.
#'
#' @return A \code{manual_classification} object.
#'
#' @examples
#' pancreas_slide <- tissue_slide(pancreas)
#' pancreas_slide <- cluster_manually(pancreas_slide,
#'   fitc,
#'   cutoff = 4,
#'   transform = log10
#' )
#' get_manual_classification(pancreas_slide)
#' @export get_manual_classification
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
