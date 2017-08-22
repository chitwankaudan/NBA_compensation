# =========================================================================
# Title: Clean Data Script
#
# Description:
# This script contains R code to clean the raw data that was extracted
# In particular, we will select relevant columns for further analysis
# on player performance and their salaries.
# =========================================================================

library(stringr)
library(dplyr)

setwd("~/Desktop/NBA_compensation/")

# Source functions to help with cleaning data
source('code/functions/cleaning-data-functions.R')

# Vector of all team names in NBA
team_names <- c("ATL", "BOS", "BRK", "CHI", "CHO", "CLE", "DAL", "DEN", "DET", "GSW", "HOU"
                , "IND", "LAC", "LAL", "MEM", "MIA", "MIL", "MIN", "NOP", "NYK", "OKC", "ORL"
                , "PHI", "PHO", "POR", "SAC", "SAS", "TOR", "UTA", "WAS")

# =========================================================================
# Compiling new Dataframe
# =========================================================================

# Allow the loop to start from 1 and end on length(team_names)
total_teams <- length(team_names) - 1

# Combine roster tables for all 30 teams
# Roster table for first team to start the loop
total_roster <- read.csv(file = paste0('data/rawdata/roster-data/roster-'
                                       , team_names[1], '.csv'), header = TRUE
                         , sep = ",", row.names = 1, stringsAsFactors = FALSE) %>%
    dplyr::mutate(., team = team_names[1])

# R loop that adds all roster tables together
for (i in 1:total_teams) {
        out1 <- read.csv(file = paste0('data/rawdata/roster-data/roster-'
                                       , team_names[i + 1], '.csv'), header = TRUE
                         , sep = ",", row.names = 1, stringsAsFactors = FALSE) %>%
            dplyr::mutate(., team = team_names[i + 1])

        total_roster <- rbind(total_roster, out1)

}


# Combine salary tables for all 30 teams
# Salary table for first team to start the loop
total_salaries <- read.csv(file = paste0('data/rawdata/salary-data/salaries-', team_names[1], '.csv')
                         , header = TRUE, sep = ",", row.names = 1, stringsAsFactors = FALSE) %>%
    dplyr::mutate(., team = team_names[1])

# R loop that adds all salary tables together
for (i in 1:total_teams) {
    out1 <- read.csv(file = paste0('data/rawdata/salary-data/salaries-', team_names[i + 1], '.csv')
                     , header = TRUE, sep = ",", row.names = 1, stringsAsFactors = FALSE) %>%
        dplyr::mutate(., team = team_names[i + 1])
    total_salaries <- rbind(total_salaries, out1)

}

# Combine statistics tables for all 30 teams
# Statistic table for first team to start the loop
total_stats <- read.csv(file = paste0('data/rawdata/stat-data/stats-', team_names[1], '.csv')
                         , header = TRUE, sep = ",", row.names = 1, stringsAsFactors = FALSE) %>%
    dplyr::mutate(., team = team_names[1])

# R loop that adds all statistics tables together
for (i in 1:total_teams) {
    out1 <- read.csv(file = paste0('data/rawdata/stat-data/stats-', team_names[i + 1], '.csv')
                     , header = TRUE, sep = ",", row.names = 1, stringsAsFactors = FALSE) %>%
        dplyr::mutate(., team = team_names[i + 1])
    total_stats <- rbind(total_stats, out1)

}

# merge based on team and names since some players played for more than 1 team
roster_stats <- merge(total_roster, total_stats, by.x = c("roster.Player", "team")
           , by.y = c("totals.Player", "team"))

# merge but remove all players with only salaries stats and players without salaries stats
roster_stats_salaries <- merge(roster_stats, total_salaries, by.x = c("roster.Player", "team")
           , by.y = c("salaries.Player", "team"))

rm(roster_stats)

# Compiling final table

final_roster_stats_salaries <- roster_stats_salaries %>%
    dplyr::select(player = roster.Player, salary = salaries.Salary, position = roster.Pos
                  , height = roster.Ht, weight = roster.Wt, games_played = totals.G
                  , field_goals = totals.FG, field_goals_attempts = totals.FGA
                  , free_throws = totals.FT, free_throws_attempts = totals.FTA
                  , total_rebounds = totals.TRB, assists = totals.AST, steals = totals.STL
                  , blocks = totals.BLK, turnovers = totals.TOV, personal_fouls = totals.PF
                  , points = totals.PTS, team)

# =========================================================================
# Dataframe Cleaning
# =========================================================================

# Clean salaries
final_roster_stats_salaries$salary <- final_roster_stats_salaries$salary %>%
    clean_salaries(.) %>%
    as.numeric(.)

# Clean heights
final_roster_stats_salaries$height <- final_roster_stats_salaries$height %>%
    height_to_inches(.)

# Set Position and Team as factors
final_roster_stats_salaries$position <- final_roster_stats_salaries$position %>%
    as.factor(.)

final_roster_stats_salaries$team <- final_roster_stats_salaries$team %>%
    as.factor(.)

# Change integers to numeric
for (i in 1:(length(final_roster_stats_salaries) - 5)) {
    final_roster_stats_salaries[,i + 4] <- final_roster_stats_salaries[,i + 4] %>%
        as.numeric(.)
}

# Check structure of dataframe
str(final_roster_stats_salaries)

# Convert dataframe to csv file
write.csv(final_roster_stats_salaries, file = 'data/cleandata/roster-salary-stats.csv')
