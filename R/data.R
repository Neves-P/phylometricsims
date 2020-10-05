#' Data frame with DAISIE IW parameter space
#'
#' @name ve_USE_parameters
#'
#' @description
#' A dataset containing 2000 randomly sampled parameter combinations for a
#' DAISIE IW simulation.
#' @format A data frame with 2000 rows and 7 columns:
#' \describe{
#'   \item{simID}{Integer with simualation ID}
#'   \item{lac}{Per-lineage cladogenesis rate}
#'   \item{mu}{Per-lineage extinction rate}
#'   \item{K}{Island-wide carrying capacity}
#'   \item{gam}{Per-lineage immigration rate}
#'   \item{laa}{Per-lineage anagenesis rate}
#'   \item{totaltime}{Integer with total island age}
#' }
#' @source data_raw/ve_USE_parameters.R
NULL
