
mock_data <- function() {
  dplyr::filter(pancreas, x < 5000 & y < 5000)
}

test_that("tissue plot can build", {
  d <- mock_data()
  ts <- tissue_slide(d)
  p <- plot_tissue(ts = ts, color = fitc)
  expect_true(inherits(p, "gg"))
  p_built <- ggplot2::ggplot_build(p)
  expect_true(inherits(p_built, "ggplot_built"))
})

test_that("tissue slide is plotted properly", {
  d <- mock_data()
  ts <- tissue_slide(d)
  p <- plot_tissue(ts = ts, color = fitc)
  expect_true(inherits(p, "gg"))
})
