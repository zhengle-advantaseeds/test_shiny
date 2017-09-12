#' @export

runDEMO <- function() {
  # locate all the shiny app examples that exist
	appDir <- system.file("example", 'sql_conn', package = "testShinyDemo")
	if(appDir == ''){
		stop('Could not locate the shiny package', call.=F)
	}
	shiny::runApp(appDir, display.mode='normal')
  
}