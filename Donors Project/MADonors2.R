library(RSQLite)
library(DBI)
library(tidyverse)
library(magrittr)
library(readxl)

directContJFC <- read_excel("Top MA Donors 2016-2020(2).xlsx", sheet = 2)
JFCContrib <- read_excel("Top MA Donors 2016-2020(2).xlsx", sheet = 3)

fulldata <- full_join(directContJFC, JFCContrib)%>%arrange(contribid, fam)


#### We gotta fix these names man ####

#a0000375486 1 - SLIFKA, RICHARD B
fulldata$contrib[fulldata$contribid == "a0000375486" & fulldata$fam == "1"] <- "SLIFKA, RICHARD B"
#a0000375486 A - SLIFKA, ROSALYN
fulldata$contrib[fulldata$contribid == "a0000375486" & fulldata$fam == "A"] <- "SLIFKA, ROSALYN"

#a0001046417 1 - RASKY, LAWRENCE B
fulldata$contrib[fulldata$contribid == "a0001046417" & fulldata$fam == "1"] <- "RASKY, LAWRENCE B"
#a0001046417 A - RASKY, CAROLYN 
fulldata$contrib[fulldata$contribid == "a0001046417" & fulldata$fam == "A"] <- "RASKY, CAROLYN"

#g1100446477 @ - CITRIN, ANNE J 
fulldata$contrib[fulldata$contribid == "g1100446477" & fulldata$fam == "@"] <- "CITRIN, ANNE J"
#g1100446477 1 - CITRIN, JACOB A 
fulldata$contrib[fulldata$contribid == "g1100446477" & fulldata$fam == "1"] <- "CITRIN, JACON A"

#h1001160073 1 - ZWANZIGER, RON 
fulldata$contrib[fulldata$contribid == "h1001160073" & fulldata$fam == "1"] <- "ZWANZIGER, RON"
#h1001160073 A - ZWANZIGER, JANET 
fulldata$contrib[fulldata$contribid == "h1001160073" & fulldata$fam == "A"] <- "ZWANZIGER, JANET"

#h1001334952 1 - FEELEY, THOMAS M 
fulldata$contrib[fulldata$contribid == "h1001334952" & fulldata$fam == "1"] <- "FEELEY, THOMAS M"
#h1001334952 A - FEELEY, JOAN M 
fulldata$contrib[fulldata$contribid == "h1001334952" & fulldata$fam == "A"] <- "FEELEY, JOAN M"
 
#h3001227354 1 - SIMMONS, IAN T 
fulldata$contrib[fulldata$contribid == "h3001227354" & fulldata$fam == "1"] <- "SIMMONS, IAN T"
#h3001227354 A - SIMMONS, LIESEL A 
fulldata$contrib[fulldata$contribid == "h3001227354" & fulldata$fam == "A"] <- "SIMMONS, LIESEL A"

#U0000000110 1 - SCHUSTER, GERALD
fulldata$contrib[fulldata$contribid == "U0000000110" & fulldata$fam == "1"] <- "SCHUSTER, GERALD"
#U0000000110 A - SCHUSTER, ELAINE M 
fulldata$contrib[fulldata$contribid == "U0000000110" & fulldata$fam == "A"] <- "SCHUSTER, ELAINE M"

#U0000000380 1 - SABAN, HAIM 
fulldata$contrib[fulldata$contribid == "U0000000380" & fulldata$fam == "1"] <- "SABAN, HAIM"
#U0000000380 A - SABAN, CHERYL
fulldata$contrib[fulldata$contribid == "U0000000380" & fulldata$fam == "A"] <- "SABAN, CHERYL"

#U0000003040 1 - BARZUN, MATTHEW W 
fulldata$contrib[fulldata$contribid == "U0000003040" & fulldata$fam == "1"] <- "BARZUN, MATTHEW W"
#U0000003040 A - BARZUN, BROOKE B
fulldata$contrib[fulldata$contribid == "U0000003040" & fulldata$fam == "A"] <- "BARZUN, BROOKE B"

#U0000003074 1 - BEKENSTEIN, JOSHUA B
fulldata$contrib[fulldata$contribid == "U0000003074" & fulldata$fam == "1"] <- "BEKENSTEIN, JOSHUA B"
#U0000003074 A - BEKENSTEIN, ANITA S
fulldata$contrib[fulldata$contribid == "U0000003074" & fulldata$fam == "A"]  <- "BEKENSTEIN, ANITA S"

#U0000003251 1 - RESNICK, STEWART A
fulldata$contrib[fulldata$contribid == "U0000003251" & fulldata$fam == "1"] <- "RESNICK, STEWART A"
#U0000003251 A - RESNICK, LYNDA R 
fulldata$contrib[fulldata$contribid == "U0000003251" & fulldata$fam == "A"] <- "RESNICK, LYNDA R"

#U0000003288 1 - EGERMAN, PAUL L 
fulldata$contrib[fulldata$contribid == "U0000003288" & fulldata$fam == "1"] <- "EGERMAN, PAUL L"
#U0000003288 A - EGERMAN, JOANNE H 
fulldata$contrib[fulldata$contribid == "U0000003288" & fulldata$fam == "A"] <- "EGERMAN, JOANNE H"

#U0000003431 1 - LAVINE, JONATHAN S 
fulldata$contrib[fulldata$contribid == "U0000003431" & fulldata$fam == "1"] <- "LAVINE, JONATHAN S"
#U0000003431 A - LAVINE, JEANNIE D 
fulldata$contrib[fulldata$contribid == "U0000003431" & fulldata$fam == "A"] <- "LAVINE, JEANNIE D"

#U0000003740 1 - HOSTETTER, AMOS B 
fulldata$contrib[fulldata$contribid == "U0000003740" & fulldata$fam == "1"] <- "HOSTETTER, AMOS B"
#U0000003740 A - HOSTETTER, BARBARA W 
fulldata$contrib[fulldata$contribid == "U0000003740" & fulldata$fam == "A"] <- "HOSTETTER, BARBARA W"

#U0000003904 1 - LEBOWITZ, LAURENCE H 
fulldata$contrib[fulldata$contribid == "U0000003904" & fulldata$fam == "1"] <- "LEBOWITZ, LAURENCE H"
#U0000003904 A - ABERLY, NAOMI D 
fulldata$contrib[fulldata$contribid == "U0000003904" & fulldata$fam == "A"] <- "ABERLY, NAOMI D"

#U0000004243 1 - KRUPP, GEORGE D
fulldata$contrib[fulldata$contribid == "U0000004243" & fulldata$fam == "1"] <- "KRUPP, GEORGE D"
#U0000004243 A - KRUPP, LIZBETH H 
fulldata$contrib[fulldata$contribid == "U0000004243" & fulldata$fam == "A"] <- "KRUPP, LIZBETH H"

#U0000004259 1 - FISH, JOHN F 
fulldata$contrib[fulldata$contribid == "U0000004259" & fulldata$fam == "1"] <- "FISH, JOHN F"
#U0000004259 A - FISH, CYNTHIA 
fulldata$contrib[fulldata$contribid == "U0000004259" & fulldata$fam == "A"] <- "FISH, CYNTHIA"

#Y0000037803 L - ATKINS, CHESTER G 
fulldata$contrib[fulldata$contribid == "Y0000037803" & fulldata$fam == "L"] <- "ATKINS, CHESTER G"
#Y0000037803 S - ATKINS, CORINNE C 
fulldata$contrib[fulldata$contribid == "Y0000037803" & fulldata$fam == "S"] <- "ATKINS, CORINNE C"

#Y0000040039 L - KANIN, DENNIS R 
fulldata$contrib[fulldata$contribid == "Y0000040039" & fulldata$fam == "L"] <- "KANIN, DENNIS R"
#Y0000040039 S - KANIN, CAROL A 
fulldata$contrib[fulldata$contribid == "Y0000040039" & fulldata$fam == "S"] <- "KANIN, CAROL A"

#Y0000046458 B - SOLOMONT, REBECCA S
fulldata$contrib[fulldata$contribid == "Y0000046458" & fulldata$fam == "B"] <- "SOLOMONT, REBECCA S"
#Y0000046458 L - SOLOMONT, ALAN, D 
fulldata$contrib[fulldata$contribid == "Y0000046458" & fulldata$fam == "L"] <- "SOLOMONT, ALAN D"
#Y0000046458 S - SOLOMONT, SUSAN L 
fulldata$contrib[fulldata$contribid == "Y0000046458" & fulldata$fam == "S"] <- "SOLOMONT, SUSAN L"

#distinct the table 
fulldata %<>% distinct()

#awesome sauce 

#### Now let's divide into the tables ####

donors <- fulldata %>% select(contrib, contribid, fam, City, State, Zip, Fecoccemp, orgname, ultorg, lastname)%>%
  distinct()

recipients <- fulldata %>% select(cmteid, recipid, recipient, party, recipcode)%>%distinct()

contributions <- fulldata %>% select(fectransid, date, cycle, amount, recipient, contrib, type)%>%
   distinct()


#### Do da database ####
massDatabase <- dbConnect(SQLite(), "my-db.sqlite")
dbWriteTable(massDatabase, "Donors", donors)
dbWriteTable(massDatabase, "Recipients", recipients)
dbWriteTable(massDatabase, "Contributions", contributions)

dbDisconnect(massDatabase)


























 



















 