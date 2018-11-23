# 45.TUTORIAL : BUILD WEBAPP IN R USING SHINY

install.packages("shiny")
library(shiny)
ui = fluidPage(sidebarLayout(sidebarPanel("Welcome to Shiny App"),
                             mainPanel("This is main Panel")))
server = function(input, output) {  }
shinyApp(ui, server)
ui =  fluidPage(titlePanel("My favorite novels:"),
                sidebarLayout(sidebarPanel(),
                              mainPanel()))
server = function(input, output) {
}
shinyApp(ui, server)
ui =  fluidPage(sidebarLayout(sidebarPanel(
  a("Click here!", href = "http://www.listendata.com/")),
  mainPanel()))
server = function(input, output) {}
shinyApp(ui, server)
ui =  fluidPage(titlePanel("My favorite novels:"),
                sidebarLayout(sidebarPanel(
                  ("My favorite novels are:"),
                  br(),
                  h4(strong("The Kiterunner"), "a novel by", em("Khaled Hoseinni")),
                  h3(strong("Jane Eyre"), "a novel by", code("Charolette Bronte")),
                  strong(
                    "The diary of a young girl",
                    "by",
                    span("Anne Frank", style = "color:blue")
                  ),
                  div(strong("A thousand splendid suns"), "by Khaled Hoseinni", style = "color: red")
                ),
                mainPanel()))
server = function(input, output) { }
shinyApp(ui, server)
ui =  fluidPage(sidebarLayout(
  sidebarPanel(helpText("This questionnaire is subject to privacy."),
               
               textInput(inputId = "name", label = "Enter your name.")
  ),
  
  mainPanel()
  
))
server = function(input, output) { }
shinyApp(ui, server)
ui =  fluidPage(sidebarLayout(
  sidebarPanel(
    helpText("This questionnaire is subject to privacy."),
    
    textInput(inputId = "name", label = "Enter your name."),
    sliderInput(
      inputId = "age",
      label = "What is your age?",
      min = 1,
      max = 100,
      value = 25
    )
  ),
  
  mainPanel()
  
))
server = function(input, output) { }
shinyApp(ui, server)
ui =  fluidPage(sidebarLayout(
  sidebarPanel(
    radioButtons(
      inputId = "month",
      label = "In which month are you born?",
      choices = list(
        "Jan - March" = 1,
        "April - June" = 2,
        "July - September" = 3,
        "October - November" = 4
      ),
      selected = 1
    ),
    
    numericInput(
      inputId = "children_count",
      label = "How many children do you have?",
      value = 2,
      min = 0,
      max = 15
    ),
    
    selectInput(
      inputId  = "smoker",
      label = "Are you a smoker?",
      choices = c("Yes", "No", "I smoke rarely"),
      selected = "Yes"
    ),
    
    checkboxInput(
      inputId = "checkbox",
      label = "Are you a human?",
      value = FALSE
    ),
    
    checkboxGroupInput(
      inputId = "checkbox2",
      label = "2 + 2 = ?",
      choices = list(4, "Four", "IV", "None of the above")
    )
    
  ),
  
  mainPanel()
  
))
server = function(input, output) { }
shinyApp(ui, server)
ui = fluidPage(dateInput(
  "bday",
  label = h3("Enter your Date of Birth"),
  value = "1985-01-01"
),
verbatimTextOutput("text"))

server = function(input, output) {
  output$text <- renderPrint({
    paste(input$bday, "was a blessed day!")
    
  })
}
shinyApp(ui, server)
ui =  fluidPage(titlePanel("Viewing data"),
                
                sidebarLayout(sidebarPanel(
                  selectInput(
                    inputId  = "specie",
                    label = "Select the flower specie",
                    choices = c("setosa", "versicolor", "virginica"),
                    selected = "setosa"
                  )
                ),
                
                mainPanel(tableOutput("data")))) 
server = function(input, output) {
  output$data  = renderTable({
    iris[iris$Species == input$specie, ]
  })
}
shinyApp(ui, server)
library(shiny)
ui <- fluidPage(
  mainPanel(
    numericInput("num_a", "Observations:", 10, 1, 500),
    numericInput("num_b", "Observations:", 10, 1, 500),
    textOutput("text_calc"))
)
server <- function(input, output){
  formula <- reactive({
    A <- input$num_a
    B <- input$num_b
    A*B
  })
  
  output$text_calc <- renderText({
    paste("The result is =", formula())
  })
}
shinyApp(ui = ui, server = server)
ui <- fluidPage(
  sliderInput("slider", "Move to right or left", value = 3, 1, 5),
  numericInput("number", "Number", value = 3, 1, 5)
)
server <- function(input, output, session) {
  observe({
    updateNumericInput(session, "number", value = input$slider)
  })
}
shinyApp(ui = ui, server = server)
library(shiny)
ui<-fluidPage(
  actionButton("unif", "Uniform"),
  textOutput("txt")
)
server<-function(input, output){
  d<-reactiveValues(data=NULL)
  
  observeEvent(input$unif,
               {d$data<-runif(100)}
  )
  
  output$txt <- renderText(
    {
      if (is.null(d$data)) return()
      summary(d$data)
    }
  )
}
shinyApp(ui, server)
ui =  fluidPage(titlePanel("Creating the plots!"),
                sidebarLayout(sidebarPanel(
                  selectInput(
                    inputId  = "characterstic",
                    label = "Select the characterstic for which you want the histogram",
                    choices = c("Sepal Length", "Sepal Width" ,
                                "Petal Length", "Petal Width"),
                    selected = "Sepal Length"
                  )
                ),
                
                mainPanel(plotOutput("myplot"))))
server = function(input, output) {
  char = reactive({
    switch(
      input$characterstic,
      "Sepal Length" = "Sepal.Length",
      "Sepal Width" = "Sepal.Width",
      "Petal Length" = "Petal.Length",
      "Petal Width" = "Petal.Width"
    )
  })
  
  output$myplot  = renderPlot({
    hist(
      iris[, char()],
      xlab = input$characterstic,
      main = paste("Histogram of", input$characterstic)
    )
  })
  
}
shinyApp(ui, server)
install.packages("rsconnect")
library(rsconnect) 
rsconnect::setAccountInfo(name="<ACCOUNT>", token="<TOKEN>", secret="<SECRET>")   ££ error
rsconnect::deployApp(' Folder path in which your app.R file is saved')            ££  error
