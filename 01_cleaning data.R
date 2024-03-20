# install and load DPLYR, HERE, SKIMR and JANITOR packages

library(tidyverse)

install.packages("here")
install.packages("skimr")
install.packages("janitor")

library(here)
library(skimr)
library(janitor)
library(dplyr)

# for this practice we'll be using the palmer penguins dataset

install.packages("palmerpenguins")
library(palmerpenguins)

# another useful function to get a summary of the data is the function
skim_without_charts()

skim_without_charts(penguins)

#or HEAD/GLIMPSE
glimpse(penguins)
head(penguins)

# summarizing the data and the column names make it easier to clean them up, 
# select some or exclude others

# to select a column you can use a pipe

penguins %>% 
  select(species)

# likewise, use a pipe and (-column) to select everything, but that column

penguins %>% 
  select(-species)

# if you want to rename a column, use the RENAME function

rename(new_column_name = original_column_name)

penguins %>% 
  rename(island_new = island)

# use RENAME WITH to make the column names consistent
rename_with(dataset, case)

# this will turn the column names to upper case

rename_with(penguins,toupper)


# this will make the column names lower case

rename_with(penguins,tolower)

# to ensure there are only valid characters, numbers, and underscores in the
# column names, use CLEAN NAMES

clean_names(dataset)

clean_names(penguins)



# DATA ORGANIZATION AND FILTERING
# the following functions are useful for organizing and filtering data

# for sorting data in ascending order
arrange(dataset,column_name)
# for sorting data in descending order, use a minus sign before the column name
arrange(dataset,-column_name)

arrange(penguins,bill_length_mm)

arrange(penguins,-bill_length_mm)

# you can also use a pipe
penguins %>% arrange(bill_length_mm)
penguins %>% arrange(-bill_length_mm)

# save the arranged cleaned data as a data frame with the used function
penguins2 <- penguins %>% arrange(-bill_length_mm)
View(penguins2)


# use the group_by() to sort data in conjunction with other functions like
# summarise() to get grouped data by categories
# use drop_na() to avoid considering cells with null values. 
# WARNING: when using drop_na(), rows will be erased from the analysis

dataset %>% group_by(column_with_categories) %>% drop_na() %>%
  summarise(column_name_with_the_summarised_data = mean(column_name_with_data_to_be_classified_by_categories))

# example: to get a table with the average penguins' bill length on each sampled island:

bill_Length_by_island <- penguins %>% group_by(island) %>% drop_na() %>% summarise(mean_bill_length_mm = mean(bill_length_mm))

#example 2: to get a table with the average body mass in both male and female penguins

body_mass_by_sex <- penguins %>% group_by(sex) %>% drop_na() %>% summarise(mean_body_mass_g=mean(body_mass_g))

# by using pipes, you can use a simplified code to group by and sort data by more than
# one column, as well as performing more than one operation for your summarized data

dataset %>% group_by(column1,column2) %>% drop_na() %>%
  summarise(summarised_data_name1 = mean(column3), summarised_data_name2 = mean(column4))

penguin_summary <- penguins %>% 
  group_by(species,island) %>% 
  drop_na() %>% 
  summarise(max_bl = max(bill_length_mm), min_bl = min(bill_length_mm), mean_bl = mean(bill_length_mm))

# use FILTER to obtain results from a certain condition
# since = can be used to assign a variable a value, use = =, meaning "exactly equal"

dataset %>% filter(column == "condition")

adelie_penguins <- penguins %>%
  filter(species == "Adelie")

# you can filter data by more than one condition
adelie_penguins_biscoe <- penguins %>%
  filter(species == "Adelie", island == "Biscoe")