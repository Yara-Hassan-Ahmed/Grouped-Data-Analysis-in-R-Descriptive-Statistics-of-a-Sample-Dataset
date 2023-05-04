# Grouped-Data-Analysis-in-R-Descriptive-Statistics-of-a-Sample-Dataset
This R language project computes descriptive statistics for a given dataset. The dataset is a vector of numeric values. The code computes various statistical measures such as mean, median, mode, variance, standard deviation, coefficient of variation, and skewness for the dataset.

# How to use:

  Install R and an IDE such as RStudio on your system.
  Load the dataset into the R environment. You can do this by copying the data into the R console or by importing a CSV file that contains the data.
  Copy the code into your R script editor.
  Run the code to compute the various statistical measures for the dataset.
  The output will be displayed in the console.

# Code explanation:

  The code starts by defining the dataset as a vector of numeric values.
  The maximum and minimum values of the dataset are computed.
  The code then computes the number of rows for the frequency table by dividing the range of the dataset by 5.
  The frequency table is created using a loop that iterates over the class intervals and computes the frequency of each class interval.
  The mean is computed by multiplying the midpoints of each class interval by its frequency, summing the products, and dividing by the total frequency.
  The median is computed by finding the class interval that contains the median value and interpolating to find the exact median value.
  The mode is computed by finding the class interval with the highest frequency and interpolating to find the mode.
  The variance is computed by summing the products of each mid-point squared with its frequency, subtracting the square of the mean multiplied by the total frequency, and dividing by the total frequency minus 1.
  The standard deviation is computed by taking the square root of the variance.
  The coefficient of variation is computed by dividing the standard deviation by the mean and multiplying by 100.
  The skewness is computed using the formula (3*(mean-median))/standard deviation.

# Note: 
  The code assumes that the dataset is a vector of numeric values and that the class intervals are of width 5. If the dataset is not of this form, the code may need to be modified accordingly.
