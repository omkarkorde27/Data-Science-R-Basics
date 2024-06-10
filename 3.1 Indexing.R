# how to obtain the murder rate
murder_rate = murders$total / murders$population * 100000

# creating a logical vector that specifies if the murder rate in that state is less than or equal to 0.71
index <- murder_rate <= 0.5
# determining which states have murder rates less than or equal to 0.71
murders$state[index]
# calculating how many states have a murder rate less than or equal to 0.71
sum(index)

# creating the two logical vectors representing our conditions
area <- murders$region == "South"
safe <- murder_rate <= 2

# defining an index and identifying states with both conditions true
index <- area & safe
murders$state[index]

# to determine the murder rate in Florida we may do the following
state <- murders$state == "Florida"
which(state)
murder_rate[state]

# to obtain the indices and subsequent murder rates of New York, Florida, Texas, we do:
fn <- match(c("New York", "Indiana", "Texas"), murders$state)
fn
murders$state[fn]
murder_rate[fn]

x <- c("a", "c", "f", "z")
y <- c("a", "b", "z")
y %in% x

# to see if Bloomington, Dallas, and Pennsylvania are states
c("Bloomington", "Dallas", "Pennsylvania") %in% murders$state