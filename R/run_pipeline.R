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
run_pipeline <- function(n_param_sets_to_run,
                         save_to_file = TRUE,
                         test_seed = FALSE) {
  if (!exists("param_space")) {
    param_space <- utils::read.csv(
      file = system.file(
        "extdata",
        "ve_USE_parameters_full.csv",
        package = "phylometricsims",
        mustWork = TRUE
      )
    )
  }

  pb <- utils::txtProgressBar(min = 0, max = n_param_sets_to_run, style = 3)

  if (test_seed) {
    set.seed(
      1,
      kind = "Mersenne-Twister",
      normal.kind = "Inversion",
      sample.kind = "Rejection"
    )
  } else {
    seed_time <- as.numeric(Sys.time())
    set.seed(
      seed_time,
      kind = "Mersenne-Twister",
      normal.kind = "Inversion",
      sample.kind = "Rejection"
    )
  }
  output_list <- list()
  valid_param_set <- 1

  if (save_to_file) {
    out_data_frame <- data.frame(
      "simID" = numeric(),
      "lac" = numeric(),
      "mu" = numeric(),
      "K" = numeric(),
      "gam" = numeric(),
      "laa" = numeric(),
      "totaltime" = numeric()
    )
    utils::write.csv(
      x = out_data_frame,
      file = "ve_USE_parameters.csv",
      row.names = FALSE
    )
    saveRDS(object = seed_time, file = "seed_time.rds")
  }

  for (param_set in seq_len(n_param_sets_to_run)) {

    sim_pars <- param_space[param_set, ]

    iw_sims <- run_iw_sims(
      sim_pars = sim_pars,
      n_mainland_spec = 1000
    )

    if (iw_sims[[1]][[1]]$not_present == 1000) {
      next
    }

    iw_brts <- extract_first_lineage_brts(iw_sims = iw_sims)
    phylo <- brts2phylo(times = iw_brts, root = FALSE, tip.label = NULL)

    output <- list(iw_sims = iw_sims, iw_brts = iw_brts, phylo = phylo)

    if (save_to_file && length(phylo$tip.label) >= 20) {
      Sys.sleep(0.1)
      output_name <- paste0("ve_", param_set, ".rds")
      if (!dir.exists("output")) dir.create("output")
      output_path <- file.path("output", output_name)

      tree_name <- paste0("ve_", valid_param_set, ".tre")
      if (!dir.exists("trees")) dir.create("trees")
      tree_path <- file.path("trees", tree_name)
      ape::write.tree(phy = phylo, file = tree_path)
      valid_param_set_line <- data.frame(
        "simID" = valid_param_set,
        sim_pars[2:7]
      )

      utils::write.table(
        x = valid_param_set_line,
        file = "ve_USE_parameters.csv",
        append = TRUE,
        col.names = FALSE,
        row.names = FALSE
      )
      saveRDS(object = output, file = output_path)
      valid_param_set <- valid_param_set + 1
    }
    output_list[[param_set]] <- output
    utils::setTxtProgressBar(pb, param_set)
  }

  return(output_list)
}
