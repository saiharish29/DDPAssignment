
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

fx <- function(x,y) {
        data <- mtcars  
        tmp <- data[data$cyl == x, ]
        tmp <- data[data$cyl == x & data$hp <= y, ]
        
        out <- summary(tmp$mpg)
        return (out)
}


shinyServer(
        function(input, output) {
                output$mpgId <- renderPrint(fx(input$cyl, input$horse))
        }
)