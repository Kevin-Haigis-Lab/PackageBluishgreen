#' A ggplot2 theme for tissue slide plots
#'
#' @param base_size Base font size, given in pts.
#' @param base_family Base font family.
#'
#' @return A ggplot2 theme.
#'
#' @examples
#' ts <- tissue_slide(pancreas)
#' plot_tissue(ts) + theme_tissue_slide()
#' @export theme_tissue_slide
theme_tissue_slide <- function(base_size = 11, base_family = "Helvetica") {
  theme_classic(base_size = base_size, base_family = base_family) %+replace%
    ggplot2::theme(
      axis.title = ggplot2::element_blank()
    )
}
