#' Cluster the cells using a manual cutoff
#'
#' @param ts A tissue slide object.
#' @param value The name of the column to use for classification. (enquoted)
#' @param cutoff A value to use as the cutoff point for the manual classification of the cells.
#' @param transform A callable (function) the apply to the data before classification.
#'
#' @return The tissue slide object with a value in the "manual_classification" attribute.
#'
#' @examples
#' pancreas_slide <- tissue_slide(pancreas)
#' pancreas_slide <- cluster_manually(pancreas_slide,
#'   fitc,
#'   cutoff = 4,
#'   transform = log10
#' )
#' get_manual_classification(pancreas_slide)
#' @import rlang
#' @export cluster_manually
cluster_manually <- function(ts, value, cutoff, transform = identity) {
  validate_tissue_slide(ts)
  value <- dplyr::pull(ts, {{ value }})
  mc <- manual_classification(
    assignments = ifelse(transform(value) < cutoff, 1, 2),
    cutoff = cutoff,
    transform = transform
  )
  ts <- set_manual_classification(ts, mc)
  validate_tissue_slide(ts)
  return(ts)
}
