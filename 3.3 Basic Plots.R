library(dslabs)
library(dplyr)
data(murders)


# a simple scatterplot of total murders versus population
population_in_millions <- murders$population/10^6
gun_murders <- murders$total
plot(population_in_millions, gun_murders)

murders <- mutate(murders, rate = total / population * 100000)
murders

# a histogram of murder rates
hist(murders$rate)
murders$state[which.max(murders$rate)]
murders$state[which.min(murders$rate)]

# boxplots of murder rates by region
boxplot(rate~region, data = murders)