library(shiny)

# This is the ui.R
shiny::fluidPage(

    # Application title
    titlePanel("Comparing Team Salary Statistics in the NBA"),

    sidebarLayout(

        sidebarPanel(

            # Drop Box that allows you to select from various statistics
            shiny::selectInput(inputId = "statistic"
                               , label = "Desired Statistic"
                               , choices = c("Total Payroll",
                                             "Minimum Salary",
                                             "Minimum Salary",
                                             "Maximum Salary",
                                             "First Quartile Salary",
                                             "Median Salary",
                                             "Third Quartile Salary",
                                             "Average Salary",
                                             "Interquartile Salary",
                                             "Standard Deviation"))

            # Drop Box that allows you to select the order of the barchart
            , shiny::selectInput(inputId = "order"
                                 , label = "Ascending/ Descending"
                                 , choices = c("Ascending", "Descending"))

            # Slider that allows you to select the level of transparency
            , shiny::sliderInput(inputId = "transparency"
                                 , label = "Level of Transparency"
                                 , min = 0.0, max = 1.0, value = 0.5)

            # Textbox that allows you to select the color of graph
            , shiny::textInput(inputId = "color_graph"
                               , label = "Color of Graph"
                               , value = "gray")
        ),

        # Output as barchart
        mainPanel(
            shiny::plotOutput(outputId = "barplot_stat")
        )
    )
)