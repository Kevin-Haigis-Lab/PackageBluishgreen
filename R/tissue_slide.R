#' Tissue slide information
#'
#' An S3 class to hold the information for an individual slide.
#'
#' @param slide_data The data from the slide.
#' @param metadata Additional metadata as a list with arbitrary structure and values.
#'
#' @return A \code{tissue_slide} object that is a subclass of a tibble.
#'
#' @examples
#' pancreas_slide <- tissue_slide(pancreas)
#' @export tissue_slide
tissue_slide <- function(slide_data, metadata = list()) {
  new_tissue_slide(slide_data, metadata = metadata)
}


new_tissue_slide <- function(data = tibble::tibble(), metadata = list()) {
  stopifnot(inherits(data, "data.frame"))
  structure(
    data,
    manual_class = manual_classification(),
    metadata = metadata,
    class = c("tissue_slide", class(tibble::tibble()))
  )
}


validate_tissue_slide <- function(ts) {
  stopifnot(inherits(ts, "tissue_slide"))
  stopifnot(inherits(ts, "data.frame"))

  assertr::verify(ts, assertr::has_all_names("x", "y"))

  stopifnot("metadata" %in% names(attributes(ts)))
  stopifnot(is.list(attr(ts, "metadata")))

  stopifnot("manual_class" %in% names(attributes(ts)))
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


#' Get metadata from a tissue slide.
#'
#' Extract the metadata stored with a tissue slide object. To set the metadata, use the function \code{set_slide_metadata()}.
#'
#' @param ts A Tissue slide object.
#'
#' @return The metadata object associated with the slide.
#'
#' @examples
#' slide <- tissue_slide(pancreas, metadata = list(tissue = "pancreas", mouse = "OP24"))
#' get_slide_metadata(slide)
#' @export get_slide_metadata
get_slide_metadata <- function(ts) {
  validate_tissue_slide(ts)
  return(attr(ts, "metadata"))
}


#' Set metadata from a tissue slide.
#'
#' Write the metadata stored with a tissue slide object. To get the metadata, use the function \code{get_slide_metadata()}.
#'
#' @param ts A Tissue slide object.
#' @param metadata Metadata of arbitrary structure.
#'
#' @return Returns the tissue slide object with the metadata.
#'
#' @examples
#' slide <- tissue_slide(pancreas, metadata = list(tissue = "pancreas", mouse = "OP24"))
#' slide <- set_slide_metadata(slide, list(tissue = "not pancreas", mouse = "Mickey"))
#' get_slide_metadata(slide)
#' @export set_slide_metadata
set_slide_metadata <- function(ts, metadata) {
  validate_tissue_slide(ts)
  attr(ts, "metadata") <- metadata
  return(ts)
}
