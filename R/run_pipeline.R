#' Run the pipeline for a single parameter set
#'
#' @inheritParams default_params_doc
#'
#' @return Save output to output and trees folder. Generate .tree file if >
#'   20 tips are created.
#' @export
#'
#' @examples
#' run_pipeline(param_set = 1)
run_pipeline <- function(param_set,
                         n_replicates = 1,
                         seed_start = 1) {

  load("data/param_space.rda")
  sim_pars <- param_space[param_set, ]

  iw_sims <- run_iw_sims(
    n_replicates = n_replicates,
    sim_pars = sim_pars,
    n_mainland_spec = 1000,
    seed_start = seed_start
  )

  iw_brts <- extract_first_lineage_brts(iw_sims)

  phylo <- convert_to_phylo(iw_brts)

  output <- list(iw_sims = iw_sims, iw_brts = iw_brts, phylo = phylo)
  sim_ID <- as.character(sim_pars[param_set, 1])

  output_name <- paste0("ve_", sim_ID, ".rds")
  if(!dir.exists("output")) dir.create("output")
  output_path <- file.path("output", output_name)

  tree_name <- paste0("ve_", sim_ID, ".tree")
  if(!dir.exists("trees")) dir.create("trees")
  tree_path <- file.path("trees", tree_name)

  for (replicate in n_replicates) {
    if (length(phylo[[replicate]]$tip.label) >= 20) {
      ape::write.tree(phy = phylo[[replicate]], file = tree_path)
    }
  }
      saveRDS(object = output, file = output_path)


}

