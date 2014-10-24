Purpose of this document is to describes the variables and give insight into what steps were taken to produce the tidy dataset. 
 
 
 
 
The variables contained in the tidyData table that is produced by executing run_analyisis are: 
 
 
 [1] "Subject"                         "Activity"                        "tBodyAcc.mean...X"               
 [4] "tBodyAcc.mean...Y"               "tBodyAcc.mean...Z"               "tBodyAcc.std...X"                
 [7] "tBodyAcc.std...Y"                "tBodyAcc.std...Z"                "tGravityAcc.mean...X"            
[10] "tGravityAcc.mean...Y"            "tGravityAcc.mean...Z"            "tGravityAcc.std...X"             
[13] "tGravityAcc.std...Y"             "tGravityAcc.std...Z"             "tBodyAccJerk.mean...X"           
[16] "tBodyAccJerk.mean...Y"           "tBodyAccJerk.mean...Z"           "tBodyAccJerk.std...X"            
[19] "tBodyAccJerk.std...Y"            "tBodyAccJerk.std...Z"            "tBodyGyro.mean...X"              
[22] "tBodyGyro.mean...Y"              "tBodyGyro.mean...Z"              "tBodyGyro.std...X"               
[25] "tBodyGyro.std...Y"               "tBodyGyro.std...Z"               "tBodyGyroJerk.mean...X"          
[28] "tBodyGyroJerk.mean...Y"          "tBodyGyroJerk.mean...Z"          "tBodyGyroJerk.std...X"           
[31] "tBodyGyroJerk.std...Y"           "tBodyGyroJerk.std...Z"           "tBodyAccMag.mean.."              
[34] "tBodyAccMag.std.."               "tGravityAccMag.mean.."           "tGravityAccMag.std.."            
[37] "tBodyAccJerkMag.mean.."          "tBodyAccJerkMag.std.."           "tBodyGyroMag.mean.."             
[40] "tBodyGyroMag.std.."              "tBodyGyroJerkMag.mean.."         "tBodyGyroJerkMag.std.."          
[43] "fBodyAcc.mean...X"               "fBodyAcc.mean...Y"               "fBodyAcc.mean...Z"               
[46] "fBodyAcc.std...X"                "fBodyAcc.std...Y"                "fBodyAcc.std...Z"                
[49] "fBodyAcc.meanFreq...X"           "fBodyAcc.meanFreq...Y"           "fBodyAcc.meanFreq...Z"           
[52] "fBodyAccJerk.mean...X"           "fBodyAccJerk.mean...Y"           "fBodyAccJerk.mean...Z"           
[55] "fBodyAccJerk.std...X"            "fBodyAccJerk.std...Y"            "fBodyAccJerk.std...Z"            
[58] "fBodyAccJerk.meanFreq...X"       "fBodyAccJerk.meanFreq...Y"       "fBodyAccJerk.meanFreq...Z"       
[61] "fBodyGyro.mean...X"              "fBodyGyro.mean...Y"              "fBodyGyro.mean...Z"              
[64] "fBodyGyro.std...X"               "fBodyGyro.std...Y"               "fBodyGyro.std...Z"               
[67] "fBodyGyro.meanFreq...X"          "fBodyGyro.meanFreq...Y"          "fBodyGyro.meanFreq...Z"          
[70] "fBodyAccMag.mean.."              "fBodyAccMag.std.."               "fBodyAccMag.meanFreq.."          
[73] "fBodyBodyAccJerkMag.mean.."      "fBodyBodyAccJerkMag.std.."       "fBodyBodyAccJerkMag.meanFreq.."  
[76] "fBodyBodyGyroMag.mean.."         "fBodyBodyGyroMag.std.."          "fBodyBodyGyroMag.meanFreq.."     
[79] "fBodyBodyGyroJerkMag.mean.."     "fBodyBodyGyroJerkMag.std.."      "fBodyBodyGyroJerkMag.meanFreq.." 
 
 
 
 
The first two variable in columns 1 and 2 are the Subject(persons) number, and the activity taking place at the time of data gathering( walking, etc, etc.). The remaining 79 are calculated coloums that contain calculations of the mean of the  all measurements of mean of standard deviation that were contained in the original data set.  
 
 
I is important to understand that the "Tidy Dataset" created in step contains 1 subject performing 6 activities , and 24 subjects total and that is why it has 180 observations(rows).30(subjects)x6(activities)=180(unique rows). each row is unique. Also calculations were performed on the original values presented in the original data according to project instructions we were to deliver in the final data the means of the measured variables. So what my tidy dataset contains is the means of the means an std columns in the original data.  
 
 
Additionally, I considered using the all 561 features to produce the dataset described in step 5, but after considering discussions in the discussion forums came to the conclusion that the most likely intention of the assignment was to only use the data containing a summary calculating the mean of the measurements of mean or standard deviation in original data. 
 
 
Relating to the R code contained in my run_analysis, I have divided the project into Steps. Each step is remarked and explained in the r code itself so that it may make it easier to understand the purpose of any particular function or line of code.   
step 1  getting the data and unzipping it.  
step 2  deals with Activity labels, merges it. 
step 3  deals with the subjects data, merges it.  
step 4  deals with the bulk of the data, the measurements, merges it. 
step 5  deals joining all of the previously process data into a single data table 
step 6  deals with the getting the final dataset, a summary of the original data  
        contains  code that calculates the mean of each of the included measurements 
        and summarizes the data with each row containing data on a single subject performing  
        a specific activity and provides the mean of the measured variables only.  
        thereby reducing the data set down to 180 observations (one for each subject per activity)  
        and 79 columns containing calculated means of the variables. 
Step 7 finally output the data table write table with row names false. 
 
 
Also, the R code contains remarks and readme.md is available for additional information. 
 