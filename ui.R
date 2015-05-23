library(shiny) 
#install.packages("profileModel")
#install.packages("RcppEigen")
require(profileModel)
require(RcppEigen)

shinyUI( pageWithSidebar(
  # Application title 
  headerPanel("Miles per Gallon prediction"),
  sidebarPanel(
    numericInput('cyl', 'Number of cylinders', 4, min = 4, max = 8, step = 2), 
    numericInput('disp', 'Displacement (cu.in)', 160, min = 70, max = 500, step = 0.1), 
    numericInput('hp', 'Gross horsepower', 90, min = 50, max = 350, step = 1), 
    numericInput('drat', 'Rear axle ratio', 3, min = 2.5, max = 5, step = 0.01), 
    numericInput('wt', 'Weight (lb/1000)', 2, min = 1.5, max = 5.5, step = 0.001), 
    numericInput('qsec', '1/4 mile time', 20, min = 14, max = 24, step = 0.1), 
    radioButtons("vs", "V or Straight engine",
                       c("V" = "0", "Straight" ="1")), 
    radioButtons("am", "Transmission",
                       c("Automatic" = "0", "Manual" = "1")),
    numericInput('gear', 'Number of forward gears', 3, min = 3, max = 5, step = 1), 
    numericInput('carb', 'Number of carburetors', 4, min = 1, max = 8, step = 1), 
    h3('Documentation'),
    p("This project uses the 'mtcars' dataset to predict
      the miles per gallon a car will travel depending on the various specs above.
      By entering numbers like the gross horsepower or if the vehicle is automatic or manual,
      the program will use a linear regression model to predict the miles per gallon."),
    
    p("Everytime you key in a new value for any feature, the mpg will be updated.")
  ), mainPanel(
    h3('Results of prediction'),
    h4('With the above inputs you have given, this is the predicted miles per gallon '), verbatimTextOutput("prediction")
  ) )
)

