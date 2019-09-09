# LiveCoding

#Navigation - editor, console, plots, enviroment, creating a script - see slides
# cmd + enter (cntrl + enter) to run the current line

#get help: in console type ? and the function you want to know about
?length() #gives a description of the function

###################################################################################################

#1 Variables, Vectors
#Important: Vector operations, Classes, Append, remove, add, sum, index

#make a variable that contains a number and has identifier 'box' (identifier can be anything you want)
box <- 9

#run just the variable name to see it in the console
box

#check the class of the variables - the class of the variable depends on the values inside
class(box) #"numeric"

#make a variable that contains a word and has identifier 'name'
#R will attempt to execute letters/words/text as commands; to avoid that, use quotation marks
name <- "peter"
class(name) #"character"

#variables can contain more than just one value
#a variable that contains several values is called 'vector' and is created using function c()
#c() means either concatenate (i.e. link together in a chain) or combine <- depends on who you ask
a_vector <- c(2,3,4)
cats <- c(5,6,7)


#create new vector containing variables we defined before
long_vector <- c(cats, a_vector)

#see new vector - all elements of previous vectors are in there!
long_vector

#we can also make vectors, containing different kinds of elements
varia_vector <- c(3, long_vector, "car")
varia_vector
#the class() will always show the type of the most 'complicated' element in the vector
class(varia_vector) #"character"

#if a variable contains a number or a vector of numbers - you can do all sorts of math with it
long_vector + 10

#if it contains at least one non-numeric element - you can't do math stuff
name+4
varia_vector+13

#just doing math stuff is going to give you an output in the console
#if you want R to remember that output, you should make it a variable
triple_vector <- long_vector * 3
triple_vector

#vector's length is an important property!
length(triple_vector)

#you can access specific elements of the vector by specifying the index number of the element
triple_vector[1] #see first element
triple_vector[3] #see third element



#Removing a single (fifth) element from the vector, and rewriting the vector so it stays this way
triple_vector <- triple_vector[-5] 
#removing several elements via their index number - doing the opposite of c() function by adding minus in the front
triple_vector <- triple_vector[-c(1, 2)]

#removing several elements in a row, e.g. remove elements from the first one to the fourth one:
short_vector <- long_vector[-(1:4)]


#what if we take our vector with different kinds of elements and remove the character element?
#if you want to remove element with the exact value you know:
number_vector <- varia_vector[varia_vector != "car"] #or
number_vector2 <- varia_vector[-8]

#number_vector and number_vector2 are the same, so let's remove one of them :)
#variables can be removed using rm()
rm(number_vector2)
#Removing several variables at the same time
rm(box, a_vector, cats, name)


#try to do math stuff to the number_vector from before, e.g. summarize all elements in the vector - now they all are numbers, right?
sum(number_vector) #error says invalid type (character)
typeof(number_vector) #says "character"

#it's fixable!!!! Types/classes of variables can be changed using functions as.numeric, as.character, as.factor, etc...
number_vector <- as.numeric(number_vector)
#do math stuff now, it will work!
sum(number_vector)

######################################################################################################

#2 Dataframes - accessing the dataframe, fixing a datapoint, vector operation (+/-), mean()
#Dataframe is a two-dimensional data structure - containing vectors of equal length

#here are our vectors containing the same number of elements
siblings <- c(1,2,3)
names <- c("Anita", "Fabio", "Karen")

#dataframe is created with the function data.frame()
#data.frame should be filled out like this: data.frame(YourColumnName = CorrespondingVectorOfValues, YourColumnName = CorrespondingVectorOfValues, ...)
df <- data.frame(name = c("Anita","Fabio","Karen"), sibling = siblings)
View(df)

#use $ to look at a specific column (as if it was a vector) in this format: dataframe$columnname 
df$sibling

#do stuff you can normally do to vectors with columns from your df
length(df$sibling)
df$sibling + 15
mean(df$sibling)

#use $ to also add a new column to your df (your df is going to update and have it itself)
df$age <- c(21,20,7)
df$siblingplus2 <- df$sibling + 2 #you can use existing columns when you create new ones

df$gender <- c("Female", "Male", "Female") #why is there a problem? replacement has 3 rows, data has 4 -> Vectors should be the same lenght!!!
df$gender <- c("Female", "Male", "Female", "Female") #works

#you can change formats of whole columns if you want to (just like we did with vectors)
df$name <- as.character(df$name)

#you can add a new row to your dataframe using rbind() function like this: rbind(dataframe, c(same amount of values as other rows in the dataframe))
#you need to rewrite your df for it to remember the new row
df <- rbind(df,c("Millie",4,30))

#keep checking on the class of your columns, in case if formats have changed when you added new rows
class(df$name)

#change formats if you need to
df$name <- as.character(df$name)
df$sibling <- as.numeric(df$sibling)
df$age <- as.numeric(df$age)


#we can access single values in the dataframe by specifying [row index, column index]
#Here I want to access just the name "Anita" - 1st row, 1st column
df[1,1]

#we can change single values by finding them and redefining, e.g. changing value in 2nd row 3rd column to 90 
df[2,3] <- 90

#We can access full rows by leaving the column index in the brackets empty:
df[2,] #access the whole second row 
df[df$name == "Fabio",] #access the whole row with the name "Fabio";  == means equal 

#We can access full column by using $ or leaving the row index empty
df[,2] #is the same as:
df$sibling

#if we leave both indeces empty, we will get all rows and all columns
df[,]

#we can remove whole rows and columns from the dataframe similarly to vectors, we just need two coordinates now
smaller_df <- df[-1,-2] #remove first row and second column
tinier_df <- smaller_df[-3,] #remove just the third row

#we can use c() for efficiency:
teenytiny_df <- df[-c(1,4),-c(1,2)] #remove 1st and 4th rows and remove 1st and 2nd column
#teenytiny_df is in fact now just a tiny vector 


##########################################################################################################


#3 logic - (!=, ==), ; , packages, subset()

# != means not equal

# == means equal

# guess what these means: '<' '>' '>=' <='

#these are logical operators and can be used for things such as this:

df[df$sibling == 2,]#the data where siblings = 2

df[df$sibling >= 2,] #the data where siblings >= 2 (bigger than or equal)

#we can also find single values by knowing other values... sounds confusing but stay with me
#we can access the whole column with number of siblings - by writing the vector df$sibling
#and then we can search the df$sibling vector for the value that corresponds to "Fabio" in the other column
df$sibling[df$name == "Fabio"]

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




#######################################################################################################3
#Solutions to exercises are in a separate file




