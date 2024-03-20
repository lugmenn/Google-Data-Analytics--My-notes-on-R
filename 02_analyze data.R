# first, let's install the Anscombe Quartet
# these are four data sets that have nearly identical summary statistics,
# which might be misleading, and visualizations can help to discover the not-so obvious results

install.packages("Tmisc")
library(tidyverse)
library(Tmisc)
data("quartet")
View(quartet)


# the data set will be analyzed by its mean, standard deviation for each variable and  their correlation for each set
quartet %>% 
  group_by(set) %>%
  summarise(mean(x), sd(x),mean(y), sd(y), cor(x,y))

# notice how the statistical values are almost identical acroos all four groups
# sometimes, just looking at summarized data can be misleading

# explore your data in multiple ways to know its full story

ggplot(quartet, aes(x,y)) + geom_point() + geom_smooth(method = lm, se=FALSE) + facet_wrap(~set)

install.packages("datasauRus")
library(datasauRus)

ggplot(datasaurus_dozen, aes(x=x,y=y, colour=dataset)) + geom_point() + theme_void() + theme(legend.position = "none") + facet_wrap(~dataset, ncol = 3)



# before analyzinf data, it is convenient to check if its unbiased

# bias() compares the actual outcome against a predicted outcome. The closer to 0, the less biased tha data is
# to use bias(), install the SimDesign package

install.packages("SimDesign")
library(SimDesign)

# for this example, we'll compare actual-registered temperatures against forecasted temperatures

actual_temp <- c(68.3, 70, 72.4, 71, 67, 70)
predicted_temp <- c(67.9, 69, 71.5, 70, 67, 69)

bias(actual_temp,predicted_temp)