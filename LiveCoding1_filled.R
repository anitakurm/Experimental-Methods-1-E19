# LiveCoding

#Navigation - editor, console, plots, enviroment, creating a script



#1 Variables Vectors - Vector operations, Classes, Append, remove, add, sum, index

#make a variable that contains a number and has identifier 'box'
box <- 9
box
class(box)

name <- "peter"
class(name)

a_vector <- c(2,3,4)
cats <- c(2,3,4)
cats

group1 <- c(cats, a_vector)
group1

a_vector + 3
name+4

a_vector
a_vector[1]
a_vector[3]

length(a_vector)

a_new_vector <- a_vector * 3
a_new_vector

a_new_vector <- c(3, a_new_vector, "car")
a_new_vector

class(a_new_vector)

name2 <- c(Peter, Anita)
name3 <- c(box,5)

a_new_vector <- a_new_vector[-5] 
a_new_vector2 <- a_new_vector[-c(1, 2)] 

rm(box)

a_new_vector <- as.numeric(a_new_vector)
sum(a_new_vector)


#2 Dataframes - accessing the dataframe, fixing a datapoint, vector operation (+/-), mean()

siblings <- c(1,2,3)
names <- c("a", "b", "c")

df <- data.frame(name = c("a","b","c"), sibling = siblings)
View(df)

df$name

df$age <- c(13,20,20)

df$name <- as.character(df$name)
df$gender <- as.character(df$gender)

df <- rbind(df,c("g",5))
df$name <- as.character(df$name)
df <- rbind(df,c("d",10))

df <- df[-c(1,2),]


df
df$sibling <- as.numeric(df$sibling) #fixing variable
df
df[1,1]

df[1,2] <- 3

df[1,]

df[,]


df$siblingplus2 <- df$sibling+2

mean(df$Sibling)

rbind(df, c("d", 4))

class(df$Name)

df$Name <- as.character(df$Name)

rbind(df, c("g", 1, 2))

df$gender <- c("Female", "Male", "Female", "Male") #why is there a problem?

df <- rbind(df, c("t", 1, 2))

df$gender <- c("Female", "Male", "Female", "Male")

df$gender <- as.factor(df$gender)


#3 logic - (!=, ==), ; , packages, subset()

#!= means not equal

#== mean equal

# guess what these means: '<' '>' '>=' <='

#these are logical operators and can be used for things such as this:

df[df$sibling == 2,]#the data where siblings = 2

df[df$sibling >= 2,] #the data where siblings >= 2 (bigger than or equal)

subset(df, gender == "Female") #creates a subset of the data based on condition (only females)


?length() #gives a description of the function

install.packages("beepr") #install package

library(beepr) #load package

beep(5) #use a function from the package

#Extra 


#You should be able to do this :) Find how to fix the following code:

names <- c("Peter", "Natalie", "Maya")
n_pets <- c(1,3,8)
pet_frame <- data.frame(names=names n_pets=n_pets)



