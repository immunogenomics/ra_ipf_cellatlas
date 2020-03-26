tabPanel(
  "Home",

  mainPanel(
    h3("Welcome"),
    
    p(
      "This site provides access to view the data from the",
      a("Accelerating Medicines Partnership (AMP)",
        href = "https://www.nih.gov/research-training/accelerating-medicines-partnership-amp"),
      "SLE Phase I project."
    ),
    br(),
    
    p(
      "To learn more about this project, please refer to our preprint paper available at",
      a("bioRxiv:",
          href = "https://www.biorxiv.org/content/early/2018/07/07/363051"),
      strong(
        "The immune cell landscape in kidneys of lupus nephritis patients"
      )
    ),
    br(),
    
    p( 
      "Please feel free to explore the site.",
      "On this site, we provide an interactive view of the single-cell RNA-seq data.",
      "To access the full data, please go to",
      a("ImmPort.",
        href = "http://immport.org"
      )
      # "with the study accession code of SDY998 and SDY999."
    ),
    br(),
    
    p(
      "Please", 
      a("contact us", href = "mailto:support@immunogenomics.io"),
      "if you have any questions, requests, or comments",
      " on the analysis and results."
    ),
    
    h5("Overview for collecting and processing kidney and urine samples", align = "center"),
    img(src='sle_pipeline.png', width = 570, align = "left"),
    br(),
    br()

  ) # mainPanel
  
) # tabPanel
