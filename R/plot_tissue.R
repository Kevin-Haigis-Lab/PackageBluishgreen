#' Plot the tissue slide showing the FITC intensity
#'
#' Plots the slide with each point representing a cell and the color represents the intensity of FITC.
#'
#' @param ts Tissue slide object to plot.
#' @param color The column to use for coloring each cell. (enquoted)
#' @param prop The proportion of cells to plot (too many cells can slow performance).
#'
#' @return A ggplot2 plot
#'
#' @examples
#' plot_tissue(tissue_slide(pancreas), color = fitc)
#' @import rlang
#' @importFrom dplyr %>%
#' @export plot_tissue
plot_tissue <- function(ts, color, prop = 0.25) {
  validate_tissue_slide(ts)
  p <- ts %>%
    dplyr::slice_sample(prop = prop) %>%
    ggplot2::ggplot(ggplot2::aes(x = x, y = y, color = {{ color }})) +
    ggplot2::geom_point(size = 0.5, alpha = 0.9) +
    ggplot2::scale_x_continuous(expand = ggplot2::expansion(mult = c(0, 0))) +
    ggplot2::scale_y_continuous(expand = ggplot2::expansion(mult = c(0, 0))) +
    ggplot2::scale_color_distiller(type = "div", palette = "RdYlBu") +
    theme_tissue_slide()
}

utils::globalVariables(c("x", "y"), add = TRUE)
