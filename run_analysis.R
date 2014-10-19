### run_analysis.R
### for Coursera "Getting and Cleaning Data"

# requires packages...
library(dplyr)
library(tidyr)

## assumes working directory already set to the base "UCI HAR Dataset"
## directory, with "test" and "train" subdirs in place as distributed

# Read in Activity Labels and set names.
actLabels <- read.table("activity_labels.txt")
names(actLabels) <- c("activity_id", "activity")

# Read in Features and set names.
features <- tbl_df(read.table("features.txt"))
names(features) <- c("feature_id","feature")

# We're only going to want the mean and std calculations, so we'll transform
# and filter the features data frame for each, then recombine them.
fMean <- features %>% 
     filter(grepl("-mean()", feature, fixed = TRUE)) %>% 
     mutate(fvar = "mean", feature = sub("-mean()", "", feature, fixed = TRUE))

fStd <- features %>% 
     filter(grepl("-std()", feature, fixed = TRUE)) %>% 
     mutate(fvar = "std", feature = sub("-std()", "", feature, fixed = TRUE))

features <- rbind(fMean, fStd)

# Each of the "test" and "train" datasets has a large file with only the
# observations, with columns matching the features listed in the master list, 
# plus files with the activity and subject id's corresponding to each row.
# We'll load them, set headers for the subject and activity, and match them up.
# For now, we leave the rest of the columns as "V1", V2", etc.
X_test <- read.table("test/X_test.txt")
Y_test <- read.table("test/y_test.txt")
names(Y_test) <- "activity_id"
S_test <- read.table("test/subject_test.txt")
names(S_test) = "subject"
All_test <- cbind(S_test, Y_test, X_test)

X_train <- read.table("train/X_train.txt")
Y_train <- read.table("train/y_train.txt")
names(Y_train) <- "activity_id"
S_train <- read.table("train/subject_train.txt")
names(S_train) <- "subject"
All_train <- cbind(S_train, Y_train, X_train)

# We need to combine the "train" and "test" data, transform it so that
# each of the observations has a row, and turn the "feature" ids into
# numbers. We can then inner join to the features data, which inherently
# filters out rows for the measurements we already eliminated, and to
# the activity data, allowing us to keep the names and discard the extra ids.
HAR <- tbl_df(rbind(All_train, All_test)) %>%
     gather(feature_id, measurement, -subject, -activity_id) %>%
     mutate(feature_id = extract_numeric(feature_id)) %>%
     inner_join(features) %>%
     inner_join(actLabels) %>%
     select(subject, activity, feature, fvar, measurement)

# We can now clean up our environment, freeing memory if needed by removing
# things we're done with...
rm(All_test,All_train,X_test,X_train,Y_test,Y_train,S_test,S_train,fMean,fStd)


# To make a tidy data set, we need to get the mean of all observations of
# each type, grouped by subject, activity, and feature along with the variable
# (mean or std). We can spread out the mean and std variables into their
# own columns. (Note that we need to "ungroup" the data frame before running
# spread due to a quirk in the dplyr functionality for grouped tables.)
tidyHAR <- HAR %>%
     group_by(subject,activity,feature,fvar) %>%
     summarize(fval = mean(measurement)) %>%
     ungroup %>%
     spread(fvar, fval)

# And finally, we'll write our tidy data set out to a file.
write.table(tidyHAR, "tidyHAR.txt", row.names = FALSE)

