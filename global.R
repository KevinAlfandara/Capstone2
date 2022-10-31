options(scipen = 99) # me-non-aktifkan scientific notation
library(tidyverse) # koleksi beberapa package R
library(dplyr) # grammar of data manipulation
library(readr) # membaca data
library(ggplot2) # plot statis
library(plotly) # plot interaktif
library(glue) # setting tooltip
library(scales) # mengatur skala pada plot
library(shinydashboard)
library(shiny)
library(DT)

#read data
netflix <- read_csv("netflix_titles.csv", locale = locale(encoding = "latin1"))

#data vids_clean