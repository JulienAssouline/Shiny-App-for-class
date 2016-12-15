

library(shiny)
library(ggplot2)
library(dplyr)

#import data from csv file
BP_Pitcher_1967_2016 <- read.csv("BP Pitcher 1967 2016.csv", header=TRUE,check.names=FALSE)
BP_Pitcher_1967_2016_trends <- read.csv("BP_Pitcher_1967_2016_trends.csv", header=TRUE,check.names=FALSE)

#UI function
shinyUI(
  fluidPage(
    #app title
  titlePanel("Visualizing Pitcher Statistics"),
  sidebarLayout(
    sidebarPanel(
      #source of data
      helpText("Data from Baseball Prospectus"),
      helpText("by Julien Assouline"),
      #creating buttons. Slider with year limits, two input buttons with all variables, an optional checkbox for smoother, and a file to download graph.  
      sliderInput("yearinput", "YEAR", 
                  min = 1970, max = 2016, value = c(2000, 2016),
                  animate = TRUE),
      
      selectInput("xcol", "X Axis", 
                  choices = c("YEAR","AGE","NAME","G","GS","PITCHES","IP","IP.Start","IP.Relief","W","L","SV","BS","PA","AB","R","ER","H","X1B","X2B","X3B","HR","TB","BB","UBB","IBB","SO","HBP","SF","SH","PPF","FIP","cFIP","ERA","DRA","PWARP","TEAMS","ROOKIE","League")),
      
      selectInput("ycol", "y Axis", 
                  choices = c("PWARP","YEAR","NAME","AGE","G","GS","PITCHES","IP","IP.Start","IP.Relief","W","L","SV","BS","PA","AB","R","ER","H","X1B","X2B","X3B","HR","TB","BB","UBB","IBB","SO","HBP","SF","SH","PPF","FIP","cFIP","ERA","DRA","TEAMS","ROOKIE","League")),
      
      checkboxInput(inputId = "smoother",
                    label = "show smoother",
                    value = FALSE),
      
      downloadButton("downloadPNG", "Download as a PNG file")
    ),
    #create panel for graph
    mainPanel(
      tabsetPanel(
        tabPanel("Scatterplot", plotOutput("plot1"),
                 verbatimTextOutput("descriptionTab1"), value = "Tab1"),
        tabPanel("Line Chart", plotOutput("plot2"),
                 verbatimTextOutput("descriptionTab2"), value = "Tab2"),
        id = "theTabs"
      ))
  )
)
)
