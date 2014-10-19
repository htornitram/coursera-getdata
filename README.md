---
title: "README.md"
output: html_document
---

## README for run_analysis.R

This script is a solution to the course project in Coursera/JHU's "Getting and Cleaning Data". It loads and transforms data from the [UCI "Human Activity Recognition Using Smartphones" study](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The specific data files are found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). Data from both the "train" and "test" datasets are combined for this processing, with no differentiation.

This script generates a "tidy" data set containing the average mean and average standard deviation of measurements of each "feature" of the smartphone's gyroscope and accelerometer for each tested subject performing each tested activity. It is stored in the working directory as "tidyHAR.txt", and can be read back into R with this command:

```
tidyHAR <- read.table("tidyHAR.txt", header = TRUE)
```

A more complete description of the output can be found in the Codebook.md file.

The "dplyr" and "tidyr" packages are required, and the script assumes that
the working directory has already been set to the "UCI HAR Dataset" directory extracted from the zipped data file. The "test" and "train" subdirectories should be immediate children of the working directory.

