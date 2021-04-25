setwd("~/R/Genome")
filenames <- list.files("~/R/Genome/data")

#reading all of the files 
list.files <- lapply(filenames, read.table)
#assigning names to the files
names(list.files) <- filenames

#filtering the files to only contain chromosome 1
list.files <- lapply(list.files, filter, V2 == '1')

#merging files
Ind_1_and_2 <- merge(list.files[1], list.files[2]) #has 34664 rows
Ind_1_and_3 <- merge(list.files[1], list.files[3]) #has 32706 rows

#creating a vector containing 3 genomes
Ind_2_to_4_genomes <- c(list.files[2], list.files[3], list.files[4])

#trying to speed up process by merging each file in Ind_2_to_4_genomes with list.files[1]
for (i in 1:length(Ind_2_to_4_genomes)) {
  result <- list()
  result <- c(vector, merge(Ind_2_to_4_genomes[[i]], list.files[1]))
  return(result)
} #but vector is too large


#checking if identical() will work
identical(list.files[1], list.files[2])
#evaluates to false

#replacing '--' with NA (from something I did previously)
Individual_1 <- replace_with_na(Individual_1, replace = list(V4 = '--'))

