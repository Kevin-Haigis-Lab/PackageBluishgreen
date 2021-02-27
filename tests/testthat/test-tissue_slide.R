
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


test_that("metadata can be set with initial tissue slide", {
  d <- mock_data()
  md <- list(a = "hello world", b = 12, c = 1.2, d = mtcars)

  ts <- tissue_slide(slide_data = d, metadata = md)
  expect_true(validate_tissue_slide(ts))

  stored_metadata <- attr(ts, "metadata")
  expect_true(all(names(md) %in% names(stored_metadata)))
  expect_true(md$a == stored_metadata$a)
  expect_true(md$b == stored_metadata$b)
  expect_true(md$c == stored_metadata$c)
  expect_true(digest::digest(md$d) == digest::digest(stored_metadata$d))
})


test_that("metadata can be set in existing tissue slide", {
  d <- mock_data()
  md <- list(a = "hello world", b = 12, c = 1.2, d = mtcars)

  ts <- tissue_slide(slide_data = d)
  expect_true(validate_tissue_slide(ts))

  ts <- set_slide_metadata(ts, metadata = md)

  stored_metadata <- attr(ts, "metadata")
  expect_true(all(names(md) %in% names(stored_metadata)))
  expect_true(md$a == stored_metadata$a)
  expect_true(md$b == stored_metadata$b)
  expect_true(md$c == stored_metadata$c)
  expect_true(digest::digest(md$d) == digest::digest(stored_metadata$d))
})


test_that("metadata can be retrieved using the getter", {
  d <- mock_data()
  md <- list(a = "hello world", b = 12, c = 1.2, d = mtcars)

  ts <- tissue_slide(slide_data = d)
  expect_true(validate_tissue_slide(ts))

  ts <- set_slide_metadata(ts, metadata = md)

  stored_metadata <- get_slide_metadata(ts)
  expect_true(all(names(md) %in% names(stored_metadata)))
  expect_true(md$a == stored_metadata$a)
  expect_true(md$b == stored_metadata$b)
  expect_true(md$c == stored_metadata$c)
  expect_true(digest::digest(md$d) == digest::digest(stored_metadata$d))
})
