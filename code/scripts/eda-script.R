# =========================================================================
# Title: Exploratory Data Analysis
#
# Description:
# This script contains R code to analyze the cleaned data that was extracted.
# In particular, we will analyze the salary statistics per team and
# the efficiency and value of each player in relation to their salaries
# =========================================================================

library(stringr)
library(ggplot2)
library(dplyr)
library(readr)

setwd("~/Desktop/NBA_compensation/")

# Source functions to help with cleaning data
source('code/functions/data-analysis-functions.R')

# read in clean-data statistics as dataframe
col_class <- c("NULL", "character", "numeric", "factor", rep("numeric", 14), "factor")
roster_stats_salaries <- read.csv(file = "data/cleandata/roster-salary-stats.csv"
                                  , header = TRUE, sep = ",", colClasses = col_class
                                  , stringsAsFactors = FALSE)

# =========================================================================
# Summary Statistics
# =========================================================================

# Start writing to output txt file
sink(file = 'data/cleandata/eda-output.txt')

# Title of txt file
cat("=================================\n")
cat("Summary Statistics \n")
cat("=================================\n")

summary_stats <- summary(roster_stats_salaries)
print(summary_stats)

# Stop writing to txt file
sink()

# Plots
# Barcharts of Discrete Variables
# =========================================================================
# Position
ggplot(roster_stats_salaries, aes(x = roster_stats_salaries$position)) +
    geom_bar() +
    ggtitle("Number of Players in each Position") +
    xlab("Position") +
    ggthemes::theme_fivethirtyeight() +
    theme(axis.title = element_text())

# save as png file
ggsave(filename = "position_barchart.png", path = "images")

# Team
ggplot(roster_stats_salaries, aes(x = roster_stats_salaries$team)) +
    geom_bar() +
    ggtitle("Number of Players in each Team") +
    xlab("Team") +
    ggthemes::theme_fivethirtyeight() +
    theme(axis.title = element_text())

# save as png file
ggsave(filename = "team_barchart.png", path = "images")

# Frequency Histograms for Continuous Variables
# =========================================================================
# Salary
ggplot(roster_stats_salaries, aes(x = roster_stats_salaries$salary)) +
    geom_histogram(binwidth = 400000) +
    ggtitle("Salary Distribution") +
    xlab("Salary") +
    ggthemes::theme_fivethirtyeight() +
    theme(axis.title = element_text())

# save as png file
ggsave(filename = "salary_hist.png", path = "images")

# Height
ggplot(roster_stats_salaries, aes(x = roster_stats_salaries$height)) +
    geom_histogram(binwidth = 2) +
    ggtitle("Height Distribution") +
    xlab("Height") +
    ggthemes::theme_fivethirtyeight() +
    theme(axis.title = element_text())

# save as png file
ggsave(filename = "height_hist.png", path = "images")

# Weight
ggplot(roster_stats_salaries, aes(x = roster_stats_salaries$weight)) +
    geom_histogram(binwidth = 10) +
    ggtitle("Weight Distribution") +
    xlab("Weight") +
    ggthemes::theme_fivethirtyeight() +
    theme(axis.title = element_text())

# save as png file
ggsave(filename = "weight_hist.png", path = "images")

# Games Played
ggplot(roster_stats_salaries, aes(x = roster_stats_salaries$games_played)) +
    geom_histogram(binwidth = 5) +
    ggtitle("Games Played Distribution") +
    xlab("Games Played") +
    ggthemes::theme_fivethirtyeight() +
    theme(axis.title = element_text())

# save as png file
ggsave(filename = "games_played_hist.png", path = "images")

# Field Goals
ggplot(roster_stats_salaries, aes(x = roster_stats_salaries$field_goals)) +
    geom_histogram(binwidth = 20) +
    ggtitle("Field Goals Distribution") +
    xlab("Field Goals") +
    ggthemes::theme_fivethirtyeight() +
    theme(axis.title = element_text())

# save as png file
ggsave(filename = "field_goals_hist.png", path = "images")

# Field Goals Attempts
ggplot(roster_stats_salaries, aes(x = roster_stats_salaries$field_goals_attempts)) +
    geom_histogram(binwidth = 30) +
    ggtitle("Field Goals Attempts Distribution") +
    xlab("Field Goals Attempts") +
    ggthemes::theme_fivethirtyeight() +
    theme(axis.title = element_text())

# save as png file
ggsave(filename = "field_goals_attempts_hist.png", path = "images")

# Free Throws
ggplot(roster_stats_salaries, aes(x = roster_stats_salaries$free_throws)) +
    geom_histogram(binwidth = 10) +
    ggtitle("Free Throws Distribution") +
    xlab("Free Throws") +
    ggthemes::theme_fivethirtyeight() +
    theme(axis.title = element_text())

# save as png file
ggsave(filename = "free_throws_hist.png", path = "images")

# Free Throws Attempts
ggplot(roster_stats_salaries, aes(x = roster_stats_salaries$free_throws_attempts)) +
    geom_histogram(binwidth = 15) +
    ggtitle("Free Throws Attempts Distribution") +
    xlab("Free Throws Attempts") +
    ggthemes::theme_fivethirtyeight() +
    theme(axis.title = element_text())

# save as png file
ggsave(filename = "free_throws_attempts_hist.png", path = "images")

# Total Rebounds
ggplot(roster_stats_salaries, aes(x = roster_stats_salaries$total_rebounds)) +
    geom_histogram(binwidth = 20) +
    ggtitle("Total Rebounds Distribution") +
    xlab("Total Rebounds") +
    ggthemes::theme_fivethirtyeight() +
    theme(axis.title = element_text())

# save as png file
ggsave(filename = "total_rebounds_hist.png", path = "images")

# Assists
ggplot(roster_stats_salaries, aes(x = roster_stats_salaries$assists)) +
    geom_histogram(binwidth = 15) +
    ggtitle("Assists Distribution") +
    xlab("Assists") +
    ggthemes::theme_fivethirtyeight() +
    theme(axis.title = element_text())

# save as png file
ggsave(filename = "assists_hist.png", path = "images")

# Steals
ggplot(roster_stats_salaries, aes(x = roster_stats_salaries$steals)) +
    geom_histogram(binwidth = 5) +
    ggtitle("Steals Distribution") +
    xlab("Steals") +
    ggthemes::theme_fivethirtyeight() +
    theme(axis.title = element_text())

# save as png file
ggsave(filename = "steals_hist.png", path = "images")

# Blocks
ggplot(roster_stats_salaries, aes(x = roster_stats_salaries$blocks)) +
    geom_histogram(binwidth = 5) +
    ggtitle("Blocks Distribution") +
    xlab("Blocks") +
    ggthemes::theme_fivethirtyeight() +
    theme(axis.title = element_text())

# save as png file
ggsave(filename = "blocks_hist.png", path = "images")

# Turnovers
ggplot(roster_stats_salaries, aes(x = roster_stats_salaries$turnovers)) +
    geom_histogram(binwidth = 10) +
    ggtitle("Turnovers Distribution") +
    xlab("Turnovers") +
    ggthemes::theme_fivethirtyeight() +
    theme(axis.title = element_text())

# save as png file
ggsave(filename = "turnovers_hist.png", path = "images")

# Personal Fouls
ggplot(roster_stats_salaries, aes(x = roster_stats_salaries$personal_fouls)) +
    geom_histogram(binwidth = 8) +
    ggtitle("Personal Fouls Distribution") +
    xlab("Personal Fouls") +
    ggthemes::theme_fivethirtyeight() +
    theme(axis.title = element_text())

# save as png file
ggsave(filename = "personal_fouls_hist.png", path = "images")

# Points
ggplot(roster_stats_salaries, aes(x = roster_stats_salaries$points)) +
    geom_histogram(binwidth = 60) +
    ggtitle("Points Distribution") +
    xlab("Points") +
    ggthemes::theme_fivethirtyeight() +
    theme(axis.title = element_text())

# save as png file
ggsave(filename = "points_hist.png", path = "images")

# Boxplots for Continuous Variables
# =========================================================================
# Create new dataframe with only continuous variables
data_plot <- roster_stats_salaries %>%
    dplyr::select(-c(player, position, team))

# Plot Boxplots for every continuous variable
for (i in 1:ncol(data_plot)) {

    out <- ggplot(roster_stats_salaries, aes(x = factor(0)
                                      ,y = data_plot[, i])) +
        geom_boxplot() +
        ggtitle(paste(colnames(data_plot)[i], "Distributions")) +
        xlab("")
        ylab(paste(colnames(data_plot)[i])) +
        ggthemes::theme_fivethirtyeight() +
        theme(axis.title = element_text())

    print(out)

    # save as png file
    ggsave(filename = paste(colnames(data_plot)[i], "_boxplot.png"), path = "images")
}

# =========================================================================
# Salary Statistics
# =========================================================================

# select only team and salaries and group salaries by teams
final_roster_stats_salaries <- roster_stats_salaries %>%
    dplyr::select(., team, salary) %>%
    dplyr::group_by(team)

# Total salaries for each team
total_payroll <- final_roster_stats_salaries %>%
    dplyr::summarise(total_payroll = sum(salary))

# Minimmum salary for each team
min_salary <- final_roster_stats_salaries %>%
    dplyr::summarise(min_salary = min(salary))

# Maximum salary for each team
max_salary <- final_roster_stats_salaries %>%
    dplyr::summarise(max_salary = max(salary))

# First Quartile salary for each team
first_quartile_salary <- final_roster_stats_salaries %>%
    dplyr::summarise(first_quartile_salary = quantile(salary, probs = 0.25))

# Median salary for each team
median_salary <- final_roster_stats_salaries %>%
    dplyr::summarise(median_salary = median(salary))

# Third Quartile salary for each team
third_quantile_salary <- final_roster_stats_salaries %>%
    dplyr::summarise(third_quantile_salary = quantile(salary, probs = 0.75))

# Average salary for each team
average_salary <- final_roster_stats_salaries %>%
    dplyr::summarise(average_salary = mean(salary))

# Interquartile range of salary for each team
iqr_salary <- final_roster_stats_salaries %>%
    dplyr::summarise(iqr_salary = IQR(salary))

# Standard deviation of salary for each team
sd_salary <- final_roster_stats_salaries %>%
    dplyr::summarise(sd_salary = sd(salary))

# Compile a new dataframe consisting of all the previously calculated salary statistics
team_salaries <- data.frame(total_payroll, total_payroll[2], min_salary[2], max_salary[2]
                            , first_quartile_salary[2], median_salary[2], third_quantile_salary[2]
                            , average_salary[2], iqr_salary[2], sd_salary[2])

# Convert dataframe into csv file
write.csv(x = team_salaries, file = "data/cleandata/team-salaries.csv")

# =========================================================================
# Performance of Players
# =========================================================================

# add new columns for missed FG and missed FT
# counting them as negative values for the purposes of PCA weightage
performance_compiled <- roster_stats_salaries %>%
    dplyr::mutate(., missed_field_goals = -missed_FG(field_goals_attempts, field_goals)
                  , missed_free_throws = -missed_FT(free_throws_attempts, free_throws))

# rearrange order of columns
performance_compiled <- performance_compiled[, c(1:17, 20:21, 18, 19)]

# divide each game statistic by games played to get per-game statistic
for (i in 7:17) {
    performance_compiled[i] <- performance_compiled[i] / performance_compiled$games_played
}

for (i in 19:20) {
    performance_compiled[i] <- performance_compiled[i] / performance_compiled$games_played
}

# counting turnovers as negative values for the purpose of PCA weightage
performance_compiled$turnovers <- -performance_compiled$turnovers

# subset by position and remove data that is not needed
# Point Guard (PG)
performance_pg <- performance_compiled %>%
    dplyr::filter(position == "PG") %>%
    dplyr::select(-c(player, salary, height, weight, team, position, games_played
                     , field_goals, field_goals_attempts, free_throws, free_throws_attempts
                     , personal_fouls))

# PCA calculation
# Point Guards (PG) Weight and Standard Deviation
pca_sd_pg <- prcomp(performance_pg, center = TRUE, scale = TRUE)$sdev
pca_weights_pg <- prcomp(performance_pg, center = TRUE, scale = TRUE)$rotation[, 1] %>%
    # ensure all weights are positive
    abs(.)

# Creating new efficiency column for final data frame
# Final efficiency table for Point Guards (PG)
eff_pg <- numeric(nrow(performance_pg))

# R loop to create vector of efficiency index values for each player
for (i in 1:nrow(performance_pg)) {

    eff_pg[i] <- mod_efficiency(weights = pca_weights_pg, stand_dev = pca_sd_pg
                                , performance_pg[i, ])
}

# Add the efficiency index as an additional column to a compiled dataframe
eff_stats_salary <- performance_compiled %>%
    dplyr::filter(position == "PG") %>%
    dplyr::select(-c(height, weight, field_goals, field_goals_attempts
                     , free_throws, free_throws_attempts, personal_fouls)) %>%
    dplyr::mutate(., efficiency = eff_pg)

# Create complete table of all players from remaining subsets of positions
# Remaining Basketball Positions for R loop
bball_positions <- c("SG", "SF", "PF", "C")

# Repeat the same process of efficiency calculation for the "PG" to the rest of the positions
for (i in 1:length(bball_positions)) {
    performance_position <- performance_compiled %>%
        dplyr::filter(position == bball_positions[i]) %>%
        dplyr::select(-c(player, salary, height, weight, team, position, games_played
                         , field_goals, field_goals_attempts, free_throws, free_throws_attempts
                         , personal_fouls))

    pca_sd_position <- prcomp(performance_position, center = TRUE, scale = TRUE)$sdev
    pca_weights_position <- prcomp(performance_position, center = TRUE, scale = TRUE)$rotation[, 1] %>%
        # ensure all weights are positive
        abs(.)

    eff_position <- numeric(nrow(performance_position))

    # R loop to create vector of efficiency index values for each player
    for (j in 1:nrow(performance_position)) {

        eff_position[j] <- mod_efficiency(weights = pca_weights_position
                                          , stand_dev = pca_sd_position
                                          , performance_position[j, ])

    }

    # Add the efficiency index as an additional column to a compiled dataframe
    eff_stats_salary_position <- performance_compiled %>%
        dplyr::filter(position == bball_positions[i]) %>%
        dplyr::select(-c(height, weight, field_goals, field_goals_attempts
                         , free_throws, free_throws_attempts, personal_fouls)) %>%
        dplyr::mutate(., efficiency = eff_position)

    # Create a compiled table that includes efficiency index for all players
    eff_stats_salary <- rbind(eff_stats_salary, eff_stats_salary_position)

}

eff_stats_salary <- eff_stats_salary %>%
    dplyr::arrange(player)

# rearrange column statistics for neatness
eff_stats_salary <- eff_stats_salary[c("player", "team", "position"
                                       , "points", "total_rebounds", "assists"
                                       , "steals", "blocks", "missed_field_goals"
                                       , "missed_free_throws", "turnovers", "games_played"
                                       , "efficiency", "salary")]

# Convert dataframe to csv file
write.csv(eff_stats_salary, file = 'data/cleandata/eff-salary-stats.csv')

# =========================================================================
# Value of Player
# =========================================================================

# Start writing to output txt file
sink(file = 'data/cleandata/best-worst-value-players.txt')

# Value of a Player
# 20 most valuable players
most_valuable <- eff_stats_salary %>%
    dplyr::transmute(.,player = player, team = team, player_value = efficiency / salary) %>%
    dplyr::arrange(player_value) %>%
    tail(., n = 20)

# Sub-title of txt file (Most Valuable)
cat("=================================\n")
cat("List of 20 most valuable players \n")
cat("=================================\n")

print(most_valuable)

# 20 least valuable players
least_valuable <- eff_stats_salary %>%
    dplyr::transmute(.,player = player, team = team, player_value = efficiency / salary) %>%
    dplyr::arrange(player_value) %>%
    head(., n = 20)

# Sub-title of txt file (Least Valuable)
cat("=================================\n")
cat("List of 20 least valuable players \n")
cat("=================================\n")
print(least_valuable)

# Stop writing to txt file
sink()




