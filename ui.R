library(shiny)
shinyUI(pageWithSidebar(
  # Application title
  headerPanel("How Well Exercises are Performed PREDICTION -- RANDOM FOREST"),
  sidebarPanel(
    h5("Documentation: This application displays output of a machine learning prediction using random forests"),
    h5("Please wait a few seconds for the first output to run then you simply select (1) The size of your sample (10% - 90% in decimals) and (2) The number of trees in the random forest (10 - 500)"),
    h5("Then hit submit and watch the results"),
    numericInput('nSample','Training Sample Size (as decimal; .1 = 10%)', .2,min=.1, max=.9,step=.1),
    sliderInput("nTrees", "Number of Trees in Random Forest:",min=10, max=500, value=20),
    submitButton('Submit')
  ),
  mainPanel(
    h3('Results of prediction'),
    h4('You entered the following Sample Size'),
    verbatimTextOutput("inputSample"),
    h4('You entered the following number of trees to use in the Random Forest algorithm:'),
    verbatimTextOutput("inputTrees"),
    h4('Which resulted in a prediction of '),
    verbatimTextOutput("prediction")
  )
))
