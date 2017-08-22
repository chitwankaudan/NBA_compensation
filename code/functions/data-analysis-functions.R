# Functions to help in data analysis

# function to calculate Missed FG
missed_FG <- function(field_goals_attempts = 0, field_goals = 0) {
    out <- field_goals_attempts - field_goals
    return(out)
}

# function to calculate Missed FT
missed_FT <- function(free_throws_attempts = 0, free_throws = 0) {
    out <- free_throws_attempts - free_throws
    return(out)
}

# function to calculate modified efficiency
mod_efficiency <- function(weights = 0, stand_dev = 0, data = 0) {
    # weights and stand_dev from prcomp
    # data = data object consisting of raw data on the variables in the
    # modified efficiency formula
    out <- sum(weights / stand_dev * data)
    return(out)
}
