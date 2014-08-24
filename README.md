getdata-006-project
===================

Getting and Cleaning Data Course project

Script works using following steps :-
1) It reads the .txt files for training and test data for X,Y and Subject and then merges them row wise using rbind.
2) It reads the features and activity text files.
3) It uses str_detect to identify features which are mean() or std().
4) It uses the identified features to subset the x dataset to only retain mean or std features
5) It then assigns feature names to column
6) It the adds subject columnwise to x
7) It adds activity names columnwise to x by transforming y using sapply to get names from activity name data frame
8) It then aggregates the mean of remaining columns after applying grouping of activity and subject
9) Finally it writes the result of above steps to file
