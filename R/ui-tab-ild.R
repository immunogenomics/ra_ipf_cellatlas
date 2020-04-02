tabPanel(
  # "Lung",
  "Data Viewer",
  
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
                        htmlOutput("tnse_marker_plot", height = "400px"),
                        style = "height: 400px;"
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
                    DT::dataTableOutput("dg_table", height = "350px")
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
              
        
              
              # mainPanel(
              #   h4("Cluster annotations:"),
              #   p(strong("SC-F1:"), "CD34+ sublining fibroblasts;",
              #     strong("SC-F2:"), "HLA+ sublining fibroblasts;",
              #     strong("SC-F3:"), "DKK3+ sublining fibroblasts;",
              #     strong("SC-F4:"), "CD55+ lining fibroblasts;"),
              #   
              #   p(strong("SC-M1:"), "IL1B+ pro-inflammatory monocytes;",
              #     strong("SC-M2:"), "NUPR1+ monocytes;",
              #     strong("SC-M3:"), "C1QA+ monocytes;",
              #     strong("SC-M4:"), "IFN-activated monocytes;"),
              #   
              #   p(strong("SC-T1:"), "CCR7+ CD4+ T cells;",
              #     strong("SC-T2:"), "FOXP3+ Tregs;",
              #     strong("SC-T3:"), "PD-1+ Tph/Tfh;",
              #     strong("SC-T4:"), "GZMK+ CD8+ T cells;",
              #     strong("SC-T5:"), "GNLY+ GZMB+ CTLs;",
              #     strong("SC-T6:"), "GZMK+/GZMB+ T cells;"),
              #   
              #   p(strong("SC-B1:"), "IGHD+ CD270 naive B cells;",
              #     strong("SC-B2:"), "IGHG3+ CD27- memory B cells;",
              #     strong("SC-B3:"), "autoimmune-associated cells (ABC);",
              #     strong("SC-B4:"), "Plasmablasts")
              # ),
              br()
              
  ) # tabsetPanel
  
) # tabPanel
