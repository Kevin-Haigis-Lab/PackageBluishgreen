
# Mock data fixture.
mock_data <- function() {
  tibble::tibble(x = rep(c(1:6), 3), y = rep(1:3, each = 6))
}

test_that("a tissue slide is created properly", {
  d <- mock_data()
  ts <- tissue_slide(d)

  expect_true(inherits(ts, "tissue_slide"))
  expect_true(inherits(ts, "tbl_df"))
  expect_true(inherits(ts, "data.frame"))
})

test_that("tissue slide looks like a tibble", {
  d <- mock_data()
  ts <- tissue_slide(d)

  expect_equal(nrow(d), nrow(ts))
  expect_equal(ncol(d), ncol(ts))
  expect_equal(colnames(d), colnames(ts))
})

test_that("tissue slide can be manipulated like a tibble", {
  d <- mock_data()
  ts <- tissue_slide(d)

  ts$new_col <- seq(1, nrow(ts))

  expect_false("new_col" %in% colnames(d))
  expect_true("new_col" %in% colnames(ts))

  ts$new_col <- NULL
  expect_false("new_col" %in% colnames(ts))
})
