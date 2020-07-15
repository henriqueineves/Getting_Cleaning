This codebook contain the information about all the variables present in the files 'Tidy_Dataset.txt' present within this repository. This dataet was created as the final project of the course "Getting and Cleaning Data" from the data science specialization on Coursera. Parts of the explanation were copied from the original 'README.txt' and 'features_info.txt' files from the original dataset.

Contents:
The mean reading from Triaxial acceleration from the accelerometer (total acceleration), the estimated body acceleration, the Triaxial Angular velocity from the gyroscope, measured for 30 different subjects in 6 different conditions of activity, the derivation of the body linear acceleration and angular velocity generated the Jerk signals and the magnetude of acceleration.

Variables:
'Subject' - A number to identify the subject that originated the reading. Numbers go from 1 to 30 uniquely identifying the subect.
'Activity' - Which activity the subjects were performing when the measurement was taken. Descriptive values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.
The following columns are the calculated mean for each variable indicated. The variables are coded as the following:
-Signal:   t- time domain signals captured at a constant rate of 50 Hz.
           f- Fast Fourier Transform (FFT) applied to these signals producing
-Measurement: Which was measured, described within the 'Contents' in this file.
          acc - measurement of acceleration;
          jerk - Derived signal
          mag - The magnetude of acceleration.
-mean(): Mean value
-std(): Standard deviation
-XYZ: denote 3-axial signals in the X, Y and Z directions.
