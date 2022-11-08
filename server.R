shinyServer(function(input, output){
  #dashboard 1
  output$db1 <- renderPlotly({
    db1 <- 
      netflix %>% 
      select(rating, type) %>%
      filter(!is.na(rating)) %>%
      mutate(rating = fct_lump(rating, 5)) %>%
      group_by(rating, type) %>%
      summarise(Count = n(),.groups = 'drop') %>%
      arrange(Count) %>%
      plot_ly(
        x = ~ type ,
        y = ~ Count,
        type = "bar",
        color = ~ rating,
        text = ~ Count,
        textposition = 'outside',
        textfont = list(color = '#000000', size = 12)
      ) %>%
      layout(yaxis = list(categoryorder = "array",
                          categoryarray = ~ Count)) %>%
      layout(
        title = "Rating by Type",
        yaxis = list(title = "Count"),
        xaxis = list(title = "Type"),
        legend = list(title = list(text = '<b> Rating </b>'))
      )
  })
  # #dashboard 2
  # output$db2 <- renderPlotly({
  #   db2 <- 
  #     netflix %>% count(type, sort = T) %>%
  #     mutate(prop = paste0(round(n / sum(n) * 100, 0), "%")) %>%
  #     ggplot(aes(x = "", y = prop, fill = type)) +
  #     geom_bar(
  #       stat = "identity",
  #       width = 1,
  #       color = "steelblue",
  #       size = 1
  #     ) +
  #     coord_polar("y", start = 0) +
  #     geom_text(
  #       aes(y = prop, label = prop),
  #       position = position_stack(vjust = 0.5),
  #       size = 6,
  #       col = "white",
  #       fontface = "bold"
  #     ) +
  #     scale_fill_manual (values = c('#e41a1c', '#377eb8')) +
  #     theme_void() +
  #     labs(
  #       title = "Are Movies on Netflix more than TV shows?",
  #       #subtitle = "Pie Plot, proportion of Movies to TV shows",
  #       #caption = "Kaggle: Netflix Movies and TV Shows",
  #       fill = ""
  #     )
  # })
  
  #output plot 1
  # output$plot_bar <- renderPlotly({
  #   
  #   Movie_vs_TV_Show <-
  #     netflix %>%
  #     group_by(type) %>%
  #     summarise(Total = n())
  #   
  #   
  #   Movie_vs_TV_Show <-
  #     Movie_vs_TV_Show %>%
  #     mutate(label = glue("Type : {type}
  #                       Total  : {comma(Total)}"))
  #   
  #   
  #   plot1 <- ggplot(data = Movie_vs_TV_Show,
  #                   mapping = aes(text = label)) +
  #     geom_col(mapping = aes(x = type,
  #                            y = Total,
  #                            fill = type)) +
  #     labs(title = "Amount of content per type",
  #          x = "Type of content",
  #          y = "Amount of content") +
  #     theme(legend.position = "none")
  #   #theme_minimal()
  #   
  #   
  #   ggplotly(plot1, tooltip = "text")
  # })
  
  #buat output 2 dashboard Movie
  # output$movie1 <- renderPlotly({
  #   
  #   movies_world <- 
  #     type_movie %>% 
  #     group_by(type) %>% 
  #     group_by(country) %>% 
  #     filter(!is.na(country)) %>%
  #     summarise(num_movies_country = n()) %>%
  #     arrange(desc(num_movies_country)) %>% 
  #     slice(1:20)
  #   
  #   
  #   movies_world <- 
  #     movies_world %>% 
  #     mutate(label = glue("Country : {country}
  #                         Total  : {comma(num_movies_country)}"))
  #   
  #   plot1 <- 
  #     ggplot(data = movies_world,
  #            mapping = aes(text = label,
  #                          x = country, 
  #                          y = num_movies_country, 
  #                          fill = country,
  #            )) +
  #     geom_bar(stat = "identity", 
  #              position = "dodge") +
  #     coord_flip() +
  #     labs(title = "Number of movie content per country", 
  #          x = "", 
  #          y = "Number Of Content") +
  #     theme_minimal()+
  #     theme(legend.position = "none")
  #   # scale_x_continuous(labels = comma)
  #   
  #   ggplotly(plot1, tooltip = "text")
  #})
  
  #buat output 2 dashboard Movie
  # output$tvshow1 <- renderPlotly({
  #   tvshow_world <-
  #     type_tvshow %>%
  #     group_by(type) %>%
  #     group_by(country) %>%
  #     filter(!is.na(country)) %>%
  #     summarise(num_tvshow_country = n()) %>%
  #     slice(1:20)
  # 
  #   tvshow_world <-
  #     tvshow_world %>%
  #     mutate(label = glue("Country : {country}
  #                         Total  : {comma(num_tvshow_country)}"))
  # 
  #   plot2 <-
  #     ggplot(data = tvshow_world,
  #            mapping = aes(text = label,
  #                          x = country,
  #                          y = num_tvshow_country,
  #                          fill = country,
  #            )) +
  #     geom_bar(stat = "identity",
  #              position = "dodge") +
  #     coord_flip() +
  #     labs(title = "Amount of TV Show per country",
  #          x = "",
  #          y = "Number Of Content") +
  #     theme_minimal()+
  #     theme(legend.position = "none")
  #    # scale_x_continuous(labels = comma)
  # 
  #   ggplotly(plot2, tooltip = "text")
  # 
  #   #hist(netflix$tvshow1, breaks = input$tv1)
  #  })
  
  #tv show 2
  # output$tvshow2 <- renderPlotly({
  #   
  #   df_by_rating_only_full <- type_movie %>% 
  #     group_by(rating) %>% 
  #     summarise(count = n())
  #   fig6 <- 
  #     plot_ly(df_by_rating_only_full, 
  #                   labels = ~rating, 
  #                   values = ~count, type = 'pie')
  #   fig6 <- fig6 %>% layout(title = 'Amount Of Content By Rating',
  #                           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
  #                           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  #   
  #   fig6
  # })
  
  #tvshow3
  # output$tvshow3 <- renderPlotly({
  #   netflix %>% select(country) %>%
  #     filter(!is.na(country)) %>%
  #     mutate(country = fct_lump(country, 10)) %>%
  #     group_by(country) %>%
  #     summarise(Count = n()) %>%
  #     arrange(Count) %>%
  #     plot_ly(
  #       x = ~ Count ,
  #       y = ~ country,
  #       type = "bar",
  #       orientation = 'h'
  #     ) %>%
  #     layout(yaxis = list(categoryorder = "array", categoryarray = ~ Count)) %>%
  #     layout(
  #       title = "Items distribution by Country",
  #       yaxis = list(title = "Country"),
  #       xaxis = list(title = "Count")
  #     )
  # })
  
  output$plot_scatterplot <- renderPlotly({

    year_start <- input$release_year[1]
    year_end <- input$release_year[2]
    
    type_tvshow <-
      type_tvshow %>%
      filter(release_year >= year_start & release_year <= year_end) %>%
      group_by(release_year,duration) %>%
      summarise(Count = n(),.groups = 'drop') %>% 
      arrange(desc(Count)) 

    type_tvshow <-
      type_tvshow %>%
      mutate(
        label = glue("Tahun :{release_year} 
                     Distribusi : {duration}")
                          )

    plot2 <- ggplot(data = type_tvshow,
                    mapping = aes(
                                  x = release_year,
                                  y = duration,
                                  text = label
                    )) +
      geom_point(aes(size = release_year),col = "red", alpha = 0.2) +
      labs(title = glue("TV Show Duration Per Year"),
           x = "Release Year",
           y = "Seasons") +
      theme_minimal()
    
    plot2
    
    ggplotly(plot2,tooltip="text")


  })
  
  output$ct1 <- renderPlotly({
    tvshow_world <- 
      type_tvshow %>% 
      filter(type_tvshow$release_year == input$yearbetween) %>%
      group_by(type) %>% 
      group_by(country) %>% 
      filter(!is.na(country)) %>%
      summarise(num_tvshow_country = n()) %>%
      slice(1:20)
    
    tvshow_world <- 
      tvshow_world %>% 
      mutate(label = glue("Country : {country}
                          Total  : {comma(num_tvshow_country)}"))
    
    plot2 <- 
      ggplot(data = tvshow_world,
             mapping = aes(text = label,
                           x = country, 
                           y = num_tvshow_country, 
                           fill = country,
             )) +
      geom_bar(stat = "identity", 
               position = "dodge") +
      coord_flip() +
      labs(title = "Amount of TV Show Per Country", 
           x = "", 
           y = "Number Of Content") +
      theme_minimal()+
      theme(legend.position = "none")
    # scale_x_continuous(labels = comma)
    
    ggplotly(plot2, tooltip = "text")
    
  })
  
  
  # output$plot_scatterplot <- renderPlotly({ 
  #   
  #   year_start <- input$release_year[1]
  #   year_end <- input$release_year[2]
  #   
  #   type_tvshow %>% 
  #     select(country) %>%
  #     filter(release_year >= year_start & release_year <= year_end) %>%
  #     filter(!is.na(country)) %>%
  #     mutate(country = fct_lump(country, 10)) %>%
  #     group_by(country) %>%
  #     summarise(Count = n()) %>%
  #     arrange(Count) %>%
  #     plot_ly(
  #       x = ~ Count ,
  #       y = ~ country,
  #       type = "scatter",
  #       orientation = 'h'
  #     ) %>%
  #     layout(yaxis = list(categoryorder = "array", categoryarray = ~ Count)) %>%
  #     layout(
  #       title = "Items distribution by Country",
  #       yaxis = list(title = "Country"),
  #       xaxis = list(title = "Count")
  #     )
  #   })
  
  
  output$table1 <- DT::renderDataTable({
    
    netflix_data <-
      netflix %>% 
      dplyr::select("type", "title", "director")
    
    
    datatable(netflix_data, 
              filter="top", 
              selection="multiple", 
              escape=FALSE, 
              options = list(dom = 'ltipr'))
  })
  
})