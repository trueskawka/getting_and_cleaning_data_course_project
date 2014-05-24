library(reshape2)

#read the files
#set and remember working directory (wd)
setwd(choose.dir())
work <- getwd()

#remember the names in wd, for further comparison with the .zip file structre of folders
b <- list.dirs(work, full.names=F)
directories <- c("", "test","test/Inertial Signals","train","train/Inertial Signals")

#checks for directories in wd - if the structure is as in the downloaded .zip file, it takes it into account
#otherwise it reads files just from wd main folder
if (all(sort(b) == directories)){
  columns <- read.table(paste(work, "/features.txt", sep=""))
  ttsubject <- read.table(paste(work, "/", directories[2], "/subject_test.txt", sep=""))
  ttXX <- read.table(paste(work, "/", directories[2], "/X_test.txt", sep=""))
  ttyy <- read.table(paste(work, "/", directories[2], "/y_test.txt", sep=""))
  
  trsubject <- read.table(paste(work, "/", directories[4], "/subject_train.txt", sep=""))
  trXX <- read.table(paste(work, "/", directories[4], "/X_train.txt", sep=""))
  tryy <- read.table(paste(work, "/", directories[4], "/y_train.txt", sep="")) 
} else {
  columns <- read.table(paste(work, "/features.txt", sep=""))
  ttsubject <- read.table(paste(work, "/subject_test.txt", sep=""))
  ttXX <- read.table(paste(work, "/X_test.txt", sep=""))
  ttyy <- read.table(paste(work, "/y_test.txt", sep=""))
  
  trsubject <- read.table(paste(work, "/subject_train.txt", sep=""))
  trXX <- read.table(paste(work, "/X_train.txt", sep=""))
  tryy <- read.table(paste(work, "/y_train.txt", sep="")) 
}

#change colnames (for rbind to work)
colnames(ttXX) <- columns$V2
colnames(ttyy) <- c("Activity")
colnames(ttsubject) <- c("Subject")

colnames(trXX) <- columns$V2
colnames(tryy) <- c("Activity")
colnames(trsubject) <- c("Subject")

#extract only the measurements on the mean and standard deviation for each measurement
ttXX2 <- ttXX[,grep("mean()",colnames(ttXX))]
ttXX2 <- ttXX2[,-grep("meanFreq()",colnames(ttXX2))]
ttXX3 <- ttXX[,grep("std()",colnames(ttXX))]
tt <- cbind(ttsubject,ttyy,ttXX2,ttXX3)

trXX2 <- trXX[,grep("mean()",colnames(trXX))]
trXX2 <- trXX2[,-grep("meanFreq()",colnames(trXX2))]
trXX3 <- trXX[,grep("std()",colnames(trXX))]
tr <- cbind(trsubject,tryy,trXX2,trXX3)

#merge the training and the test sets to create one data set
complete_set <- rbind(tt,tr)

#use descriptive activity names to name the activities & appropriately label the data set with descriptive activity names
alabels <- read.table(paste(work, "/activity_labels.txt", sep=""))
complete_set$Activity = factor(complete_set$Activity, levels =c(1,2,3,4,5,6), labels = alabels$V2)

#creates a second, independent tidy data set with the average of each variable for each activity and subject
tidy <- melt(complete_set,id=c("Subject","Activity"))
tidy2 <- dcast(tidy, Subject + Activity ~ variable, mean)

write.table(tidy2, file=paste(work, "/tidy_data.txt", sep=""), sep="\t")