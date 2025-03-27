# Intro to R using FEC Data
# lightly annotated demo script

# R BASICS-----

# R as a calculator
4 + 5 
1/2 
5^2

# R uses PEMDAS
4 + 7 * 2^3

# Complex Math Functions
log(20)

# Comparisons
1 == 1
1 < 1
1 != 2

# Variables
x <- 3
y <- x^3
z <- x + y

# Installing & Loading Packages-----
install.packages("readr") # install a package once each time you update R
library(readr) # call a package in each R session

# Install & Load Packages for demo
install.packages("tidyverse") # manipulation, graphing & more
install.packages("knitr") # for creating documents
install.packages("forcats") # help with categorical variables

library(tidyverse,
        knitr,
        forcats) #can also put packages in their own library() commands

# Importing Data-----
fec_raw <- read_csv("politicalcontributions_smalldonations_q1q2_2024.csv")
    # will need to specify filepath, if not in directory of project
    # suggest navigating in 'Files" pane, clicking desired data, then copying filepath

# View first few rows
head(fec_raw)
?head # getting help

# View column names
colnames(fec_raw)
help(colnames) # another way to get help

# Data Manipulation-----

# Selecting Columns & Rows, Renaming
fec <- select(fec_raw, !"...1") # removes column
fec <- fec_raw %>% # pipe %>% allows multiple functions
  select(donor_city, # select columns
         donation_date,
         contribution_receipt_amount) %>% #multiple pipes can be used
  rename(amount = contribution_receipt_amount) %>% #new col name = old col name
  filter(amount > 0) # removes rows based on condition

# Summary
summary(fec)
summary(fec$amount)

# Grouped Summary
fec_by_city <- fec %>%
  group_by(donor_city) %>%
  summarize(total_amt = sum(amount), # can also spell summarise()
            count = n(),
            amt_pp = (sum(amount) / n()))

# Plotting-----
# Plotting in base R
boxplot(fec_by_city$amt_pp)
plot(fec_by_city$total_amt)

# GGplot
fec_by_city %>%
  ggplot(aes(x = amt_pp, y = total_amt)) + # plot background & axes
  geom_point() # geometry layer

fec_by_city %>%
  top_n(10, total_amt) %>% # selects 10 highest total donation cities
  ggplot(aes(x = fct_reorder(donor_city, total_amt), y = total_amt, fill = amt_pp)) +
  geom_col() + # geom_col & geom_bar make same graph with different options
  labs(title = "Top 10 Cities by Total Donations", # labels
       x = "City",
       y = "Total Donations",
       fill = "Avg. Donation") +
  theme_minimal() + # make background more simple
  coord_flip() # flip x & y
