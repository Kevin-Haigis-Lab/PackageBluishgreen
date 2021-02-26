
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
