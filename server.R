library(shiny) 
data <- mtcars
data$am <- as.numeric(as.character(data$am))
data$vs <- as.numeric(as.character(data$vs))
lm.out <- lm(mpg~., data=data)
mpg <- function(vector){
  sum(vector * lm.out$coef[-1])+as.numeric(lm.out$coef[1])
}

shinyServer(
  function(input, output) {
    x <- reactive({mpg(c(input$cyl,input$disp,input$hp,input$drat,
               input$wt,input$qsec,as.numeric(input$vs),as.numeric(input$am),input$gear,input$carb))})
    output$prediction <- renderPrint({x()})
    } )
