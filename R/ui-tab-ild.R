tabPanel(
  
  "Lung Cell Viewer",
  
  h4("Identified single-cell RNA-seq clusters in RA-ILD, RA-UIP, and healthy lung"),
  
  fluidRow(
    column(
      width = 10,
      wellPanel(
        radioButtons(
          inputId  = "cell_type",
          inline   = TRUE,
          label    = "Cell type:",
          choices  = possible_cell_types_rna,
          selected = "all"
        )
      )
    )
  ),
  
  
  tabsetPanel(selected = "Single-cell RNA-seq",
              
              tabPanel(
                "Single-cell RNA-seq",
                
                # Show a plot of the generated distribution
                fluidPage(
                  fluidRow(
                    
                    column(
                      width = 10,
                      div(
                        htmlOutput("tnse_marker_plot", height = "500px"),
                        style = "height: 500px;"
                      )
                    )
                    
                    # column(
                    #   width = 3,
                    #   wellPanel(radioButtons(
                    #     inputId  = "cell_type",
                    #     # inline   = TRUE,
                    #     label    = "Cell type:",
                    #     choices  = possible_cell_types_rna,
                    #     selected = "all"
                    #   ))
                    # tableOutput("cluster_table")
                  )
                  
                ),
                hr(),
                fluidRow(
                  column(
                    width = 10,
                    htmlOutput("box_marker_plot_all", height = "500px")
                  ),
                  column(
                    width = 10,
                    DT::dataTableOutput("dg_table", height = "300px")
                  )
                )
                # hr(),
                # fluidRow(
                #   column(
                #     width = 5,
                #     htmlOutput("bulk_dots", height = "500px")
                #   )
                # )
                #)
                
              ), # tabPanel
              
        
              
              mainPanel(
                h4("Cluster annotations (to be added):"),
                p(strong("AT1:    "), "",
                  strong("AT2:    "), "",
                  strong("AT2 a:    "), "",
                  strong("AT2 b:    "),""),

                p(strong("C1:    "), "",
                  strong("C2:    "), "",
                  strong("C3:    "), ""),

                p(strong("E1:    "), "",
                  strong("E2:    "), "",
                  strong("E3:    "), ""),

                p(strong("F0:    "), "",
                  strong("F1:    "), "",
                  strong("F2:    "), "",
                  strong("F3:    "), "",
                  strong("F4:    "), "",
                  strong("F5:    "), "",
                  strong("F6:    "), "",
                  strong("F7:    "), "",
                  strong("F8:    "), ""),
                
                p(strong("M0"), "",
                  strong("M2"), "",
                  strong("M3"), "",
                  strong("M4"), "",
                  strong("M5"), "",
                  strong("M6"), "",
                  strong("M7"), "",
                  strong("M8"), "",
                  strong("M9"), ""),
                
                p(strong("T0"), "",
                  strong("T1"), "",
                  strong("T2"), "",
                  strong("T3"), "",
                  strong("T4"), "",
                  strong("T5"), "",
                  strong("T6"), "",
                  strong("T7"), "",
                  strong("T8"), "",
                  strong("T9"), "",
                  strong("T10"), "",
                  strong("T11"), "")
              ),
            
              br()
              
  ) # tabsetPanel
  
) # tabPanel
