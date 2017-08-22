library(shiny)
library(stringr)
library(ggplot2)

setwd("~Desktop/NBA_compensation/")

# This is the server.R
function(input, output) {
    # Plotting scatterplot output
    output$scatterplot_stat <- renderPlot({

        # Reading in dataframe to extract statistics from
        eff_stats_salary <- read.csv(file = "data/cleandata/eff-salary-stats.csv"
                                     , header = TRUE, sep = ","
                                     , stringsAsFactors = FALSE, row.names = 1)

        # Select different data points from dataframe based on box selected for x-axis
        x_stats <- switch(input$x_axis,
                          "Player's Name" = eff_stats_salary$player,
                          "Total Points" = eff_stats_salary$points,
                          "Total Rebounds" = eff_stats_salary$total_rebounds,
                          "Assists" = eff_stats_salary$assists,
                          "Steals" = eff_stats_salary$steals,
                          "Blocks" = eff_stats_salary$blocks,
                          "Missed Field Goals" = eff_stats_salary$missed_field_goals,
                          "Missed Free Throws" = eff_stats_salary$missed_free_throws,
                          "Turnovers" = eff_stats_salary$turnovers,
                          "Games Played" = eff_stats_salary$games_played,
                          "Efficiency Index" = eff_stats_salary$efficiency,
                          "Salary" = eff_stats_salary$salary)

        # Select different data points from dataframe based on box selected for y-axis
        y_stats <- switch(input$y_axis,
                         "Player's Name" = eff_stats_salary$player,
                         "Total Points" = eff_stats_salary$points,
                         "Total Rebounds" = eff_stats_salary$total_rebounds,
                         "Assists" = eff_stats_salary$assists,
                         "Steals" = eff_stats_salary$steals,
                         "Blocks" = eff_stats_salary$blocks,
                         "Missed Field Goals" = eff_stats_salary$missed_field_goals,
                         "Missed Free Throws" = eff_stats_salary$missed_free_throws,
                         "Turnovers" = eff_stats_salary$turnovers,
                         "Games Played" = eff_stats_salary$games_played,
                         "Efficiency Index" = eff_stats_salary$efficiency,
                         "Salary" = eff_stats_salary$salary)

        # Plotting output based on selected x_stats and y_stats
        # If checkbox for "Differentiate by Position" is selected
        # points will be colored by position
        if (input$dots_color == TRUE) {
            ggplot(eff_stats_salary, aes(x = x_stats, y = y_stats)) +
                geom_point(aes(color = eff_stats_salary$position)) +
                ggtitle(paste("Relationship between", input$y_axis, "and", input$x_axis)) +
                xlab(input$x_axis) +
                ylab(input$y_axis) +
                labs(color = "Position") +
                ggthemes::theme_fivethirtyeight() +
                theme(axis.title = element_text())
        } else {
            ggplot(eff_stats_salary, aes(x = x_stats, y = y_stats)) +
                geom_point() +
                ggtitle(paste("Relationship between", input$y_axis, "and", input$x_axis)) +
                xlab(input$x_axis) +
                ylab(input$y_axis) +
                ggthemes::theme_fivethirtyeight() +
                theme(axis.title = element_text())
        }
    })

    # Plotting correlation coefficient text output
    output$correlation <- renderText({

        # Reading in dataframe to extract statistics from
        eff_stats_salary <- read.csv(file = "data/cleandata/eff-salary-stats.csv"
                                     , header = TRUE, sep = ","
                                     , stringsAsFactors = FALSE, row.names = 1)

        # Select different data points from dataframe based on box selected for x-axis
        x_stats <- switch(input$x_axis,
                          "Player's Name" = eff_stats_salary$player,
                          "Total Points" = eff_stats_salary$points,
                          "Total Rebounds" = eff_stats_salary$total_rebounds,
                          "Assists" = eff_stats_salary$assists,
                          "Steals" = eff_stats_salary$steals,
                          "Blocks" = eff_stats_salary$blocks,
                          "Missed Field Goals" = eff_stats_salary$missed_field_goals,
                          "Missed Free Throws" = eff_stats_salary$missed_free_throws,
                          "Turnovers" = eff_stats_salary$turnovers,
                          "Games Played" = eff_stats_salary$games_played,
                          "Efficiency Index" = eff_stats_salary$efficiency,
                          "Salary" = eff_stats_salary$salary)

        # Select different data points from dataframe based on box selected for y-axis
        y_stats <- switch(input$y_axis,
                          "Player's Name" = eff_stats_salary$player,
                          "Total Points" = eff_stats_salary$points,
                          "Total Rebounds" = eff_stats_salary$total_rebounds,
                          "Assists" = eff_stats_salary$assists,
                          "Steals" = eff_stats_salary$steals,
                          "Blocks" = eff_stats_salary$blocks,
                          "Missed Field Goals" = eff_stats_salary$missed_field_goals,
                          "Missed Free Throws" = eff_stats_salary$missed_free_throws,
                          "Turnovers" = eff_stats_salary$turnovers,
                          "Games Played" = eff_stats_salary$games_played,
                          "Efficiency Index" = eff_stats_salary$efficiency,
                          "Salary" = eff_stats_salary$salary)

        # Paste output that shows correlation coefficient of x_stats and y_stats
        paste("Correlation Coefficient:", cor(x_stats, y_stats))

    })
}
