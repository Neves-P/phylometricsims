#' Data frame with DAISIE IW parameter space
#'
#' A dataset containing 1000 randomly sampled parameter combinations for a
#' DAISIE IW simulation.
#'
#' @format A data frame with 1000 rows and 5 parameters:
#' \describe{
#'   \item{lac}{Per-lineage cladogenesis rate}
#'   \item{mu}{Per-lineage extinction rate}
#'   \item{K}{Island-wide carrying capacity}
#'   \item{gam}{Per-lineage immigration rate}
#'   \item{laa}{Per-lineage anagenesis rate}
#' }
#' @source data_raw/param_space.R
"param_space"
