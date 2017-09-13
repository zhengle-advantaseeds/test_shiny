library(RMySQL)

connection = function(){
  dbConnect(MySQL(), user='sql3185656', password='eF35cR8xWA', host='sql3.freemysqlhosting.net', port=3306, dbname='sql3185656')
#  dbConnect(MySQL(), user='root', host='localhost', port=3306, dbname='tt')
}
