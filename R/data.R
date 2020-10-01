#' Data frame with DAISIE IW parameter space
#'
#' @name param_space
#'
#' @section param_space.csv:
#'
#' A dataset containing 1000 randomly sampled parameter combinations for a
#' DAISIE IW simulation.
#'
#' @format A data frame with 1000 rows and 5 parameters:
#' \describe{
#'   \item{simID}{Integer with simualation ID}
#'   \item{lac}{Per-lineage cladogenesis rate}
#'   \item{mu}{Per-lineage extinction rate}
#'   \item{K}{Island-wide carrying capacity}
#'   \item{gam}{Per-lineage immigration rate}
#'   \item{laa}{Per-lineage anagenesis rate}
#'   \item{totaltime}{Integer with total island age}
#' }
#' @source data_raw/param_space.R
NULL
