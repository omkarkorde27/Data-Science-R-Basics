# # We may create vectors of class numeric or character with the concatenate function
country <- c("India", "USA", "Germany", "Italy")
capital <- c("Delhi", "Washington", "Berlin", "Rome")

# We can also name the elements of a numeric vector using the names() function
names(capital) <- country
capital

country <- c("India" = "New Delhi", "USA" = "Washington DC", "Germany" = "Berlin", "Italy" = "Rome")
country


seq(1, 10)
seq(1,10,3)
1:10

# Using square brackets is useful for subsetting to access specific elements of a vector
capital[3]
capital[c(1,4)]
capital[2:4]

# If the entries of a vector are named, they may be accessed by referring to their name

capital[c("USA", "Italy")]


# Vector coercion
x <- c(1, "canada", 3) # R coerced the data into a character
class(x)

x <- 1:5
y <- as.character(x)
y
as.numeric(y)

x <- c("1", "b", "3")
as.numeric(x)
