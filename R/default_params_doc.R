#' Default parameter documentation
#'
#' This function does not do anything. It is meant to hold argument
#' documentation, which is then inherited in all other functions.
#'
#' @param totaltime Positive numeric. Specifies how the age of the island to be
#'   simulated by [DAISIE::DAISIE_sim_constant_rate()].
#' @param sim_pars Numeric vector with DAISIE simulation parameters, as in
#'   [DAISIE::DAISIE_sim_constant_rate()]:
#'   1. Cladogenesis rate (\eqn{\lambda^c}).
#'   2. Extinction rate \eqn{\mu}.
#'   3. Island-wide carrying capacity (K').
#'   4. Immigration rate \eqn{\gamma}.
#'   4. Anagenesis rate \eqn{\lambda^a}.
#' @param n_mainland_spec Positive Integer with total number of species in the
#'   mainland pool, which can colonize the island.
#' @param replicates Positive integer with the total number of replicates of the
#'   same island that should be simulated.
#'
#' @return Nothing
#'
#' @author Pedro Neves
#' @note Should be marked as `@noRd`, but this can't be done or inheriting
#' parameters would not be possible.
default_params_doc <- function(totaltime,
                               sim_pars,
                               n_mainland_spec,
                               replicates) {
  # Nothing
}
