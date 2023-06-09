% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_dcut.R
\name{create_dcut}
\alias{create_dcut}
\title{Create Datacut Dataset (DCUT)}
\usage{
create_dcut(dataset_ds, ds_date_var, filter, cut_date, cut_description)
}
\arguments{
\item{dataset_ds}{Input DS SDTMv dataset}

\item{ds_date_var}{Character date/time variable in the DS SDTMv to be compared against the
datacut date}

\item{filter}{Condition to filter patients in DS, should give 1 row per patient}

\item{cut_date}{Datacut date/time, e.g. "2022-10-22"}

\item{cut_description}{Datacut date/time description, e.g. "Clinical Cut Off Date"}
}
\value{
Datacut dataset containing the variables \code{USUBJID}, \code{DCUTDTC}, \code{DCUTDTM} and
\code{DCUTDESC}.
}
\description{
After filtering the input DS dataset (based on the given filter condition), any
records where the SDTMv date/time variable is on or before the datacut date/time (after
imputations) will be returned in the output datacut dataset (DCUT). Note that \code{ds_date_var}
and \code{cut_date} inputs must be in ISO 8601 format (YYYY-MM-DDThh:mm:ss) and will be imputed
using the \code{impute_sdtm()} and \code{impute_dcutdtc()} functions.
}
\examples{
ds <- tibble::tribble(
  ~USUBJID, ~DSSEQ, ~DSDECOD, ~DSSTDTC,
  "subject1", 1, "INFORMED CONSENT", "2020-06-23",
  "subject1", 2, "RANDOMIZATION", "2020-08-22",
  "subject1", 3, "WITHDRAWAL BY SUBJECT", "2020-05-01",
  "subject2", 1, "INFORMED CONSENT", "2020-07-13",
  "subject3", 1, "INFORMED CONSENT", "2020-06-03",
  "subject4", 1, "INFORMED CONSENT", "2021-01-01",
  "subject4", 2, "RANDOMIZATION", "2023-01-01"
)

dcut <- create_dcut(
  dataset_ds = ds,
  ds_date_var = DSSTDTC,
  filter = DSDECOD == "RANDOMIZATION",
  cut_date = "2022-01-01",
  cut_description = "Clinical Cutoff Date"
)
}
\author{
Alana Harris
}
\keyword{derive}
