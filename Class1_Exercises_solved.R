#############Exercise 1
# 1.Create a vector of the names of people sitting near you (at least 5),  make it a variable by giving the vector a name 
peeps <- c('Paul','Natalie','Max','Simon','Erik')


# 2.Similarly make another vector with a guess of how many siblings they each have, name this vector too
siblings <- c(1,1,0,2,3)

# 3.Add 2 to both vectors what happens and why? 
peeps + 2 #non-numeric
siblings + 2 #numeric

# 4.Check the class of both vectors, what does it tell you?
class(peeps) #"character"
class(siblings) #"numeric"

# 5. How many siblings do people have in total?
sum(siblings)

## 6.What is the product of person 1 and 2’s number of siblings?
sum(siblings[1], siblings[2]) #or 
siblings[1] + siblings[2]

#Bonus:
name <- Peter #object not found; Peter is a word, not a command, so put it in quotes!
name <- 'Peter'

#adding a word to a numeric vector
siblings <- c(siblings, "Anita")
siblings*2 #doesn't work

siblings <- siblings[-6]
siblings <- siblings[siblings != "Anita"]
siblings*2 #only has numbers, but doesn't work

#cause it's wrong class
class(siblings)

#changing class
siblings <- as.numeric(siblings) 
siblings*2 #works now!!!




############Exercise 2
#1. Create a dataframe with the previous vectors 
df <- data.frame(name = peeps,siblings = siblings)

#2.  Add gender to the dataframe
df$gender <- c("male","female","male","male","male")

#3.  Add a new person to the dataframe 
#*hint: make sure names in the dataframe are as.character()
class(df$name)
df$name <- as.character(df$name)
df <- rbind(df,c("Helena",4,"female"))

#4.  What is the mean number of siblings?
#*hint: make sure the number of siblings in the dataframe is as.numeric()
mean(df$siblings)
class(df$siblings)
df$siblings <- as.numeric(df$siblings)
mean(df$siblings)

#5.  Ask people how many siblings they have and put the actual numbers as a separate column in your data frame
df$actualnumber <- c(0,2,0,1,3,3)

#6. Make a column with numbers showing how much you were ‘off’
df$off <- df$siblings - df$actualnumber

#7. Comment your code - done



###########Exercise 3
#1. Who has 3 siblings? 
df[df$actualnumber == 3,1] #from dataframe df show [rows with actual number of siblings being 3, just the column 1 since it's the one with names]
#or
df$name[df$actualnumber == 3] #take the vector with all names df$name and show me elements that correspond to actual number being 3

# ...same, same :) 

#2. How many people have more than 2 siblings? 
#two ways for the same idea: length of the list of names witch actual number of siblings being more than 2
length(df[df$actualnumber > 2,1])  #or
length(df$name[df$actualnumber > 2])  

#3. Create a subset of the data containing only people you guessed right
?subset
subdf <- subset(df,df$actualnumber == df$siblings) #return only the part of df, where actual number of siblings is equal to guessed number.

#4. Use ‘?’ to find what these functions do: round(); length(); unique(); mean()

round(mean(df$actualnumber), 3)


#Errors
mean(c(3,4,'cat'))
##
