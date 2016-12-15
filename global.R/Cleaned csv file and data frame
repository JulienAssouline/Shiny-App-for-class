library(dplyr)
#import data
BP_Pitcher_1967_2016 <- read.csv("BP Pitcher 1967 2016.csv")

BP_Pitcher_1967_20161 <- BP_Pitcher_1967_2016

#Changes all NAs to 0
BP_Pitcher_1967_20161[is.na(BP_Pitcher_1967_20161)] <- 0
#convert factor variables to numeric
BP_Pitcher_1967_20161$PA <- as.numeric(as.character(BP_Pitcher_1967_20161$PA))
BP_Pitcher_1967_20161$AB <- as.numeric(as.character(BP_Pitcher_1967_20161$AB))

#Group by year, and get the mean of the variable for almost every column and convert into a dataframe
BP_Pitcher_1967_2016_trends <- BP_Pitcher_1967_20161 %>% group_by(YEAR) %>%
  summarise(AGE = mean(AGE), G = mean(G), GS = mean(GS), PITCHES = round(mean(PITCHES), digits = 2),
            IP = mean(IP), IP.Start = mean(IP.Start), IP.Relief = mean(IP.Relief),
            W = mean(W), L = mean(L), SV = mean(SV), BS = mean(BS), PA = mean(PA),
            AB = mean(AB), R = mean(R), ER = mean(ER), H = mean(H), X1B = mean(X1B),
            X2B = mean(X2B), X3B = mean(X3B), HR = mean(HR), TB = mean(TB), BB = mean(BB),
            UBB = mean(UBB), IBB = mean(IBB), SO = mean(SO), HBP = mean(HBP), SF = mean(SF),
            SH = mean(SH), PPF = mean(PPF), FIP = mean(FIP), cFIP = mean(cFIP), ERA = mean(ERA), DRA = mean(DRA),
            PWARP = mean(PWARP)) %>% as.data.frame()
