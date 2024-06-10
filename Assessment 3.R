library(dslabs)
data(heights)
options(digits = 3)

mean(heights$height)

ht <- heights %>% filter(sex == "Female" & height >= 68.3) %>% select(sex, height)
count(ht)

#What proportion of individuals in the dataset are female?
f <- heights %>% filter(sex == "Female")
count(f)

m <- heights %>% filter(sex == "Male")
count(m)

p <- 238/1050
p

# Determine the minimum height in the heights dataset.
min(heights$height)

# Use the match() function to determine the index of the first individual with the minimum height.
z <- match(50, heights$height)
z

# Subset the sex column of the dataset by the index in 4b to determine the individual’s sex.
filter(heights, height == 50) 

heights %>% summarise(minimum = min(height), maximum = max(height))
k <- c(80)
k
k %in% heights$height

x <- 50:82
x

x %in% heights$height

heights <- mutate(heights, ht_cm = height * 2.54)
head(heights)

heights[18, ]

heights %>% summarise(average = mean(ht_cm))

heights %>% filter(sex == "Female")

heights %>% filter(sex == "Female") %>% summarise(mean = mean(ht_cm))

data(olive)
head(olive)

as_tibble(olive)

# palmitic acid versus palmitoleic acid
plot(olive$palmitic, olive$palmitoleic)

# Create a histogram of the percentage of eicosenoic acid in olive.
hist(olive$eicosenoic)

# Make a boxplot of palmitic acid percentage in olive with separate distributions for each region.
# Which region has the highest median palmitic acid percentage?
boxplot(palmitic~region, data=olive)



  