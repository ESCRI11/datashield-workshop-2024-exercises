#' @export
getColnamesDS <- function(table) {
  myFilter <- getOption("myFilter")
  colnames <- colnames(table)
  if (length(colnames) < myFilter) {
    stop("Number of columns is lower than filter")
  }
  return(colnames)
}
