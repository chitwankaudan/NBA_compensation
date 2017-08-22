# =========================================================================
# Title: Data Dictionary
#
# Description:
# This script contains R code to create a data dictionary dataframe to
# help in the understanding of both the raw and cleaned data
# =========================================================================

setwd("~/Desktop/NBA_compensation/")

# =========================================================================
# Raw Data
# =========================================================================

# Roster Datasets
# =========================================================================
# Extracting columns names for roster rawdata
raw_roster_names <- read.csv(file = "data/rawdata/roster-data/roster-ATL.csv", header = TRUE
                             , sep = ",", row.names = 1, stringsAsFactors = FALSE) %>%
    colnames(.) %>%
    data.frame(variable_names = .)

# Creating column for description of variables
raw_roster_descrip <- data.frame(description = c("Roster Number for Players (between 0-99)"
                                                 , "Player's Name"
                                                 , "Player's Position (PG, SG, SF, PF, C)"
                                                 , "Height of Players"
                                                 , "Weight of Players"
                                                 , "Birthdate of Players (MM-DD-YYYY)"
                                                 , "Player's Country (ISO alpha-2 code)"
                                                 , "Years of Experience"
                                                 , "Player's College Team"))

# Creating column for units(if applicable)
raw_roster_units <- data.frame(units = c(NA, NA, NA, "feet-inches", "pounds"
                                         , NA, NA, "years", NA))

# Notes for each variable
raw_roster_notes <- data.frame(notes = c(NA
        , "Players may appear twice as they can change teams during the middle of the season."
        , rep(NA, 5)
        , "R stands for rookie which means players have 0 years of experience."
        , "Missing info for players who played overseas or skipped college."))

# Compiled Data Dictionary for Roster dataset
raw_roster_data_dict <- cbind(raw_roster_names, raw_roster_descrip,
                              raw_roster_units, raw_roster_notes)

# Write to csv file
write.csv(raw_roster_data_dict, file = 'data/rawdata/roster-data/roster-data-dictionary.csv')

# Salary Datasets
# =========================================================================

# Extracting columns names for salary rawdata
raw_salary_names <- read.csv(file = "data/rawdata/salary-data/salaries-ATL.csv", header = TRUE
                             , sep = ",", row.names = 1, stringsAsFactors = FALSE) %>%
    colnames(.) %>%
    data.frame(variable_names = .)

# Creating column for description of variables
raw_salary_descrip <- data.frame(description = c("Rank of Salaries on Team", "Player's Name"
                                                 , "Player's Salary"))

# Creating column for units(if applicable)
raw_salary_units <- data.frame(units = c(NA, NA, "USD"))

# Notes for each variable
raw_salary_notes <- data.frame(notes = c(NA
        , "Players may appear twice as they can change teams during the middle of the season."
        , "Players may receive salary and not play. There is also missing salary information."))

# Compiled Data Dictionary for Roster dataset
raw_salary_data_dict <- cbind(raw_salary_names, raw_salary_descrip,
                              raw_salary_units, raw_salary_notes)

# Write to csv file
write.csv(raw_salary_data_dict, file = 'data/rawdata/salary-data/salaries-data-dictionary.csv')


# Statistics Datasets
# =========================================================================

# Extracting columns names for statistics rawdata
raw_stats_names <- read.csv(file = "data/rawdata/stat-data/stats-ATL.csv", header = TRUE
                            , sep = ",", row.names = 1, stringsAsFactors = FALSE) %>%
    colnames(.) %>%
    data.frame(variable_names = .)

# Creating column for description of variables
raw_stats_descrip <- data.frame(description = c("Player's Rank"
                                                , "Player's Name"
                                                , "Player's Age"
                                                , "Games Played"
                                                , "Games Started"
                                                , "Minutes Played"
                                                , "Field Goals Made"
                                                , "Field Goals Attempted"
                                                , "Field Goals Percentage"
                                                , "3-pointers Made"
                                                , "3-pointers Attempted"
                                                , "3-pointers Percentage"
                                                , "2-pointers Made"
                                                , "2-pointers Attempted"
                                                , "2-pointers Percentage"
                                                , "Effective Field Goal Percentage"
                                                , "Free Throws Made"
                                                , "Free Throws Attempted"
                                                , "Free Throws Percentage"
                                                , "Offensive Rebounds"
                                                , "Defensive Rebounds"
                                                , "Total Rebounds"
                                                , "Assists"
                                                , "Steals"
                                                , "Blocks"
                                                , "Turnovers"
                                                , "Personal Fouls"
                                                , "Points"))

# Creating column for units(if applicable)
raw_stats_units <- data.frame(units = c(NA, NA, "years old", NA, NA, "minutes"
                                        , NA, NA, "Percent", NA, NA, "Percent"
                                        , NA, NA, "Percent", "Percent"
                                        , NA, NA, "Percent", NA, NA, NA
                                        , rep(NA, 6)))

# Notes for each variable
raw_stats_notes <- data.frame(notes = c("No explanation is given for the method of ranking."
        , rep(NA, 7)
        , "Empty Data if player has 0 field goal attempts."
        , NA, NA
        , "Empty Data if player has 3-point attempts."
        , NA, NA
        , "Empty Data if player has 0 2-point attempts."
        , "Method of calculating field goal percentage by giving more weight to 3-pointers."
        , NA, NA
        , "Empty Data if player has 0 free throw attempts."
        , rep(NA, 9)))

# Compiled Data Dictionary for Roster dataset
raw_stats_data_dict <- cbind(raw_stats_names, raw_stats_descrip,
                             raw_stats_units, raw_stats_notes)

# Write to csv file
write.csv(raw_stats_data_dict, file = 'data/rawdata/stat-data/stats-data-dictionary.csv')

# =========================================================================
# Clean Data
# =========================================================================

# roster-salary-stats.csv
# =========================================================================

# Extracting columns names for roster-salary-stats.csv
initial_clean_names <- read.csv(file = "data/cleandata/roster-salary-stats.csv", header = TRUE
                             , sep = ",", row.names = 1, stringsAsFactors = FALSE) %>%
    colnames(.) %>%
    data.frame(variable_names = .)

# Creating column for description of variables
initial_clean_descrip <- data.frame(description = c("Player's Name"
                                                   , "Player's Team"
                                                   , "Player's Position (PG, SG, SF, PF, C)"
                                                   , "Height of Players"
                                                   , "Weight of Players"
                                                   , "Field Goals Made"
                                                   , "Field Goals Attempted"
                                                   , "Free Throws Made"
                                                   , "Free Throws Attempted"
                                                   , "Points"
                                                   , "Total Rebounds"
                                                   , "Assists"
                                                   , "Steals"
                                                   , "Blocks"
                                                   , "Turnovers"
                                                   , "Personal Fouls"
                                                   , "Games Played"
                                                   , "Salary"))

# Creating column for units(if applicable)
initial_clean_units <- data.frame(units = c(NA, NA, NA, "inches", "pounds"
                                            , rep(NA, 12), "USD"))

# Notes for each variable
initial_clean_notes <- data.frame(notes = c(
    "Players may appear twice as they can change teams during the middle of the season.
    We decided to keep their data as they receive different salaries and have different
    statistics in each team. It does not make sense to choose one dataset over the other."
    , rep(NA, 17)
    , "Players may receive salary and not play. There is also missing salary information."))


# Compiled Data Dictionary for Roster dataset
initial_clean_dict <- cbind(initial_clean_names, initial_clean_descrip,
                            initial_clean_units, initial_clean_notes)

# Write to csv file
write.csv(initial_clean_dict, file = 'data/cleandata/roster-salary-stats-data-dictionary.csv')

# eff-salary.csv
# =========================================================================

# Extracting columns names for eff-salary-stats.csv
eff_names <- read.csv(file = "data/cleandata/eff-salary-stats.csv", header = TRUE
                      , sep = ",", row.names = 1, stringsAsFactors = FALSE) %>%
    colnames(.) %>%
    data.frame(variable_names = .)

# Creating column for description of variables
eff_descrip <- data.frame(description = c("Player's Name"
                                          , "Player's Team"
                                          , "Player's Position (PG, SG, SF, PF, C)"
                                          , "Points per Game"
                                          , "Rebounds per Game"
                                          , "Assists per Game"
                                          , "Steals per Game"
                                          , "Blocks per Game"
                                          , "Missed Field Goals per Game"
                                          , "Missed Free Throws per Game"
                                          , "Turnovers per Game"
                                          , "Games Played"
                                          , "Efficiency Index"
                                          , "Player's Salary"))

# Creating column for units(if applicable)
eff_units <- data.frame(units = c(NA, NA, NA, rep(NA, 10), "USD"))

# Notes for each variable
eff_notes <- data.frame(notes = c(
    "Players may appear twice as they can change teams during the middle of the season.
    We decided to keep their data as they receive different salaries and have different
    statistics in each team. It does not make sense to choose one dataset over the other."
    , rep(NA, 11)
    , "Calculated using modified efficiency formula."
    , "Players may receive salary and not play. There is also missing salary information."))

# Compiled Data Dictionary for Roster dataset
eff_dict <- cbind(eff_names, eff_descrip, eff_units, eff_notes)

# Write to csv file
write.csv(eff_dict, file = 'data/cleandata/eff-salary-stats-data-dictionary.csv')