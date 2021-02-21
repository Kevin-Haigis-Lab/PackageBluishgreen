#' Cluster the cells using a manual cutoff
#'
#' @param ts A tissue slide object.
#' @param cutoff A value to use as the cutoff point for the manual classification of the cells.
#' @param transform A callable (function) the apply to the data before classification.
#'
#' @return The tissue slide object with a value in the "manual_classification" attribute.
#'
#' @export cluster_manually
cluster_manually <- function(ts, cutoff, transform = identity) {
  validate_tissue_slide(ts)
  mc <- manual_classification(
    assignments = ifelse(transform(ts$fitc) < cutoff, 1, 2),
    cutoff = cutoff,
    transform = transform
  )
  ts <- set_manual_classification(ts, mc)
  validate_tissue_slide(ts)
  return(ts)
}
