---

output: html_document
---

## Codebook for tidyHAR data

The tidyHAR dataset is structured in columns for five variables, described below.

### subject
numeric: ID number specifying which person was carrying the device for these measurements.

### activity
character: Which of the designated tasks the subject was performing. One of the following values:

* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

### feature
character: The "feature" of the device's accelerometer or gyroscope being measured, with the dimension (XYZ) specified where applicable. One of the following values:

- tBodyAcc-X
- tBodyAcc-Y
- tBodyAcc-Z
- tGravityAcc-X
- tGravityAcc-Y
- tGravityAcc-Z
- tBodyAccJerk-X
- tBodyAccJerk-Y
- tBodyAccJerk-Z
- tBodyGyro-X
- tBodyGyro-Y
- tBodyGyro-Z
- tBodyGyroJerk-X
- tBodyGyroJerk-Y
- tBodyGyroJerk-Z
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-X
- fBodyAcc-Y
- fBodyAcc-Z
- fBodyAccJerk-X
- fBodyAccJerk-Y
- fBodyAccJerk-Z
- fBodyGyro-X
- fBodyGyro-Y
- fBodyGyro-Z
- fBodyAccMag
- fBodyBodyAccJerkMag
- fBodyBodyGyroMag
- fBodyBodyGyroJerkMag

### mean
numeric: The average of all means reported in the HAR data for the particular subject, activity, and feature. Note that values from the HAR data are normalized and bounded within [-1,1].

### std
numeric: The average of all standard deviations reported in the HAR data for the particular subject, activity, and feature. Note that values from the HAR data are normalized and bounded within [-1,1].
