#' Converts list of branching time vectors to phylo objects
#'
#' @inheritParams default_params_doc
#'
#' @return List with phylo objects.
convert_to_phylo <- function(brts, seed_start) {

  set.seed(
    seed = seed_start,
    kind = "Mersenne-Twister",
    normal.kind = "Inversion",
    sample.kind = "Rejection"
  )

    tree <- lapply(
      X = brts,
      FUN = DDD::brts2phylo,
      root = FALSE,
      tip.label = NULL
    )

  tree
}
