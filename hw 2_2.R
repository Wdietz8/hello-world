# read the data
world_cup_matches <- read.csv("C:/Users/wdiet/OneDrive/Desktop/WorldCupMatches.csv")

# (a) size of the data frame
nrow(world_cup_matches) # number of rows
ncol(world_cup_matches) # number of columns

# (b) statistical summary
summary(world_cup_matches)

# (c) number of unique locations
library(dplyr)
n_distinct(world_cup_matches$City)

# (d) average attendance
mean(world_cup_matches$Attendance, na.rm = TRUE)

# (e) total goals scored by home team
library(dplyr)
world_cup_matches %>% group_by(Home.Team.Name) %>% summarise(total_goals = sum(Home.Team.Goals, na.rm = TRUE))

# (f) average number of attendees for each year
library(ggplot2)
world_cup_matches %>%
  group_by(Year) %>%
  summarise(avg_attendance = mean(Attendance, na.rm = TRUE)) %>%
  ggplot(aes(x = Year, y = avg_attendance)) +
  geom_line() +
  ggtitle("Average Attendance by Year")
