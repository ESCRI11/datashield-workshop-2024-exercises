#' @export
ds.assign.string <- function(object, string, datasources = NULL) {
	if(is.null(datasources)){
		datasources <- datashield.connections_find()
	}
	calltext <- call("dsServer::assignStringDS", string)
	DSI::datashield.assign(datasources, object, calltext)
}
