#' @export
getColnamesDS <- function(table) {
  myFilter <- getOption("nice.filter")
  n_cols <- ncol(table)
  if (n_cols < myFilter) {
    stop("Number of columns is lower than filter")
  }
  return(n_cols)
}
