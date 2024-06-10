# an example showing the general structure of an if-else statement
a <- 0.3
if(a != 0){
  print(1/a)
}else{
  print("Reciprocal undefined")
}

library(dslabs)
data(murders)


murder_rate <- murders$total / murders$population * 10^5
murder_rate

# an example that tells us which states, if any, have a murder rate less than 0.5
ind <- which.min(murder_rate)
if(murder_rate[ind]<0.3){
  print(murders$state[ind])
}else{
  print("No state has murder rate that low")
}

# the ifelse() function is particularly useful on vectors
b <- c(0, -1, 2, 4, 10)
ifelse(b > -1, 1/b, NA)

# the ifelse() function is also helpful for replacing missing values
data("na_example")
sum(is.na(na_example))

no_nas <- ifelse(is.na(na_example), 0, na_example)
sum(is.na(no_nas))

# the any() and all() functions evaluate logical vectors
z <- c(TRUE, TRUE, FALSE)
any(z)

z <- c(FALSE, FALSE, FALSE)
any(z)

y <- c(TRUE, TRUE, FALSE)
all(y)

y <- c(TRUE, TRUE, TRUE)
all(y)

# example of defining a function to compute the average of a vector x
x <- c(29, 27, 63, 59)
avg <- function(x){
  s <- sum(x)
  l <- length(x)
  s/l
}
# variables inside a function are not defined in the workspace
s<- 5
avg(x)

# we see that the above function and the pre-built R mean() function are identical
identical(mean(x), avg(x))

# functions can have multiple arguments as well as default values
my_fn <- function(x, arithmetic = FALSE){
  n <- length(x)
  ifelse(arithmetic, sum(x)/n, prod(x)^(1/n))
}
my_fn(x)