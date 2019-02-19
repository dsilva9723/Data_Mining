#10.1----
library(tidyverse)
train <- read_csv("https://www.iun.edu/~cisjw/ds/files/data/train.csv",
                  col_types = cols(Survived = col_character(),
                                   Pclass = col_character(),
                                   Name = col_character(),
                                   Sex = col_character(),
                                   Age = col_integer(),
                                   SibSp = col_integer(),
                                   ParentChild = col_integer(),
                                   TicketNumber = col_character(),
                                   Fare = col_double(),
                                   Cabin = col_character(),
                                   Port = col_character(),
                                   LifeBoat = col_integer()),
                  na = "NA"
                  )
test <- read_csv("https://www.iun.edu/~cisjw/ds/files/data/test.csv",
                  col_types = cols(Survived = col_character(),
                                   Pclass = col_character(),
                                   Name = col_character(),
                                   Sex = col_character(),
                                   Age = col_inter(),
                                   SibSp = col_integer(),
                                   ParentChild = col_integer(),
                                   TicketNumber = col_character(),
                                   Fare = col_double(),
                                   Cabin = col_character(),
                                   Port = col_character(),
                                   LifeBoat = col_inter()),
                  na = "NA"
)

#10.2
train %>% slice(1:5)
test %>% slice(1:5)

#10.3
train %>% filter(!is.na(Age)) %>% summarise(mean(Age))

#10.4
train %>% filter(Sex == "Female")

#10.5
train %>% filter(Sex == "Female") %>% filter(Survived == "Yes") %>% summarise(n())

