#' @export
mean2DS <- function(numeric_vector) {
  myMeanFilter <- getOption("myMeanFilter")
  vector_mean <- mean(numeric_vector)
  vector_n <- length(numeric_vector)
  if (vector_n < myMeanFilter) {
    stop("Number of observations is lower than filter")
  }
  return(list(
    vector_mean = vector_mean,
    vector_n = vector_n
  ))
}
