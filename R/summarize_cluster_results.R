#' Summarize the cluster results
#'
#' Create a tibble that summarizes the classification of cells.
#'
#' @param ts The tissue slide
#'
#' @return A data.frame of the summarizesed results, one column per classification method.
#'
#' @examples
#' pancreas_slide <- tissue_slide(pancreas)
#' pancreas_slide <- cluster_manually(pancreas_slide,
#'   fitc,
#'   cutoff = 4,
#'   transform = log10
#' )
#' summarize_cluster_results(pancreas_slide)
#' @importFrom dplyr %>%
#' @export summarize_cluster_results
summarize_cluster_results <- function(ts) {
  validate_tissue_slide(ts)
  manual_class <- get_manual_classification(ts)
  if (length(ts) > 0) {
    ts$manual_cluster <- manual_class
  }
  ts %>%
    tibble::as_tibble() %>%
    dplyr::count(manual_cluster)
}


utils::globalVariables(c("manual_cluster"), add = TRUE)
