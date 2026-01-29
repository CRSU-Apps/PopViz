#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
    tags$head(
        rintrojs::introjsUI(),
        shinyjs::useShinyjs()
    ),

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30),
            shiny::textOutput(outputId = session$ns("bin_out")),
            
            actionButton(
              inputId = "help",
              label = "Help",
              class = "btn-xs"
            )
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output, session) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white',
             xlab = 'Waiting time to next eruption (in mins)',
             main = 'Histogram of waiting times')
    })
    
    output$bin_out <- shiny::renderText({
      glue::glue("Somebody selected {input$bins} bins")
    })
    
    observeEvent(
      input$help,
      {
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)
        
        png(filename="tmp.png")
        hist(x, breaks = bins, col = 'darkgray', border = 'white',
             xlab = 'Waiting time to next eruption (in mins)',
             main = 'Histogram of waiting times')
        dev.off()
        
        # browser()
        
        steps <- data.frame(
          title = c("Start", "Second", NA, NA, "End"),
          element = c(NA, NA, paste0("#", session$ns(c("bins", "distPlot"))), NA),
          intro = c("Choose which vague prior to use to initially model the between-study standard deviation (used for random-effects models)",
                    glue::glue("Somebody selected {input$bins} bins"),
                    # as.character(this_plot),
                    "Choose the number of chains. A chain represents a run-through of the analysis, with each chain starting with different values to aid robustness. The results then incorporate all chains.",
                    "The number of iterations to run through. A higher number of iterations is likely to lead to more robust results but does take longer.",
                    "The number of iterations to 'burn' (i.e. not include in the results) at the start. In early iterations, estimated parameters are unlikely to have converged and thus are likely to give spurious results.")
        )
        
        rintrojs::introjs(
          session,
          options = list(
            steps = steps,
            showBullets = FALSE,
            showProgress = TRUE,
            showStepNumbers = FALSE,
            nextLabel = "Next",
            prevLabel = "Prev",
            skipLabel = "Skip"
          )
        )
      }
    )
}

# Run the application 
shinyApp(ui = ui, server = server)
