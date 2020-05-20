#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(data.table)



hospitals_by_country_and_location <- data.frame(fread("../wikidata_query_for_hospitals_by_country and location.csv"))

colnames(hospitals_by_country_and_location) <- hospitals_by_country_and_location[1,] 
hospitals_by_country_and_location <- hospitals_by_country_and_location[-1,]


countries_with_hospitals_on_wikidata = unique(hospitals_by_country_and_location$countryLabel)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Old Faithful Geyser Data"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
        selectizeInput(inputId = "country", 
                       label = "Country of interest", 
                       choices = countries_with_hospitals_on_wikidata,
                       selected = "Brazil")
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$distPlot <- renderPlot({
      # generate bins based on input$bins from ui.R
      x    <- faithful[, 2] 
      bins <- seq(min(x), max(x), length.out = input$bins + 1)
      
      # draw the histogram with the specified number of bins
      hist(x, breaks = bins, col = 'darkgray', border = 'white')
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

