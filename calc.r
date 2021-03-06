ibrary(shiny)
ui <- fluidPage(
  
  titlePanel("Simple Shiny Calculator"),
  sidebarLayout(
    mainPanel(
      h5("This is a simple calculator. 
         You put the first and the second number,
         select the operator and voila!"),
      numericInput("num1", "Select the first number", 0),
      numericInput("num2", "Select the second number", 0),
      selectInput(inputId="operator",
                  label = "Select the operator",
                  choices = c("+","-","x","Ã·"))
      ),
    mainPanel(
      h2("The result is:"),
      textOutput("output")
    )))

server <- function(input, output) 
{
  output$output <- renderText({
    switch(input$operator,
           "+" = input$num1 + input$num2,
           "-" = input$num1 - input$num2,
           "x" = input$num1 * input$num2,
           "Ã·" = input$num1 / input$num2)
    
  })
}




shinyApp(ui=ui, server=server)
