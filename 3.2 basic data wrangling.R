library(dplyr)
library(dslabs)

data("murders")

# adding a column to the dataset with mutate
murders <- mutate(murders, rate = total / population * 100000)
head(murders)

# subsetting with filter(meaning extracting rows with specific murder rates)
filter(murders, rate <= 0.71)

# selecting columns with select
new_table <- select(murders, state, region, population, rate)

filter(new_table, rate <= 1)

# using the pipe
murders %>% select(state, region, population, rate) %>% filter(rate <= 1)

dataframe <- data.frame(names = c("Omkar", "DJ", "Govind", "Hrishi", "Surabhi"),
                       Sem_1 = c(9.1, 9.6, 9.5, 9.55, 9.4),
                       Sem_2 = c(7, 9, 8, 8, 9),
                       stringsAsFactors = FALSE)

dataframe
class(dataframe$names)

new_table <- mutate(dataframe, Mean = Sem_1 + Sem_2 / 2)
head(new_table)

new_table %>% select(names, Mean) %>% filter(Mean <= 13.5)

# add the rate column
murders <- mutate(murders, rate =  total / population * 100000, rank = rank(-rate))

# Create a table, call it my_states, that satisfies both the conditions 
my_states <- filter(murders, region %in% c("Northeast", "West") & rate <= 1)
# Use select to show only the state name, the murder rate and the rank
select(my_states, state, rate, rank)




