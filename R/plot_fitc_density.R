#' Plot the distribution of FITC intensities
#'
#' @param ts Tissue slide object to plot.
#'
#' @import ggplot2
#' @export plot_fitc_density
plot_fitc_density <- function(ts) {
  ts %>%
    ggplot(aes(x = log10(fitc))) +
    geom_density(alpha = 0.1, size = 0.8, color = "black", fill = "black") +
    scale_y_continuous(expand = expansion(c(0, 0.02))) +
    theme_classic() +
    labs(x = "log10(FITC)", y = "density")
}

utils::globalVariables(c("fitc"), add = TRUE)
