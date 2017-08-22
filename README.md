# NBA_compensation
Analyzing NBA players' performance and compensation for 2015-2016 season

## Our data set
NBA 2015-2016 Season data from <basketballreference.com>
Type of data: Full roster, salaries, player statistics for all 30 NBA teams

## Data Scraping: Downloading the data from the internet
- Look at <./code/scripts/scrape-nba-tables.R> for full script
- Raw files stored in <./data/rawdata

## Data cleaning, formatting: Preparing the data for analysis
- Cleaning functions at <./code/functions/cleaning-functions.R>
- Cleaning script at <./code/scripts/clean-data-script.R>
- Clean data set at <./data/cleandata/roster-salary-stats.csv>

## Exploratory Data Analysis: investigating relationships in the data
- EDA script at <./code/scripts/eda-script.R>
- Summaries and other output at <./data/cleandata/eda-output.txt>
- Salary statistics by team at <./data/cleandata/team-salaries.csv>
- Plots generated at <./images>

## Data Analysis: determining the correlation between performance and salary
- Data analysis functions at <./code/functions/data-analysis-functions.R>
- The second half of the EDA script is dedicated to determining player efficiency
- Player efficiency is calculated by PCA based on position
- Player value is the ratio between efficiency and salary
- Observe the output at <./data/cleandata/eff-stats-salary.csv>

## Shiny Apps: Interactive and visual data analysis
- Useful in observing overarching trends in the data
- Team Salaries Shiny App is at <./apps/team-salaries>
- Stat Salaies Shiny App is at <./apps/stat-salaries>

## Report and Slides: Synopsis of the project, conclusions
- Report is at <./report/report.pdf>
- Slides are at <./slides/slides.html>

Authors: Chitwan Kaudan, Ashley Lui, Karthik Nataraj, Ong Sheng Siong.
Special thanks to Gaston Sanchez <gastonsanchez.com>
Speacial thanks to Shamindra Shrotriya
