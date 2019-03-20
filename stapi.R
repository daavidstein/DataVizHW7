library(dplyr)
library(rtrek)
  stapi("character", page_count = TRUE) # check first
  stapi("character", page = 2) %>% select(1:2)
  Q <- stapi("character", uid = "CHMA0000025118")
  Q$episodes %>% select(uid, title, stardateFrom, stardateTo)
  
  
#could look at distribution of stardateFroms
# alternatively, look at the difference between stardateTo and stardateFrom 
#(ie, duration of episode)