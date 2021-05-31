#' Converts list of branching time vectors to phylo objects
#'
#' @inheritParams default_params_doc
#'
#' @return List with phylo objects.
convert_to_phylo <- function(brts) {

  tree <- lapply(
    X = brts,
    FUN = DDD::brts2phylo,
    root = FALSE,
    tip.label = NULL
  )

  tree
}
