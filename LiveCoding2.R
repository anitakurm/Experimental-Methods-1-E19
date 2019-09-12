#1 - getwd(), setwd(), the tab,  GUI, see the header of the console change

## Print my current working directory
getwd() #is my data in there?






## Change my working directory to the following path
#setwd(dir = "/Users/nphillips/Dropbox/yarrr")
setwd(dir = "/Users/nphillips/Dropbox/yarrr")






#2 - read.csv(), ?read.csv(), the tab
?read.table() #an instance of read.table() along with others



#look at data
#use the right format with the right function, or specify header, separator
df <- read.table("NEW_CogSciPersonalityTest2019.csv",header = TRUE, sep = ",")

df <- read.csv("NEW_CogSciPersonalityTest2019.csv")






df <- read.csv("NEW_CogSciPersonalityTest2019.csv")










#3 - packages
#install.packages("pacman") #better write in the terminal, so you don't install it every time you run the whole script

library(pacman)




pacman::p_load(tidyverse) #loads library (installs it if necessary <-  super convenient)



#Slides and cheatsheet!!





#4 logic and filter


# != means not equal

# == means equal

# guess what these mean: '<' '>' '>=' <='

#dataframe[row index, column index]
#df[show rows that have 39 in the shoesize column, all columns]
#shoes39 <- df[df$shoesize == 39,]

#filter for shoe size 40:
shoes40 <- filter(df, shoesize == 40)

gustav_frame <- filter(df,name =="Gustav")

bigfoot_data <- filter(df, df$shoesize >= 45)


#filter by name Pernille
pernille_df <- filter(df, name == "Pernille")

#filter by several arguments
male_lefthanded <- filter(df, gender == 'male' & handedness == 'Left-handed')
 

#filter by any of specified values: columnname %in% c()
pernillegustav <- filter(df, name == "Pernille" | name == "Gustav")
pernillegustav2 <- filter(df, name %in% c("Pernille", "Gustav"))

#lots of conditions:
pernillegustav44  <- filter(df, name == "Pernille" | name == "Gustav" & shoesize == 44)



#subset() - the same as filter()
?subset
both_handedness2 <- subset(df, handedness == "Ambidextrous")


#Exercise 1:






#Answers:
size39plus <- filter(df, shoesize >= 39)
floor_touchers <- filter(df, touch_floor %in% c("Yes","Yes, of course!!" ))
breath_holders <- filter(df, df$breath_hold > mean(df$breath_hold))
balloon_balancers <- filter(df,df$balloon_balance > 13 & balloon_balance < 60)
allmighty <- filter(size39plus, touch_floor %in% c("Yes","Yes, of course!!") & breath_hold > mean(df$breath_hold) & balloon_balance > 13 & balloon_balance < 60)






#5 - arrange()
alphabetical <- arrange(df, name)
reverse_alphabetical <- arrange(df, desc(name))


#Exercise 2:














#Answers
slowtonngue <- arrange(df, desc(tongue_twist))
#let's say best is lonhgest with closed eyes
rank_romberg <- arrange(df,desc(df$romberg_closed))
rank_romberg2 <- arrange(df, desc(df$romberg_closed),desc(breath_hold))











#6 - select() - decreasing size of subset; can be used for ordering
small_df <- select(df,name,gender)
bigger_df <- select(df,name:gender)
picky_df <- select(df,name:shoesize,touch_floor:balloon) 


#remove first column?
df <- select(df,-1)
#remove several columns:
notouch_sound_taste <- select(df,-c(touch_floor,touch_hands, sound_level_pref:taste_blind))


#Exercise 3:











#answers:
repeating <- select(df, name, name, gender)
vars <- c('name', 'shoesize', 'touch_floor')
varsdata <- select(df,vars)
rearranged <- select(df,gender,shoesize, everything())







#7 mutate()
mutated <- mutate(df, breath_hold_min = breath_hold/60)
df <- mutate(df,cealing = (romberg_open == 120))





#Exercise 4:









#Answers:
df <- mutate(df, words_per_sec = tongue_twist/99)
df <- mutate(df, breath_min = breath_hold %/% 60, breath_sec = breath_hold - 60*breath_min)
df <- mutate(df, distance = words_per_sec-mean(words_per_sec))










#8 - summarise()
summarise(df,mean(shoesize))

#with group by
by_gender <- group_by(df, gender)
summarise(by_gender,mean(shoesize))


#pipes!!!
df %>% 
  group_by(gender) %>% 
  summarise(mean(balloon))






#Exersice 5
gendered_balancing <- df %>% 
  group_by(gender) %>% 
  summarise(mean(balloon_balance))

sound_coke <- df %>% 
  group_by(taste_cola) %>% 
  summarise(mean(sound_level_pref))

hand_tongue <- df %>% 
  group_by(handedness) %>% 
  summarise(mean(tongue_twist),n())


