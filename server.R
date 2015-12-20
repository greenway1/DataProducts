library(shiny)
library(ggplot2)
library(caret)
library(randomForest)
library(AppliedPredictiveModeling)
data(segmentationOriginal)
set.seed(32324)

RandomForest <- function(pInput,treeInput) {
  inTrain <- createDataPartition(y=segmentationOriginal$Class,p=pInput,list=FALSE)
  training <- segmentationOriginal[inTrain,]
  testing <- segmentationOriginal[-inTrain,]
  fit <- randomForest(Class ~ ., data=training, importance=TRUE, ntree=treeInput)
  print(fit)
  predTest <- predict(fit,testing)
  table(predTest,testing$Class)
}

shinyServer(
  function(input,output){
    output$inputSample <- renderPrint({input$nSample})
    output$inputTrees <- renderPrint({input$nTrees})
    output$prediction <- renderPrint({RandomForest(input$nSample,input$nTrees)})
  }
)
