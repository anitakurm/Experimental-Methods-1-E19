#Cleaning personality data in the middle of the night

getwd() #both datafiles are in there, good

#packages
pacman::p_load(tidyverse)

#load data (2018 as a point of reference)
data2018 <-  read.csv("CogSciPersonalityTest2018.csv")
data <- read.csv2("The CogSci Personality Test 2019 DATA.csv")

#remove first two columns
data <- select(data,-c(1,2))

#getting the columns we need (same variables as in 2018 data)
d <- data.frame(name = data$Please.write.your.first.name.,
         birth_day = data$Please.indicate.your.date.of.birth,
         shoesize = data$Please.indicate.your.shoe.size.,
         gender = data$Please.write.your.gender,
         native_Danish = data$Is.Danish.your.native.language.,
         handedness = data$Handedness,
         choose_rand_num = data$Choose.a.number.between.1.and.10,
         touch_floor = data$Question.1,
         touch_hands = data$Question.2,
         ratio2d4d = data$Question.3,
         balloon = data$Question.4,
         balloon_balance = data$Question.5,
         breath_hold = data$Question.6,
         bad_choices = data$Question.7,
         tongue_twist = data$Question.8,
         romberg_open = data$Question.9,
         romberg_closed = data$Question.10,
         ling_animal = data$Question.11,
         ling_adjective = data$Question.19,
         ling_kiki = data$Question.20,
         ocular_dom = data$Question.21,
         vis_duck = data$Question.24,
         hours_music_per_week = data$Question.31,
         sound_level_pref = data$Question.32,
         taste_cola = data$Question.39,
         taste_blind = data$Question.40
         )


#encoding results (renaming factor levels)
#the assignment function levels can be used to change the levels
#the order will remain the same i.e. 'yes' for 'option 1' and 'no' for 'option 2'
levels(d$touch_floor) <- c('Yes, of course!!', 'Yes', 'I used to be able to do it', 'No', 'Hell no!!')
levels(d$touch_hands) <- c('Yes, of course!!', 'Yes', 'I used to be able to do it', 'No', 'Hell no!!')
levels(d$bad_choices) <- c('Eiffel Tower', 'Rattle Snake','Ultra Marathon','White shark','Damascus')
levels(d$ling_animal) <- c('Dog','Horse','Raven','Bear','Elk')
levels(d$ling_adjective) <- c('Nice','Exciting','Puzzling','Easy')
levels(d$ling_kiki) <- c('Kiki','Bouba')
levels(d$ocular_dom) <- c('Left','Right','Both')
levels(d$vis_duck) <- c('Duck', 'Rabbit')

#change birthday format
d$birth_day <- as.Date(d$birth_day, format = "%d/%m/%Y")

#write new data file
write.csv(d, file = "NEW_CogSciPersonalityTest2019.csv")
