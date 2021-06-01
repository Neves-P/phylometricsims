#' Run the pipeline for a single parameter set
#'
#' Runs the full pipeline one parameter set (i.e., one row of the
#' param_space.csv file). DAISIE simulations are generated, the first lineage,
#' if any, is extracted. Associated branching times are converted to a phylo
#' object which is then saved as a .tre file to the /trees folder, if there are
#' more than 20 tips. Intermediate objects are saved as they are generated to
#' output folder, as a list. See details in the Return section.
#'
#' @inheritParams default_params_doc
#'
#' @return
#' Saves output object to output and trees folder. Generate .tree file if >
#' 20 tips are created.
#' Output object is a list containing the following elements:
#' * DAISIE IW simulation objects
#' * Corresponding vector of branching times
#' * Corresponding branching times converted to phylo objects
#' @export
#'
#' @author Pedro Neves
run_pipeline <- function(param_set,
                         save_to_file = TRUE) {
  if (!exists("param_space")) {
    param_space <- utils::read.csv(
      file = system.file(
        "extdata",
        "ve_USE_parameters.csv",
        package = "phylometricsims",
        mustWork = TRUE
      )
    )
  }
  sim_pars <- param_space[param_set, ]

  iw_sims <- run_iw_sims(
    sim_pars = sim_pars,
    n_mainland_spec = 1000
  )

  if (iw_sims[[1]][[1]]$not_present == 1000) {
    return()
  }

  iw_brts <- extract_first_lineage_brts(iw_sims = iw_sims)
  phylo <- brts2phylo(times = iw_brts, root = FALSE, tip.label = NULL)

  output <- list(iw_sims = iw_sims, iw_brts = iw_brts, phylo = phylo)
  sim_id <- as.character(sim_pars[1])

  if (save_to_file && length(phylo$tip.label) >= 20) {
    output_name <- paste0("ve_", sim_id, ".rds")
    if (!dir.exists("output")) dir.create("output")
    output_path <- file.path("output", output_name)

    tree_name <- paste0("ve_", sim_id, ".tre")
    if (!dir.exists("trees")) dir.create("trees")
    tree_path <- file.path("trees", tree_name)
    ape::write.tree(phy = phylo, file = tree_path)

    saveRDS(object = output, file = output_path)
  } else {
    return(output)
  }
}
