#' An example dataset from TUNEL on a pancreas.
#'
#' The output of running TUNEL on a pancreas slide.
#'
#' @format a tibble (67031 x 12)
#' \describe{
#'     \item{cell_id}{a unique ID for each cell.}
#'     \item{x}{x location}
#'     \item{y}{y location}
#'     \item{dapi}{DAPI channel intensity}
#'     \item{fitc}{FITC channel intensity}
#'     \item{area}{area of cell}
#'     \item{major_axis_length}{length of the cell's longest dimension}
#'     \item{minor_axis_length}{length of the cell's shortest dimension}
#'     \item{eccentricity}{how circular the cell is}
#'     \item{solidity}{how solid the cell is}
#'     \item{extent}{unknown}
#'     \item{orientation}{angle of the cell}
#' }
"pancreas"
