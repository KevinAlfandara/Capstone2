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
      menuItem("Distribution",
                  tabName = "dstb",
                  icon = icon("fa-duotone fa-route")
      ),
      menuItem("Country",
               tabName = "ctr",
               icon = icon("fa-duotone fa-earth-americas")),
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
                        icon = icon("fa-duotone fa-earth-americas"),
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
      #         fluidRow(
      #           box(
      #             background = "olive",
      #             width = 12,
      #             br(),
      #             sliderInput("release_year",
      #                         "Select Range:",
      #                         min = 1925,
      #                         max = 2021,
      #                         value = c(1925,max(2021)),
      #                         step= 1,
      #                         round = FALSE,
      #                         tick = FALSE
      #             )),
      #           ),
      #             box(width = 12,
      #               plotlyOutput(outputId = "plot_scatterplot"
      #                            ))
      ),
      
      #PAGE 2
      tabItem(tabName = "dstb",
              fluidRow(
                box(
                  background = "olive",
                  br(),
                  sliderInput("release_year",
                              "Select Range:",
                              min = 1925,
                              max = 2021,
                              value = c(1925,max(2021)),
                              step= 1,
                              round = FALSE,
                              tick = FALSE

                  )),

              ),

              box(width = 12,
                  plotlyOutput(outputId = "plot_scatterplot"))

      ),
      #page 3
      tabItem(tabName = "ctr",
              fluidRow(
                box(width = 12,selectInput(
                  inputId = "yearbetween",
                  label = "Choose Year",
                  choices = sort(unique(type_tvshow$release_year)),
                  selected = "2019"),
                  box(width = 12,
                      plotlyOutput(outputId = "ct1"))
              )
      )),
      
      # PAGE 4
      tabItem(tabName = "tab_data",
              markdown(
                "
                # Data Set Netflix Movies and TV Shows
                source : https://www.kaggle.com/datasets/shivamb/netflix-shows/code?datasetId=434238&sortBy=commentCount&language=R&outputs=Visualization
                # About Data Set
                Netflix is one of the most popular media and video streaming platforms. They have over 8000 movies or tv shows available on their platform, as of mid-2021, they have over 200M Subscribers globally. This tabular dataset consists of listings of all the movies and tv shows available on Netflix, along with details such as - cast, directors, ratings, release year, duration, etc.
                
                + Resource Type :	Dataset
                + License	: CC0: Public Domain
                + Owner : Shivam Bansal
                "
              ),
              fluidRow(
                box(width = 12,
                    DT::dataTableOutput("table1"))
              )
              
      )
    )
  ))