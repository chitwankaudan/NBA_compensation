library(shiny)

# This is the ui.R
shiny::fluidPage(

    # Application title
    titlePanel("Comparing Player Efficiency to their Salaries in the NBA"),

    sidebarLayout(

        sidebarPanel(

            # Drop Box that allows you to select from various statistics on x-axis
            shiny::selectInput(inputId = "x_axis"
                               , label = "Variables for x-axis"
                               , choices = c("Total Points",
                                             "Total Rebounds",
                                             "Assists",
                                             "Steals",
                                             "Blocks",
                                             "Missed Field Goals",
                                             "Missed Free Throws",
                                             "Turnovers",
                                             "Games Played",
                                             "Efficiency Index",
                                             "Salary"))
            # Drop Box that allows you to select from various statistics on y-axis (Salary selected)
            , shiny::selectInput(inputId = "y_axis"
                                 , label = "Variables for y-axis"
                                 , choices = c("Total Points",
                                               "Total Rebounds",
                                               "Assists",
                                               "Steals",
                                               "Blocks",
                                               "Missed Field Goals",
                                               "Missed Free Throws"
                                               ,"Turnovers",
                                               "Games Played",
                                               "Efficiency Index",
                                               "Salary")
                                 , selected = "Salary")
            # Check Box that allows you to differentiate positions by color
            , shiny::checkboxInput(inputId = "dots_color"
                                   , label = "Differentiate by Position")
            ),

        # Output as scatterplot
        mainPanel(
            shiny::plotOutput(outputId = "scatterplot_stat")

            # Output for correlation coefficient as text
            , shiny::textOutput(outputId = "correlation")
            )
        )
    )