## run_analysis.R
* <b>Description</b>: This function takes no arguments and returns a tidy data set 
containing the mean values of all mean and standard deviation
data recorded for 30 individuals performing 6 activities in the 
Human Activity Recognition Using Smartphones Dataset (Version 1.0) 
published by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro 
Ghio, and Luca Oneto.

* <b>Requirements</b>: The Human Activity Recognition Using 
Smartphones Dataset should be located in the working directory 
when run_analysis is called. The test and train file structure 
of the original data set must be present for execution to be 
successful.

<i>Method</i><br>
Read variable names from features.txt<br>
Read measurement data from X_test.txt and X_train.txt<br>
Assign variable names to measurement data<br>
Read activity data from y_test.txt and y_train.txt<br>
Read subject data from subject_test.txt and subject_train.txt<br>
Join measurement data with subjects and activities<br>
Assign activity labels to corresponding activity identifiers<br>
Calculate mean value for each variable aggregated by subject and activity<br>