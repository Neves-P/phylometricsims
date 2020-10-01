## code to prepare `param_space` dataset goes here


# Generation method adapted from Allen Hurlbert's code

param_limits <- data.frame(
  parameter = c("lac", "mu", "K", "gam", "laa", "totaltime"),
  min = c(1, .0001, 20, 0.0001, 0, 10),
  max = c(4, 3, 150, 0.001, 1.5, 10)
)


# Function for sampling parameter space

sample_params <- function(param_limits, n = 1000, seed = 1, startingSimID = 1) {
  set.seed(seed)

  output <- data.frame(simID = startingSimID:(startingSimID + n - 1))

  for (i in 1:nrow(param_limits)) {
    output <- cbind(output,
                   data.frame(runif(n) *
                                 (param_limits$max[i] -
                                    param_limits$min[i]) + param_limits$min[i]))
  }
  names(output)[2:ncol(output)] = as.character(param_limits$parameter)

  return(output)
}

param_space <- sample_params(param_limits)

write.csv(x = param_space, file = "data/param_space.csv", row.names = FALSE)

