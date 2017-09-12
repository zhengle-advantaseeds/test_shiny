library(shiny)

ui = fluidPage(
  fluidRow(
    titlePanel(title=div(img(src='advanta.png', align='center'), 'Git_0.0.0.9000'))
    )

  , fluidRow(
    column(width=2, align='left'
       , uiOutput('crop_tmp'))
    , column(width=2, align='left'
       , uiOutput('trait_tmp'))
    , column(width=2, align='left',
       actionButton('new_trait', 'Add New Trait', width=150, style='height:58px'))
    , column(width=2, align='left'
      , textInput('MeasureUnit', 'MeasureUnit', width=100, placeholder='*Character'))
    , column(width=2, align='left'
      , textInput('Phenotype', 'Pheno', value='', width=50, placeholder='*Character'))
    , column(width=2, align='left'
      , textInput('PopGen', 'PopGen', value='', width=100, placeholder='*Character'))
    )

  , fluidRow(
    column(width=2, align='left'
      , textInput('MapName', 'MapName', value='', width=150, placeholder='*Character'))
    , column(width=4, align='left'
      , textInput('RawData', 'Raw Data File', value='', width=350, placeholder='Character'))
    , column(width=4, align='left'
      , textInput('Report', 'Report File', value='', width=350, placeholder='Character'))
    , column(width=2, align='left'
      , textInput('Year', 'Year of Report', value='', width=120, placeholder='*Integer'))
    )

  , fluidRow(
    column(width=2, align='left'
      , textInput('Lkg', 'Linkage Group', value='', width=120, placeholder='*Character'))
    , column(width=2, align='left'
      , textInput('LLEN', 'Linkage Length', value='', width=120, placeholder='Float'))
    , column(width=2, align='left'
      , textInput('QTLNo', 'QTL Number', value='', width=100, placeholder='*Integer'))
    , column(width=2, align='left'
      , textInput('NQTL', 'Total QTL', value='', width=100, placeholder='*Integer'))
    , column(width=2, align='left'
      , textInput('Position', 'QTL position', value='', width=100, placeholder='*Float'))
    , column(width=2, align='left'
      , selectInput('PerfectMarker', 'Perfect Marker', choices=c('N', 'Y'), width=120))
    )

  , fluidRow(
    column(width=3, align='left'
      , textInput('LFM', 'Flanking Marker (L)', value='', width=150, placeholder='*Character'))
    , column(width=3, align='left'
      , textInput('DLFM', 'Distance to QTL (L)', value='', width=150, placeholder='*Float'))
    , column(width=3, align='left'
      , textInput('LFMLOD', 'LOD (L)', value='', width=100, placeholder='Float'))
    )

  , fluidRow(
    column(width=3, align='left'
      , textInput('RFM', 'Flanking Marker (R))', value='', width=150, placeholder='*Character'))
    , column(width=3, align='left'
      , textInput('DRFM', 'Distance to QTL (R)', value='', width=150, placeholder='*Float'))
    , column(width=3, align='left'
        , textInput('RMLOD', 'LOD (R)', value='', width=100, placeholder='Float'))
      )

  , fluidRow(
    column(width=3, align='left'
      , textInput('HighValueParent', 'High Value Parent', value='', width=150, placeholder='Character'))
    , column(width=3, align='left'
      , textInput('LowValueParent', 'Low Value Parent', value='', width=150, placeholder='Character'))
      )

  , fluidRow(
    column(width=10, align='center',
      actionButton('submit', 'Submit', width=280, style='height:58px'))
      )

  , DT::dataTableOutput('main_data', width=1000)
  )
