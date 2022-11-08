options(scipen = 99) 
library(tidyverse) 
library(tidyr)
library(dplyr) 
library(readr)
library(ggplot2) 
library(plotly) 
library(glue) 
library(scales)
library(leaflet)
library(stringr)
library(shinydashboard)
library(shiny)
library(DT)


#read data
netflix <- read_csv("netflix_titles.csv", locale = locale(encoding = "latin1"))

#data vids_clean
type_tvshow <- 
  netflix %>% 
  filter(type=="TV Show")
