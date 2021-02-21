#' Manual classification object.
#'
#' An S3 class for handling manual classification.
#'
#' @param assignments A factor vector of cluster assignments.
#' @param cutoff The value used for the manual classification.
#' @param transform A callable (function) to transform the data before applying the cutoff classification.
#'
#' @return A manual classification that behaves like a factor.
#'
#' @export manual_classification
manual_classification <- function(assignments = factor(), cutoff = NA_real_, transform = identity) {
  if (is.list(assignments)) {
    assignments <- unlist(assignments)
  }
  if (!is.factor(assignments)) {
    assignments <- factor(assignments)
  }

  mc <- new_manual_classification(assignments = assignments, cutoff = cutoff, transform = transform)

  validate_manual_classification(mc)
  return(mc)
}

new_manual_classification <- function(assignments = factor(), cutoff = double(), transform = identity) {
  stopifnot(is.factor(assignments))
  stopifnot(is.numeric(cutoff))
  stopifnot(is.function(transform))
  structure(
    assignments,
    cutoff = cutoff,
    transform = transform,
    class = c("manual_classification", "factor")
  )
}

validate_manual_classification <- function(mc) {
  stopifnot(is.factor(mc))
  stopifnot(is.numeric(attr(mc, "cutoff")))
  stopifnot(is.function(attr(mc, "transform")))
  return(TRUE)
}