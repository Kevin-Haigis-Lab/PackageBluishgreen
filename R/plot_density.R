#' Plot the distribution of FITC intensities
#'
#' @param ts Tissue slide object to plot.
#' @param value Values to plot the distribution of. (enquoted)
#'
#' @return A ggplot2 density plot.
#'
#' @examples
#' pancreas_slide <- tissue_slide(pancreas)
#' plot_density(pancreas_slide, fitc)
#' @import rlang
#' @export plot_density
plot_density <- function(ts, value) {
  ts %>%
    ggplot2::ggplot(ggplot2::aes(x = log10({{ value }}))) +
    ggplot2::geom_density(alpha = 0.1, size = 0.8, color = "black", fill = "black") +
    ggplot2::scale_y_continuous(expand = ggplot2::expansion(c(0, 0.02))) +
    ggplot2::theme_classic() +
    ggplot2::labs(x = "log10(FITC)", y = "density")
}
