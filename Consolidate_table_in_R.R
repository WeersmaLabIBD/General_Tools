## Convert 3 columns to matrix
#Creator: Arnau
#Year:2017
#USAGE: Load function in R

library (reshape2)
jeter_filtered_list_ARNAU <- read_csv("~/Desktop/jeter_filtered_list_ARNAU.csv")
x=jeter_filtered_list_ARNAU

#EXAMPLE INPUT

#SAMPLE  CALL    Concatenate
#FHproject_NP1-2   0/1 16_1245582_A_G
#FHproject_NP1-5   0/1 16_1258188_C_G
#FHproject_NP1-16   0/1 16_1260072_A_G
#FHproject_NP1-17   0/1 16_1251821_C_T

x2=df[,c(1,3,2)]  ## Here I just change the order of the columns to make sure that the CALL columns is the last one 
data3 <- dcast(x2, ...~Concatenate)
data3[is.na (data3)] <- 0   ## Change NA's for 0 
data3[data3=="0/1"]<-1 
data3[data3=="1/1"]<-2
write.table(data3,"~/Desktop/my_output.txt", sep="\t", quotes=F)


## Convert list of, e.g medications per sample, into a summary table. 

# EXAMPLE INPUT

#SAMPLE_ID MED1 MED2 MED3
#S1 PPI NA NA
#S2 AB PPI TCA
#S3 AB SSRI NA 

data2=melt($INPUT, id.vars = "SAMPLE_ID")
data3 <- dcast(data2, ...~value)
data4=data3 %>% group_by(LLDEEPID) %>% summarise_each(funs(first(na.omit(.))))
data5[is.na(data5)] <- "Non_user"
rownames(data5)=data5$SAMPLE_ID
data5$LLDEEPID=NULL
data5[data5!="Non_user"]="User"
