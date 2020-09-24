## code to prepare `param_space` dataset goes here


# Generation method adapted from Allen Hurlbert's code

paramLimits = data.frame(parameter = c('w', 'alpha', 'beta', 'sigma_E'),
                         min = c(1, -8, -7, 1),
                         max = c(11, -4, -2, 11))


# Function for sampling parameter space

sampleParams = function(paramLimits, n = 1000, seed = 1, startingSimID = 1) {
  set.seed(seed)

  output = data.frame(simID = startingSimID:(startingSimID + n - 1))

  for (i in 1:nrow(paramLimits)) {
    output = cbind(output,
                   data.frame(runif(n)*(paramLimits$max[i] - paramLimits$min[i]) + paramLimits$min[i]))
  }
  names(output)[2:ncol(output)] = as.character(paramLimits$parameter)

  return(output)
}


usethis::use_data(param_space, overwrite = TRUE)
