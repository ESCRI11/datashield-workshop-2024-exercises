#' @export
ds.getColnames <- function(table, datasources = NULL) {
	if(is.null(datasources)){
		datasources <- datashield.connections_find()
	}
	calltext <- call("dsServer::getColnamesDS", string)
	n_cols <- DSI::datashield.aggregate.expr(datasources, calltext)
  return(n_cols)
}
