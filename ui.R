dashboardPage(
  skin = "green",
  
  # HEADER
  dashboardHeader(title = "Movie and Tv Show"
                  # dropdownMenu(type = "message",
                  #              messageItem(from = "Sales Update",
                  #                          message = "New Update Data Sales",
                  #                          icon = icon("envelope"),
                  #                          time = "22:00")
                  #              )
  ),
  
  # SIDEBAR
  dashboardSidebar(
    sidebarMenu(
      # #sidebarSearchForm("searchText",
      #                   "buttonSearch",
      #                   "Search"),
      menuItem("Dashboard", 
               tabName = "tab_overview", 
               icon = icon("dashboard"
               )),
      # menuSubItem("Dashboard Movie", 
      #             tabName = "dash_movie"
      #             #icon = icon("video")
      # ),
      menuItem("Data", 
               tabName = "tab_data", 
               icon = icon("table")),
      
      menuItem("Source Code", icon = icon("display"), 
               href = "https://github.com/KevinAlfandara/Capstone2"))
               # badgeLabel = "New",
               # badgeColor = "maroon"
      ),
      # menuItem("Data", 
      #          tabName = "tab_data", 
      #          icon = icon("table"))
      # sliderInput("tab_overview",
      #             "Slider input:",
      #             1, 100, 50),
      # textInput("text_input",
      #           "Search Opportunities",
      #           value = "123")
    #)
  
  
  
  # BODY
  dashboardBody(
    tabItems(
      # PAGE 1
      tabItem(tabName = "tab_overview",
              #ROW1 -> infobox
              fluidRow(
                infoBox("TOTAL Watching", 
                        6131 + 2676, 
                        icon = icon("video"),
                        color = "red"),
                infoBox("TOTAL UNIQUE Director", 
                        length(unique(netflix$director)),
                        icon = icon("video"),
                        color = "black"),
                infoBox("Total Country", 
                        length(unique(netflix$country)),
                        icon = icon("location"),
                        color = "red")
              ),
              
              #ROW 2 -> plot
              fluidRow(
                box(width = 12,
                    #plotOutput("histogram")
                    # title = "Visualisasi Bar Plot",
                    #         status = "primary",
                    #         solidHeader = T,
                    plotlyOutput(outputId = "db1")
                )
              ),
              
              #ROW 3 -> plot
              fluidRow(
                box(width = 12,
                    plotlyOutput(outputId = "plot_bar")
                    
                )
              )
      ),
      #sub item movie
      # tabItem(tabName = "dash_movie",
      #         fluidRow(
      #           box(width = 12,
      #               plotlyOutput(outputId = "movie1")
      #           )
      #           #   box(sliderInput("tv1",
      #           #                   "Slider input:",
      #           #                   1, 1000, 50))
      #         )
      # ),
      
      #sub item tv show
      #tabItem(tabName = "dash_tvshow",
              # fluidRow(
              #   box(width = 12,
              #       plotlyOutput(outputId = "tvshow1")
              #       
              #   )
              # ),
              # fluidRow(
              #   box(width = 12,
              #       plotlyOutput(outputId = "tvshow2"))
              # ),
              # fluidRow(
              #   box(width = 12,
              #       plotlyOutput(outputId = "tvshow3"))
              #)
              # fluidRow(
              #   box(width = 12,
              #       plotlyOutput(outputId = "tvshow4"))
              # )
              
      #),
      
      # PAGE 2
      # tabItem(tabName = "tab_channel",
      #         h1("Halaman 2")
              
      # ),
      
      # PAGE 3
      tabItem(tabName = "tab_data",
              fluidRow(
                box(width = 12,
                    DT::dataTableOutput("table1"))
              )
              
      )
    )
  ))