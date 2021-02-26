# Some standard modifications to tissue slide plots. (not exported)
standard_tissue_plot <- function(p) {
  p +
    scale_x_continuous(expand = expansion(c(0, 0))) +
    scale_y_continuous(expand = expansion(c(0, 0))) +
    theme_classic() %+replace%
    theme(axis.title = element_blank())
}
