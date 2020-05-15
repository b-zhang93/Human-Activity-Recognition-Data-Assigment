# Code Book

The following explains all variables of the 'data_summary' table.

### Factors

- `subject` - The ID of the test subject
- `activity` - The type of activity performed when the corresponding measurements were taken


### Measurements

#### Description taken from the dataset features_info.txt to explain how to interpret the variables
>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

>These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


#### Above information simplified:

**Prefix**

`tBodyAcc-XYZ` - time, body acceleration, XY or Z axis

`tGravityAcc-XYZ` - time, gravity acceleration, XY or Z axis 

`tBodyAccJerk-XYZ` - time, jerk signals of body acceleration, XY or Z axis 

`tBodyGyro-XYZ` - time, body angular velosity, XY or Z axis 

`tBodyGyroJerk-XYZ` - time, jerk signals of body angular velocity, XY or Z axis

`tBodyAccMag` - time, body acceleration magnitude

`tGravityAccMag` - time, gravity acceleration magnitude

`tBodyAccJerkMag` - time, jerk, body acceleration magnitude

`tBodyGyroMag` - time, body angular velocity magnitude

`tBodyGyroJerkMag` - time, jerk signals of body angular velocity magnitude

`fBodyAcc-XYZ` - frequency, body acceleration, XY or Z axis

`fBodyAccJerk-XYZ` - frequency, jerk signals of body acceleration, XY or Z axis

`fBodyGyro-XYZ` - frequency, body angular velosity, XY or Z axis

`fBodyAccMag` - frequency, body acceleration magnitude

`fBodyAccJerkMag` - frequency, jerk, body acceleration magnitude

`fBodyGyroMag` - frequency, body angular velocity magnitude

`fBodyGyroJerkMag` - frequency, jerk signals of body angular velocity magnitude


**Suffix**

`mean()` - Mean value

`std()` - Standard deviation


**Label**

`(Avg)` - Average of the mean() or std() for each variable 


#### Example
`tBodyAcc-mean()-X (Avg)` - Average of time domain, body acceleration on X axis, mean for the identifying subject's activity
