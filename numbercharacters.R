#setwd("~/Documents/GradSchool/DataViz/Homework/DataVizHW7")
library(rtrek) 
library(tidyverse) 
TNG_uid <- "SEMA0000062876"
DS9_uid <- "SEMA0000073238" 
TOS_uid <- "SEMA0000097474"
VOY_uid <- "SEMA0000000029"
TNG_episodes <- stapi("series", uid = TNG_uid)$episodes$uid
DS9_episodes <- stapi("series", uid = DS9_uid)$episodes$uid
TOS_episodes <- stapi("series", uid = TOS_uid)$episodes$uid
VOY_episodes <- stapi("series", uid = VOY_uid)$episodes$uid
TNG <- tibble(Episode = TNG_episodes, Series = "TNG", NChars = NA, N_F = NA) 
DS9 <- tibble(Episode = DS9_episodes, Series = "DS9", NChars = NA, N_F = NA) 
TOS <- tibble(Episode = TOS_episodes, Series = "TOS", NChars = NA, N_F = NA) 
VOY <- tibble(Episode = VOY_episodes, Series = "VOY", NChars = NA, N_F = NA) 
episodes_df <- bind_rows(TNG, DS9, TOS, VOY)

for(i in 564:nrow(episodes_df)){
  chars <- stapi("episode", 
                 uid = episodes_df$Episode[i])$characters
  if(is.null(nrow(chars))){
    episodes_df$NChars[i] <- NA
    episodes_df$N_F[i] <- NA
  }else{
    women <- chars %>%
      filter(gender == "F")
    episodes_df$NChars[i] <- nrow(chars)
    episodes_df$N_F[i] <- nrow(women)
  }
}

write.csv(episodes_df, "trek_data.csv")
