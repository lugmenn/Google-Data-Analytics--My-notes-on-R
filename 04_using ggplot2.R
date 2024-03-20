library(tidyverse)
library(palmerpenguins)
data("penguins")
View(penguins)

# to use ggplot2()
# initiate with specifying which dataset to use

ggplot(data=dataset)

# add a new layer to the plot with +
+
# specify which geommetry you'll be using (depends on which plot is best for your data scatter plot, bar graphs, etc.)

geom_point()

# assign a variable to each axis with mapping=aes(). Used for mapping an aesthetic

(mapping = aes (x= "variable_1", y= "variable 2"))


#eg

ggplot(data=penguins) + geom_point(mapping=aes(x= flipper_length_mm, y=body_mass_g))

# you can add attributes to each variable in the plot if color, size, shape, alpha are added
# within the mapping=aes()

ggplot(data=dataset) + geom_point(mapping = aes (x= "variable_1", y= "variable 2", color="variablex",shape="variablex",size="variablex",alpha="variablex"))

ggplot(data=penguins) + geom_point(mapping=aes(x= flipper_length_mm, y=body_mass_g, color=species))

ggplot(data=penguins) + geom_point(mapping=aes(x= flipper_length_mm, y=body_mass_g, shape=species))

# you can use multiple functions within the aes() and assign more than one attribute to the same variable

ggplot(data=penguins) + geom_point(mapping=aes(x= flipper_length_mm, y=body_mass_g, color=species, size=species))

ggplot(data=penguins) + geom_point(mapping=aes(x= flipper_length_mm, y=body_mass_g, shape=species, alpha=species))

# if you want to assign an attribute to all variables, add the function outside of the aes(), but within the geom() and use quotation marks

ggplot(data=dataset) + geom_point(mapping = aes (x= "variable_1", y= "variable 2"),color="color")

ggplot(data=penguins) + geom_point(mapping=aes(x= flipper_length_mm, y=body_mass_g),color="purple")

ggplot(data=penguins) + geom_point(mapping=aes(x= flipper_length_mm, y=body_mass_g, shape=species),color="purple")




# please, do not be alarmed, remain calm. Do not attempt to leave the dancefloor; 
#the DJ booth is conducting a troubleshoot test of the entire system

avg_body_mass <- penguins %>% group_by(species) %>% drop_na() %>% summarise(avg_bm = mean(body_mass_g))
avg_body_mass
ggplot(data=avg_body_mass) + geom_bar(mapping = aes)

# D: ?

# use different geoms to communicate data in an specific way
# you can also combine different geoms on the same plot by combining different layers


# GEOM_SMOOTH

geom_point()+geom_smooth()

ggplot(data = penguins) + geom_point(mapping = aes(x= flipper_length_mm, y=body_mass_g)) +
  geom_smooth(mapping = aes(x= flipper_length_mm, y=body_mass_g))

# CHECK OUT GGPLOT2 GUIDELINE TO FIND WHICH AESTHETICS YOU CAN CUSTOM FOR EACH GEOM

ggplot(data = penguins) + geom_point(mapping = aes(x= flipper_length_mm, y=body_mass_g)) +
  geom_smooth(mapping = aes(x= flipper_length_mm, y=body_mass_g,linetype=species))

ggplot(data = penguins) + geom_smooth(mapping = aes(x= flipper_length_mm, y=body_mass_g,linetype=species))

# GEOM_JITTER

ggplot(data = penguins) + geom_jitter(mapping = aes(x= flipper_length_mm, y=body_mass_g))




# BAR CHARTS

# geom_bar()

ggplot(data = dataset) + geom_bar(mapping = aes(x=variable_to_plot))

# no need to assign a variable to the y axis

# example
data("diamonds")

ggplot(data = diamonds) +
  geom_bar(mapping = aes(cut))

# color aes just affects the ouline of the bar
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x=cut, color= cut))

# use fill aes to change the inside of the bar color

ggplot(data = diamonds) +
  geom_bar(mapping = aes(cut, fill= cut))

# create a STACKED BAR CHART by mapping fill= to a different variable

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x= cut, fill= clarity))

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x=cut, weight= cut))


# use FACETS to show smaller groups or subsets of your data in its each own plot
# add the facet() as a new layer

# facet your plot by a single variable
facet_wrap(~ variable)

# facet your plot with two variables.
# facet vertically by the first variable
# facet horizontally by the second variable
facet_grid(variable1 ~ variable2)


ggplot(data = penguins) +
  geom_point(mapping = aes(x= flipper_length_mm, y=body_mass_g, color = species)) +
  facet_wrap(~species)


ggplot(data = diamonds) +
  geom_bar(mapping = aes(x=color, fill=cut)) +
  facet_wrap(~cut)

ggplot(data = penguins) +
  geom_point(mapping = aes(x= flipper_length_mm, y=body_mass_g, color = species)) +
  facet_grid(species~sex)

# you can also use facet_grid with a single variable

ggplot(data = penguins) +
  geom_point(mapping = aes(x= flipper_length_mm, y=body_mass_g, color = species)) +
  facet_grid(~sex)

ggplot(data = penguins) +
  geom_point(mapping = aes(x= flipper_length_mm, y=body_mass_g, color = species)) +
  facet_grid(~species)
