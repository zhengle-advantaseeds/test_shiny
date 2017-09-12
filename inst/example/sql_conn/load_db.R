library(RMySQL)

load_db = function(){
  source('./connection.R', local=T)
  db = connection()
  main_data = dbReadTable(db, 'recording_table')
  crop_select = dbReadTable(db, 'crop')
  dbDisconnect(db)
  return(list(
    main_data = main_data
    , crop_select = crop_select
    ))
}
