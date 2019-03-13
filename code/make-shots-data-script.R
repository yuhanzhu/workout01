##################################################
## title: make-shots-data
## description: to create a csv data file shots-data.csv that will contain the required variables to be used in the visualization phase.
## input: five raw data CSV files
## output: one main/global table
##################################################

library(readr)
library(dplyr)

# Read in the five data sets, using relative file paths
setwd("~/Desktop/workout01")
getwd()
coltype = c("character","character","character","integer","integer","integer","character","character","character","integer","character","integer","integer")
andre <- read.csv("./data/andre-iguodala.csv", stringsAsFactors = FALSE, sep = ",", header =T, colClasses = coltype)
draymond <- read.csv("./data/draymond-green.csv", stringsAsFactors = FALSE, sep = ",", header =T, colClasses = coltype)
kevin <- read.csv("./data/kevin-durant.csv", stringsAsFactors = FALSE, sep = ",", header =T, colClasses = coltype)
klay <- read.csv("./data/klay-thompson.csv", stringsAsFactors = FALSE, sep = ",", header =T, colClasses = coltype)
stephen <- read.csv("./data/stephen-curry.csv", stringsAsFactors = FALSE, sep = ",", header =T, colClasses = coltype)

# Add a column name to each imported data frame, that contains the name of the corresponding player:
andre$name <- "Andre Iguodala"
draymond$name <- "Graymond Green"
kevin$name <- "Kevin Durant"
klay$name <- "Klay Thompson"
stephen$name <- "Stephen Curry"

# Change the original values of shot_made_flag to more descriptive values: replace "n" with "shot_no", and "y" with "shot_yes"
andre$shot_made_flag[andre$shot_made_flag == "n"] <- "shot_no";andre$shot_made_flag[andre$shot_made_flag == "y"] <- "shot_yes"
draymond$shot_made_flag[draymond$shot_made_flag == "n"] <- "shot_no";draymond$shot_made_flag[draymond$shot_made_flag == "y"] <- "shot_yes"
kevin$shot_made_flag[kevin$shot_made_flag == "n"] <- "shot_no";kevin$shot_made_flag[kevin$shot_made_flag == "y"] <- "shot_yes"
klay$shot_made_flag[klay$shot_made_flag == "n"] <- "shot_no";klay$shot_made_flag[klay$shot_made_flag == "y"] <- "shot_yes"
stephen$shot_made_flag[stephen$shot_made_flag == "n"] <- "shot_no";stephen$shot_made_flag[stephen$shot_made_flag == "y"] <- "shot_yes"

# Add a column minute that contains the minute number where a shot occurred.
andre$minute <- andre$period * 12 - andre$minutes_remaining
draymond$minute <- draymond$period * 12 - draymond$minutes_remaining
kevin$minute <- kevin$period * 12 - kevin$minutes_remaining
klay$minute <- klay$period * 12 - klay$minutes_remaining
stephen$minute <- stephen$period * 12 - stephen$minutes_remaining

# Use sink() to send the summary() output of each imported data frame into individuals text files: andre-iguodala-summary.txt, draymond-green-summary.txt, etc. During each sinking operation, the produced summaries should be sent to the output/ folder using relative paths.
sink("./output/andre-iguodala-summary.txt")
summary(andre)
sink()
sink("./output/draymond-green-summary.txt")
summary(andre)
sink()
sink("./output/kevin-durant-summary.txt")
summary(andre)
sink()
sink("./output/klay-thompson-summary.txt")
summary(andre)
sink()
sink("./output/stephen-curry-summary.txt")
summary(andre)
sink()

# Export (i.e. write) the assembled table as a CSV file shots-data.csv inside the folder data/. Use a relative path for this operation.
assemble <- rbind(andre,draymond,kevin,klay,stephen)
write.csv(assemble,"./data/shots-data.csv")

# Use sink() to send the summary() output of the assembled table. Send this output to a text file named shots-data-summary.txt inside the output/ folder. Use a relative path when exporting the R outp
sink("./output/shots-data-summary.txt")
summary(assemble)
sink()
