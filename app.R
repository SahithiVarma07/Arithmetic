library(shiny)

ui <- fluidPage(
  titlePanel("Let's Do Arithmetic!"),
  sidebarLayout(
    sidebarPanel(
      numericInput(inputId = "number1", label = "Number 1", value = 0),
      numericInput(inputId = "number2", label = "Number 2", value = 0),
      actionButton(inputId = "addBtn", label = "Add"),
      actionButton(inputId = "multBtn", label = "Multiply")
    ),
    mainPanel(
      h2("The result of the operation is:"),
      textOutput("result")
    )
  )
)
server <- function(input, output) {
  addResult <- eventReactive(input$addBtn, {
    as.numeric(input$number1) + as.numeric(input$number2)
  })
  multResult <- eventReactive(input$multBtn, {
    as.numeric(input$number1) * as.numeric(input$number2)
  })
  output$result <- renderText({
    if (input$addBtn > 0 && input$addBtn >= input$multBtn) {
      paste("Sum =", addResult())
    } else if (input$multBtn > 0) {
      paste("Product =", multResult())
    } else {
      "No calculation yet."
    }
  })
}

shinyApp(ui = ui, server = server)


