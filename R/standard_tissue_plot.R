#' Some standard modifications to tissue slide plots. (not exported)
#'
#' @param p Original plot
#' @return A modified ggplot2 object
standard_tissue_plot <- function(p) {
  p +
    ggplot2::scale_x_continuous(expand = ggplot2::expansion(c(0, 0))) +
    ggplot2::scale_y_continuous(expand = ggplot2::expansion(c(0, 0))) +
    ggplot2::theme_classic() %+replace%
    ggplot2::theme(axis.title = ggplot2::element_blank())
}
