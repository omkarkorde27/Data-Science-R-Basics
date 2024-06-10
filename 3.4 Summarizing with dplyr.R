library(dslabs)
library(tidyverse)
library(dplyr)
data("murders")
data("NHANES")

murders <- mutate(murders, rate = total / population * 100000)

# minimum, median, and maximum murder rate for the states in the West region
s <- murders %>% filter(region == "West") %>% summarise(minimum = min(rate),
                                                       maximum = max(rate),
                                                       median = median(rate))

s

# accessing the components with the accessor $
s$median
s$maximum

# average rate unadjusted by population size
mean(murders$rate)

# average rate adjusted by population size
us_murder_rate <- murders %>% summarise(rate = sum(total) / sum(population * 100000))
us_murder_rate
class(us_murder_rate)

x <- c(9, 45, 8, 10, 20)
quantile(x, c(0, 0.5, 1))

# minimum, median, and maximum murder rate for the states in the West region using quantile
# note that this returns a vector
murders %>% filter(region == "West") %>% summarise(range = quantile(rate, c(0, 0.5, 1)))

# returning minimum, median, and maximum as a data frame
sto <- function(x){
  r <- quantile(x, c(0, 0.5, 1))
  data.frame(minimum = r[1], median = r[2], maximum = r[3])
}

murders %>% filter(region == "West") %>% summarize(sto(rate))

# us_murder_rate is now stored as a dataframe
murder_us <- murders %>% 
  summarise(rate = sum(total) / sum(population) * 100000) 
class(murder_us) # stored as a dataframe

murder_us                 # returns dataframe
murder_us %>% pull(rate)  # returns numeric value

# using pull to save the number directly
murder_us <- murders %>% 
  summarise(rate = sum(total) / sum(population) * 100000) %>% 
  pull(rate)

# us_murder_rate is now stored as a number
class(murder_us) #stored as a number

murder_us <- murders %>% 
  summarise(rate = sum(total) / sum(population) * 100000) %>% 
  .$rate

murder_us

murders %>% group_by(region) %>% 
  summarise(Mean = mean(rate), Median = median(rate), Minimum = min(rate), Maximum = max(rate))

# order the states by population size - the default is ascending order
murders %>% arrange(population) %>% head()

# order the states by murder rate - the default is ascending order
murders %>% arrange(rate) %>% head()

# order the states by murder rate in descending order
murders%>% arrange(desc(rate)) %>% head()

# order the states by region and then by murder rate within region
murders %>% arrange(region, rate) 

# return the top 10 states by murder rate
murders %>% top_n(10, rate)

# return the top 10 states ranked by murder rate, sorted by murder rate
murders %>% arrange(desc(rate)) %>% top_n(10)


library(dplyr)
library(NHANES)
data(NHANES)

# Use filter and summarize connected by the pipe %>% again. 
# The functions min and max can be used to get the values you want

NHANES %>%
  filter(AgeDecade == " 20-29"  & Gender == "female") %>% 
  summarise(minbp = min(BPSysAve, na.rm = TRUE), maxbp = max(BPSysAve, na.rm = TRUE))

NHANES %>%
  filter(Gender == "female") %>% 
  group_by(AgeDecade) %>% 
  summarise(average = mean(BPSysAve, na.rm = TRUE), standard_deviation = sd(BPSysAve, na.rm = TRUE))

NHANES %>% 
  group_by(AgeDecade, Gender) %>% 
  summarise(average = mean(BPSysAve, na.rm = TRUE), standard_deviation = sd(BPSysAve, na.rm = TRUE))

# compare systolic blood pressure across values of the Race1 variable for males between
# the ages of 40-49.

NHANES %>% 
  filter(Gender == "male", AgeDecade == " 40-49") %>% 
  group_by(Race1) %>% 
  summarise(average = mean(BPSysAve, na.rm = TRUE), standard_deviation = sd(BPSysAve, na.rm = TRUE)) %>% 
  arrange(average, standard_deviation)