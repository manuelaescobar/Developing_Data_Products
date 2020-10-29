library(shiny)
shinyServer(function(input, output) {
    model1 <- lm( parity ~ age, data = infert)
    model2 <- lm(induced + spontaneous ~ age, data = infert)
    
    model1pred <- reactive({
        ageInput <- input$slider2
        predict(model1, newdata = data.frame(age = ageInput))
    })
    
    model2pred <- reactive({
        ageInput <- input$slider2
        predict(model2, newdata = data.frame(age = ageInput))
    })
    
    output$plot1 <- renderPlot({
        ageInput <- input$slider2
        plot(infert$age, infert$parity , xlab = "Woman age", ylab = "Number of parities", bty = "n", pch = 16, xlim = c(22,50), ylim = c(0,8) )
        
        if(input$showModel1){
            abline(model1, col = "red", lwd = 2)
        }
        if(input$showModel2){
            model2lines <- predict(model2, newdata = data.frame(age = 21:44, induced = 0:2))
            lines(21:44, model2lines, col = "blue", lwd= 2)
        }
        legend(22, 8 , c("Number of predicted parities", "Number of predicted induced and spontaneous abortions"), pch = 16, col = c("red", "blue"), bty = "n", cex = 1.2)
        points(ageInput, model1pred(), col = "red", pch = 16, cex =2)
        points(ageInput, model2pred(), col = "blue", pch = 16, cex =2)
        
    })
    output$pred1 <- renderText({
        model1pred()
    })
    output$pred2 <- renderText({
        model2pred()
    })
})
