library(shiny)
library(RMySQL)

server = function(input, output, session){
  source('./connection.R')
  source('./load_db.R')
  source('./trait_dropdown.R')

  output$crop_tmp = renderUI({
    selectInput('Crop', 'Crop', load_db()$crop_select[,1,drop=T])
    })

  output$trait_tmp = trait_dropdown(input)

  observeEvent(input$new_trait, {
    tmp.crop.trait = load_db()$crop_select[,1,drop=T]
    showModal(modalDialog(
      textInput('added_trait', 'New Trait Name', width=150)
      , selectInput('new_trait_crop', 'Crop', tmp.crop.trait)
      , actionButton('add', 'Add')
      , easyClose=F))
    })

  observeEvent(input$add, {
    db = connection()
    id.add = paste0('trait_', input$new_trait_crop)
    dbWriteTable(db, id.add, data.frame(Trait=input$added_trait), append=T, row.name=F)
    dbDisconnect(db)
    showModal(modalDialog(
      title='The new trait has been added sucessfully'
      , easyClose=T))
    output$trait_tmp = trait_dropdown(input)
  })

  output$main_data = DT::renderDataTable({load_db()$main_data})
  observeEvent(input$submit, {
    output$main_data = DT::renderDataTable({
      input$submit
      load_db()$main_data
    })
  })

  observeEvent(input$submit, {
    db = connection()
    id = names(load_db()$main_data)[-1]
    tmp.1 = Sys.time()
    tmp.2 = Sys.info()
    tmp.dta = data.frame(
        TimeStamp = tmp.1
        , t(sapply(id, function(x) input[[x]]))
        )
    tmp.reco = data.frame(TimeStamp = tmp.1, OS = tmp.2[1], nodeName = tmp.2[4], login = tmp.2[6])
    dbWriteTable(db, 'Hidden_recording', tmp.reco, append=T, row.names=F)
    dbWriteTable(db, 'recording_table', tmp.dta, append=T, row.names=F)
    dbDisconnect(db)
    })

    session$onSessionEnded(function(){
        stopApp()
        q("no")
        })
}
