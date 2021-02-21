#' Plot the tissue slide showing the FITC intensity
#'
#' Plots the slide with each point representing a cell and the color represents the intensity of FITC.
#'
#' @param ts Tissue slide object to plot.
#' @param prop The proportion of cells to plot (too many cells can slow performance).
#'
#'
#' @import ggplot2
#' @importFrom dplyr %>%
#' @export plot_tissue
plot_tissue <- function(ts, prop = 0.25) {
  validate_tissue_slide(ts)
  p <- ts %>%
    dplyr::slice_sample(prop = prop) %>%
    ggplot(aes(x = x, y = y, color = log10(fitc))) +
    geom_point(size = 0.5, alpha = 0.9)

  standard_tissue_plot(p) +
    scale_color_distiller(type = "div", palette = "RdYlBu") +
    labs(color = "log10(FITC)")
}

utils::globalVariables(c("fitc", "x", "y"), add = TRUE)
