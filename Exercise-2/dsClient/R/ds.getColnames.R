#' @export
ds.getColnames <- function(table, datasources = NULL) {
	if(is.null(datasources)){
		datasources <- datashield.connections_find()
	}
	calltext <- paste0(
		"getColnamesDS(", table, ")"
	)
	colnames <- DSI::datashield.aggregate(datasources, calltext)
  	return(colnames)
}
