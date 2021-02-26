#' Plot the clusters on the slide
#'
#' @param ts A tissue slide object
#' @param method The classification method to use. The classification should have already been done.
#' @param prop The proportion of cells to include in the plot (too many cells can impact performance).
#'
#' @return A ggplot2 object.
#'
#' @examples
#' pancreas_slide <- tissue_slide(pancreas)
#' pancreas_slide <- cluster_manually(pancreas_slide,
#'   fitc,
#'   cutoff = 4,
#'   transform = log10
#' )
#' plot_slide_clusters(pancreas_slide)
#' @import ggplot2
#' @export plot_slide_clusters
plot_slide_clusters <- function(ts, method = "manual", prop = 0.25) {
  if (method == "manual") {
    ts$.cluster <- get_manual_classification(ts)
  } else {
    stop("Only 'manual' is currently supported.")
  }
  ts <- dplyr::slice_sample(ts, prop = prop)
  p <- ggplot(ts, aes(x = x, y = y, color = .cluster, alpha = .cluster)) +
    geom_point(size = 0.5)

  standard_tissue_plot(p) +
    scale_color_brewer(
      type = "qual",
      palette = "Set1",
      direction = -1,
      guide = guide_legend(override.aes = list(size = 1, alpha = 1))
    ) +
    scale_alpha_manual(values = c(0.2, 0.7), guide = FALSE) +
    labs(color = "cluster")
}

utils::globalVariables(c("x", "y", ".cluster"), add = TRUE)
