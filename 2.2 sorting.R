library(dslabs)
data("murders")

sort(murders$total)

x <- c(2, 1, 19, 15, 50)
sort(x)

index <- order(x)
index

x[index]
rank(x)

index <- order(murders$total)

murders$abb[index]

min <- which.min(murders$total)
min

murders$state[min]

max <- which.max(murders$total)
murders$state[max]

x <- c(2, 43, 27, 96, 18)

sort(x)
order(x)
rank(x)
min(x)