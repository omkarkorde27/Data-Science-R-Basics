library(data.table)
library(tidyverse)
library(dslabs)
library(dplyr)

data(murders)

# selecting in dplyr
select(murders, state, region)

# convert the data frame into a data.table object
murders <- setDT(murders)

# selecting in data.table - 2 methods
murders[, .(state, region)] |> head()
murders[, c("state", "region")] |> head()

# adding or changing a column in dplyr
murders <- mutate(murders, rate = total / population * 10^5)

# adding or changing a column in data.table
murders[, rate := total / population * 10^5]
head(murders)
murders[, ":="(rate = total / population * 10^5, rank = rank(rate))]
head(murders)

# y is referring to x and := changes by reference
x <- data.table(a = 1)
y <- x
y

x[, a := 2]
x
y

y[, a := 1]
y
x

x <- data.table(a = 5)
y <- copy(x)
y

x[, a := 2]
y

# subsetting in dplyr
filter(murders, rate <= 0.7)

# subsetting in data.table
murders[rate <= 0.7]

# combining filter and select in data.table
murders[rate <= 0.7, .(state, rate)]

# combining filter and select in dplyr
murders %>% filter(rate <= 0.7) %>% select(state, rate)

data(heights)
heights <- setDT(heights)

# summarizing in dplyr
s <- heights %>% 
  summarize(average = mean(height), standard_deviation = sd(height))

# summarizing in data.table
s <- heights[, .(average = mean(height), standard_deviation = sd(height))]

# subsetting and then summarizing in dplyr
s <- heights %>% 
  filter(sex == "Female") %>%
  summarize(average = mean(height), standard_deviation = sd(height))

# subsetting and then summarizing in data.table
s <- heights[sex == "Female", .(average = mean(height), standard_deviation = sd(height))]

# previously defined function
median_min_max <- function(x){
  qs <- quantile(x, c(0.5, 0, 1))
  data.frame(median = qs[1], minimum = qs[2], maximum = qs[3])
}

# multiple summaries in data.table
s <- heights[, .(median_min_max(height))]
s

# grouping then summarizing in data.table
heights[, .(average = mean(height), standard_deviation = sd(height)), by = sex]

# order by population
murders[order(population)] |> head()

# order by population in descending order
murders[order(population, decreasing = TRUE)] |> head()

# order by region and then murder rate
murders[order(region, rate)]

murders %>% group_by(region)

murders %>% group_by(region) %>% class()

# compare the print output of a regular data frame to a tibble
gapminder
as_tibble(gapminder)

# compare subsetting a regular data frame and a tibble
class(murders[,1])
class(as_tibble(murders[, 1]))

# access a column vector not as a tibble using $
class(as_tibble(murders)$state)

# compare what happens when accessing a column that doesn't exist in a regular data frame 
# to in a tibble
murders$State
as_tibble(murders)$State

# create a tibble
tibble(id = c(1,2,3), func = c(mean, median, sd))
