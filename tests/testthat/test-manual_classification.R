
test_that("can create an empty manual classification", {
  mc <- manual_classification()
  expect_true(inherits(mc, "manual_classification"))
  expect_true(inherits(mc, "factor"))
  expect_equal(length(mc), 0)
  expect_true(is.na(attr(mc, "cutoff")))
})


test_that("can create a manual classification with numbers", {
  vals <- 1:5
  cutoff <- 3

  mc <- manual_classification(vals, cutoff = cutoff)
  expect_true(inherits(mc, "manual_classification"))
  expect_true(inherits(mc, "factor"))
  expect_equal(length(mc), 5)
  expect_true(attr(mc, "cutoff") == 3)
  expect_true(all(mc == vals))
})

test_that("the manual classification cutoff getter works", {
  mc <- manual_classification(1:5)
  expect_true(is.na(get_manual_classification_cutoff(mc)))

  cutoff <- 3
  mc <- manual_classification(1:5, cutoff = cutoff)
  expect_equal(get_manual_classification_cutoff(mc), 3)
})

test_that("the manual classification transform getter works", {
  mc <- manual_classification(1:5)
  expect_equal(get_manual_classification_transform(mc), identity)
  mc <- manual_classification(1:5, transform = log10)
  expect_equal(get_manual_classification_transform(mc), log10)

  rando_function <- function(x) {
    x
  }
  mc <- manual_classification(1:5, transform = rando_function)
  expect_equal(get_manual_classification_transform(mc), rando_function)
})
