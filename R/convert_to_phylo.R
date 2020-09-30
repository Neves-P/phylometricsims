convert_to_phylo <- function(brts) {

    tree <- lapply(
      X = brts[[1]],
      FUN = DDD::brts2phylo,
      root = FALSE,
      tip.label = NULL
    )

  tree
}
