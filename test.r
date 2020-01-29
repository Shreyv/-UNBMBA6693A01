install.packages("dplyr")
library(dplyr)

#Question1
# reading csv datas into dataframe
demo_df = read.csv("Demographic data.csv",header = TRUE)
demo_credit = read.csv("Credit Bureau data.csv",header = TRUE)

#replacing empty strings to NA
demo_df[demo_df==""]<-NA
demo_credit[demo_credit==""]<-NA

#Question2
# removing duplicate on ApplicationIDS 
demo_df = demo_df %>% distinct(Application.ID,.keep_all = TRUE) 
demo_credit = demo_credit %>% distinct(Application.ID,.keep_all = TRUE) 

#Question3
#Counting Common Application IDS
common_id <- intersect(demo_df$Application.ID,demo_credit$Application.ID)
length(common_id)

#Question4
df_join<-merge(x=demo_df,y=demo_credit,by="Application.ID")
