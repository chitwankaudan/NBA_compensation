library(shiny)
library(stringr)
library(ggplot2)

setwd("~/Desktop/NBA_compensation/")

# This is the server.R
function(input, output) {
    # Plotting barchart output
    output$barplot_stat <- renderPlot({

        # Reading in dataframe to extract statistics from
        team_salaries <- read.csv(file = "data/cleandata/team-salaries.csv"
                                  , header = TRUE, sep = ","
                                  , stringsAsFactors = FALSE, row.names = 1)

        # Select different data points from dataframe based on box selected for statistics
        desired_stat <- switch(input$statistic,
                               "Total Payroll" = team_salaries$total_payroll,
                               "Minimum Salary" = team_salaries$min_salary,
                               "Maximum Salary" = team_salaries$max_salary,
                               "First Quartile Salary" = team_salaries$first_quartile_salary,
                               "Median Salary" = team_salaries$median_salary,
                               "Third Quartile Salary" = team_salaries$third_quantile_salary,
                               "Average Salary" = team_salaries$average_salary,
                               "Interquartile Salary" = team_salaries$iqr_salary,
                               "Standard Deviation" = team_salaries$sd_salary)

        # Plotting output based on selected statistic
        # Barchart will be arranged in ascending and descending order depending
        # upon the dropbox selected
        if (input$order == "Ascending") {
            team_salaries %>%
                dplyr::arrange(., desired_stat) %>%
                ggplot(., aes(x = reorder(team_salaries$team, desired_stat), y = desired_stat)) +
                geom_bar(stat = "identity", alpha = input$transparency, fill = input$color_graph) +
                ggtitle(paste("Team", input$statistic
                              , "Salaries Statistics in Ascending Order")) +
                xlab("Teams") +
                ylab(input$statistic) +
                ggthemes::theme_fivethirtyeight() +
                theme(axis.title = element_text())
        } else {
            team_salaries %>%
                dplyr::arrange(., desc(desired_stat)) %>%
                ggplot(., aes(x = reorder(team_salaries$team, -desired_stat), y = desired_stat)) +
                geom_bar(stat = "identity", alpha = input$transparency, fill = input$color_graph) +
                ggtitle(paste("Team", input$statistic
                              , "Salaries Statistics in Descending Order")) +
                xlab("Teams") +
                ylab(input$statistic) +
                ggthemes::theme_fivethirtyeight() +
                theme(axis.title = element_text())
        }
    })
}
