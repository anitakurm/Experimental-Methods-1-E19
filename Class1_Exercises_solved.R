#############Exercise 1

peeps <- c('Paul','Natalie','Max','Simon','Erik')
siblings <- c(1,1,0,2,3)

peeps + 2
siblings + 2

class(peeps)
class(siblings)

sum(siblings)
sum(siblings[1], siblings[2])
siblings[1] + siblings[2]

name <- Peter
name <- 'Peter'

siblings <- c(siblings, "Anita")
siblings*2

siblings <- siblings[-6]
siblings*2


############Exercise 2
df <- data.frame(name = peeps,siblings = siblings)

df$gender <- c("male","female","male","male","male")

class(df$name)
df$name <- as.character(df$name)

df <- rbind(df,c("Helena",4,"female"))

df$name <- as.factor(df$name)

mean(df$siblings)
class(df$siblings)
df$siblings <- as.numeric(df$siblings)
mean(df$siblings)

df$actualnumber <- c(0,2,0,1,3,3)
df$off <- df$siblings - df$actualnumber



###########Exercise 3
df[df$actualnumber == 3,]
length(df[df$actualnumber > 2,1])

subdf <- subset(df,df$actualnumber == df$siblings)

round(mean(df$actualnumber), 3)


#Errors
mean(c(3,4,'cat'))
##
