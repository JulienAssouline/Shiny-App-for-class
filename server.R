
library(shiny)
library(ggplot2)
library(dplyr)

#function for output. 
shinyServer(function(input, output){ 
  #reactive function, which creates graph and reacts to changes in input button, and slider.
  ScatterPlot <- reactive({ 
    BP_Pitcher_1967_2016 <- read.csv("BP Pitcher 1967 2016.csv", header=TRUE,check.names=FALSE)
    
    Filtered1 <- BP_Pitcher_1967_2016 %>%
      filter(
        YEAR >= input$yearinput[1],
        YEAR <= input$yearinput[2]
      )
    #creating scatterplot
    p <- ggplot() +
      geom_point(data = Filtered1, aes_string(x = input$xcol, y = input$ycol))
    #If checkbox is selected then it will show the smoother
    if(input$smoother)
      p <- p + geom_smooth(data = Filtered1, aes_string(x = input$xcol, y = input$ycol), colour = "red")
    print(p)
  })
  
  #plot graph output from reactive function, and create print png file function
  output$plot1 <- renderPlot({
    print(ScatterPlot())
    
    output$downloadPNG <- downloadHandler(
      filename = "Graph.png",
      content = function(file){
        png(file)
        print(ScatterPlot())
        dev.off()
      })
  })
  
  #create reactive function for line graph
  linechart <- reactive({ 
        BP_Pitcher_1967_2016_trends <- read.csv("BP_Pitcher_1967_2016_trends.csv", header=TRUE,check.names=FALSE)
    Filtered2 <- BP_Pitcher_1967_2016_trends %>%
      filter(
        YEAR >= input$yearinput[1],
        YEAR <= input$yearinput[2]
      )
    #line graph
    d <- ggplot() +
      geom_line(data = Filtered2, aes_string(x = input$xcol, y = input$ycol), colour = "blue", size = 1)
    print(d)
    
  }
  )
  #plot graph output with png function button
  output$plot2 <- renderPlot({
    print(linechart())
    
    output$downloadPNG <- downloadHandler(
      filename = "Graph.png",
      content = function(file){
        png(file)
        print(linechart())
        dev.off()
      })
  })
  
  
} 
)
