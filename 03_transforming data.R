# example from Course 7, lesson 3

id <- c(1:10)

name <- c("John Mendes", "Rob Stewart", "Rachel Abrahamson", "Christy Hickman", "Johnson Harper", "Candace Miller", "Carlson Landy", "Pansy Jordan", "Darius Berry", "Claudia Garcia")

job_title <- c("Professional", "Programmer", "Management", "Clerical", "Developer", "Programmer", "Management", "Clerical", "Developer", "Programmer")

employee <- data.frame(id, name, job_title)

library(tidyverse)
library(here)
library(skimr)
library(janitor)
library(dplyr)
library(readr)

print(employee)


# use separate() to split data into separate columns

separate(dataframe,column_to_be_split, into = c("new_col1", "new_col2"), sep=" ")
# sep= indicates at which character the data should be split
# sep=" "  sep"_"

two_name_columns <- separate(employee, name, into = c("first_name", "last_name"), sep=" ")

print(two_name_columns)

# use unite() to combine data from different columns into one

unite(dataframe,"new_combined_column", column1, column2, sep = " ")

# in this case, sep=" " indicates if the data should be separated by a character

unite(two_name_columns, "full_name", first_name,last_name,sep=" ")



# Use mutate() to create new variables in the dataframe; to add new columns with calculations

library(palmerpenguins)
View(penguins)

mutate(dataset,new_column = calculations)

penguins %>% 
  mutate(body_mass_kg = body_mass_g/1000)

# you can create multiple columns in the same function
penguins %>% 
  mutate(body_mass_kg = body_mass_g/1000, flipper_length_m = flipper_length_mm/1000)

