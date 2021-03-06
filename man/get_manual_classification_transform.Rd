% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/manual_classification.R
\name{get_manual_classification_transform}
\alias{get_manual_classification_transform}
\title{Get the transform function of a manual classification object.}
\usage{
get_manual_classification_transform(mc)
}
\arguments{
\item{mc}{A manual classification object.}
}
\value{
The tranform function.
}
\description{
Get the transform function of a manual classification object.
}
\examples{
mc <- manual_classification(
  c("a", "a", "b", "a", "b"),
  cutoff = 2.5,
  transform = log10
)
f <- get_manual_classification_transform(mc)
f(100)
}
