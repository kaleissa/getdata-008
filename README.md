getdata-008 
=========== 
 
 
Getting and Cleaning Data - Course Project readme file describes process and relevant considerations. 
 
 
 
 
The Steps outlined below are also included in the codebook.md document located in this repository. I have also included them here, in the readme.md for purposes of conveniences. however the complete list of columns contained in the tidy data are in the codebook.md only. Additionally run_analysis contains in remarks through out  in an attempt to clarify steps.  
 
 
Relating to the R code contained in my run_analysis, I have divided the project into Steps. each step is marked in the  r code itself making it easier to understand the purpose of any particular function or line of code. After the steps is some additional observations to be shared. 
step 1  getting the data and unzipping it.  
step 2  deals with Activity labels, merges it. 
step 3  deals with the subjects data, merges it.  
step 4  deals with the bulk of the data, the measurements, merges it. 
step 5  deals joining all of the previously process data into a single data table 
step 6  deals with the getting the final dataset, a summary of the original data  
        containing  code that calculates the mean of each of the included measurements 
        and summarizes the data with each row containing data on a single subject performing  
        a specific activity and provides the mean of the measured variables only.  
        thereby reducing the data set down to 180 observations (one for each subject per activity)  
        and 79 columns containing calculated means of the variables. 
Step 7 finally output the data table write table with row names false. 
Point of interest- 
After I had already mostly finished working on this project, it occurred to me to look into what I was creating a Tidy Dataset to do. What is the purpose/use of the dataset I am creating. Apparently, Human Activity data that we are working with is associated with predictive analysis and the application of machine learning algorithms, such as "RandomForest" to make predictions.  
 
 
The original data was made available at "URL" in the form of a single compressed data. So the very first 
task 1 - was to download and unzip the original data. This task is only performed if the data is absent from the working directory at the time that the "run_analysis" r code is executed. 
 
 
further more, the decompressed dataset contains 6 .csv files of interest. Also, the six files are to be combined/merged together to form a single dataset that is then subseted according to include only the columns that are measurements of the mean or the standard deviation. The subsetting to achieve this was accomplished by using grepl() to Identify columns with "mean" or "std" int the column names.  
 
 
In the course of working to create the "tidy dataset" I relied heavily on the Discussion form thread such as , the course lectures from week three and I am compelled in the interest of full disclosure to also say that I did come into contact with previous solutions to this specific project that did point me in the direction. I have created a short list of some the resources I used to advance the project structure and function below. 
 
 
1 https://class.coursera.org/getdata-008/forum/thread?thread_id=239 ## this discussion thread confirmed that the final tidy dataset could contain 68 or 81 columns depending on how individual participants interpreted the project instructions. I decided to leave 81 columns in my data. 
 
 
2.https://class.coursera.org/getdata-008/forum/thread?thread_id=24 is a very long thread that contributes many ideas and solutions to course project. 
  
3. https://github.com/pidanzhou.<- github repository containing solutions previously applied to this dataset. (this may be a controversial resource) so in my defense I present to you the grader that all of the work and the documents contained in my course project repository is truly my own and has not been compromised by this use of this resource. I welcome any feedback regarding this matter and hope that I have been sufficently forthright and in compliance with expectations.

 3. http://en.wikipedia.org/wiki/Activity_recognition - general information regarding activity recognition provided a context for understanding the nature of the dataset and what it may be used for in future analysis.
 