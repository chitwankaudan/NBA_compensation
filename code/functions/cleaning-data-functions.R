# Functions to help in data cleaning

# Cleaning Salaries
# Remove $ dollar sign and commas
clean_salaries <- function(data) {
    # data = data object consisting of raw data on athlete's salary
    # splitting the numeric salary data from '$' sign
    # e.g. "$", "<salary>"
    out1 <- str_split(data, "\\$")

    # selecting only the numeric salary data
    out2 <- sapply(out1, function(x) x[2])

    # removing all commas from numeric salary data
    out3 <- str_replace_all(out2, "\\,", "")

    return(out3)
}

# Cleaning Player's height
# Height to inches
height_to_inches <- function(data) {
    # data = data object consisting of raw data on player's height
    # splitting feet from inches
    out1 <- str_split(data, "\\-")

    # selecting the feet portion of player's height
    out2 <- sapply(out1, function(x) x[1]) %>%
        as.numeric(.)

    # selecting the inches portion of player's height
    out3 <- sapply(out1, function(x) x[2]) %>%
        as.numeric(.)

    # calculating height in inches (where 1 feet = 12 inches)
    out4 <- (out2 * 12) + out3

    return(out4)
}

# Cleaning Player's Years of Experience
clean_years <- function(data) {
    # data = data object consisting of raw data on player's years of experience
    out <- str_replace_all(data, pattern = "R", replacement = "0") %>%
        as.numeric(.)
    return(out)
}
