trait_dropdown=function(input){
  renderUI({
  if(is.null(input$Crop))return()
  tmp.select = paste0('trait_', input$Crop)
  db = connection()
  tmp.opt = dbReadTable(db, tmp.select)[,1,drop=T]
  selectInput('Trait', 'Trait', tmp.opt)
  })
}
