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
    stop(paste(
      "Only 'manual' is currently supported.",
      "To request a new clusering method, please open an issue (linked below)",
      " and comprehensively describe your desired use case.",
      paste0("=> ", link_to_github_issues()),
      sep = "\n"
    ))
  }
  ts <- dplyr::slice_sample(ts, prop = prop)
  p <- ggplot2::ggplot(ts, ggplot2::aes(color = .cluster, alpha = .cluster)) +
    ggplot2::geom_point(
      ggplot2::aes(color = .cluster, alpha = .cluster),
      size = 0.5
    ) +
    ggplot2::scale_x_continuous(expand = ggplot2::expansion(mult = c(0, 0))) +
    ggplot2::scale_y_continuous(expand = ggplot2::expansion(mult = c(0, 0))) +
    ggplot2::scale_color_brewer(
      type = "qual",
      palette = "Set1",
      direction = -1,
      guide = ggplot2::guide_legend(override.aes = list(size = 1, alpha = 1))
    ) +
    ggplot2::scale_alpha_manual(values = c(0.2, 0.7), guide = FALSE) +
    theme_tissue_slide() +
    ggplot2::labs(color = "cluster")
}

utils::globalVariables(c("x", "y", ".cluster"), add = TRUE)
