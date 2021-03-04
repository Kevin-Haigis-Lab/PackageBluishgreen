
mock_data <- function() {
  dplyr::filter(pancreas, x < 5000 & y < 5000)
}

test_that("can plot a tissue slide with manual classification", {
  d <- mock_data()
  ts <- tissue_slide(d)
  ts <- cluster_manually(ts, fitc, 4, transform = log10)
  p <- plot_slide_clusters(ts, method = "manual")
  expect_true(inherits(p, "gg"))
})

test_that("cannot plot a tissue slide without manual classification", {
  d <- mock_data()
  ts <- tissue_slide(d)
  expect_error(
    plot_slide_clusters(ts, method = "manual"),
    "Cannot plot clusters without first applying a manual classification"
  )
})

test_that("cannot plot with an unavailable classification method", {
  d <- mock_data()
  ts <- tissue_slide(d)
  expect_error(
    plot_slide_clusters(ts, method = "not-a-real-method"),
    "request a new clusering method"
  )
})
