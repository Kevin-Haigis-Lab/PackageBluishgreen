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
#' @examples
#' # An empty classification.
#' manual_classification()
#'
#' # The numeric assignments will be turned into a factor.
#' manual_classification(c(1, 2, 1, 2, 1, 1), cutoff = 4000)
#'
#' # Provide a different function used to transform the data before
#' # applying the cutoff.
#' manual_classification(
#'   c("a", "a", "b", "a", "b"),
#'   cutoff = 2.5,
#'   transform = log10
#' )
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

#' Get the cutoff of a manual classification object.
#'
#' @param mc A manual classification object.
#'
#' @return The cutoff value.
#'
#' @examples
#' mc <- manual_classification(
#'   c("a", "a", "b", "a", "b"),
#'   cutoff = 2.5,
#'   transform = log10
#' )
#' get_manual_classification_cutoff(mc)
#' @export get_manual_classification_cutoff
get_manual_classification_cutoff <- function(mc) {
  validate_manual_classification(mc)
  return(attr(mc, "cutoff"))
}

#' Get the transform function of a manual classification object.
#'
#' @param mc A manual classification object.
#'
#' @return The tranform function.
#'
#' @examples
#' mc <- manual_classification(
#'   c("a", "a", "b", "a", "b"),
#'   cutoff = 2.5,
#'   transform = log10
#' )
#' f <- get_manual_classification_transform(mc)
#' f(100)
#' @export get_manual_classification_transform
get_manual_classification_transform <- function(mc) {
  validate_manual_classification(mc)
  return(attr(mc, "transform"))
}
