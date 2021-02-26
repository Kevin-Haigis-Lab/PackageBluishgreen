
mock_data <- function(nrow = 10) {
  m <- matrix(rnorm(nrow**2), nrow = nrow)
  d <- tibble::tibble(as.data.frame(m))
  colnames(d) <- as.character(seq(1, nrow))
  d$x <- seq(1, nrow)
  d <- tidyr::pivot_longer(d, -x)
  colnames(d) <- c("x", "y", "value")
  d$y <- as.numeric(d$y)
  return(d)
}

test_that("manual clustering only accepts tissue slide objects", {
  d <- mock_data()
  expect_error(cluster_manually(d))
})

test_that("manual clustering works", {
  TOLERANCE <- 0.02
  for (cutoff in runif(100, -2, 2)) {
    d <- mock_data(nrow = 100)
    ts <- tissue_slide(d)

    ts <- cluster_manually(ts, value = value, cutoff = cutoff, transform = identity)

    prop <- sum(get_manual_classification(ts) == 1) / nrow(ts)
    expect_true(abs(prop - pnorm(cutoff)) < TOLERANCE)
  }
})
