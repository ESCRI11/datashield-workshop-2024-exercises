#' @export
ds.mean2 <- function(numeric_vector, datasources = NULL) {
	if(is.null(datasources)){
		datasources <- datashield.connections_find()
	}
	calltext <- paste0(
		"mean2DS(", numeric_vector, ")"
	)
	mean_results <- DSI::datashield.aggregate(datasources, calltext)
	upper <- lapply(mean_results, function(x){
		x[["vector_mean"]]*x[["vector_n"]]
	}) |> unlist() |> sum()
	lower <- lapply(mean_results, function(x){
		x[["vector_n"]]
	}) |> unlist() |> sum()
  return(upper/lower)
}
