#' @export
ds.mean <- function(numeric_vector, datasources = NULL) {
	if(is.null(datasources)){
		datasources <- datashield.connections_find()
	}
	calltext <- call("dsServer::meanDS", numeric_vector)
	mean_results <- DSI::datashield.aggregate.expr(datasources, calltext)
  return(n_cols)
}
