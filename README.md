---
title: "Course Project: Human Activity Recognition Using Smartphones Dataset"
author: "Michael Marcotrigiano"
date: "Friday, July 25, 2014"
output: html_document
---

The following steps describe how the row-data were transformed in tidy-data. 

The initial datasets (train and test sets) have were merged after several additions. It's been added the column that identifies the Subjects; subsequently equally it's been added the column of the activity who have performed the the Subjects. Finally the whole dataset is merged after the naming of feautures. With the aim of extract only the measurements on the mean and standard deviation for each measurement, it were calculated the column indexes thanks to which retrieve the correct feautures required.  

The activity identifiers were translated with their label names.  

Was finally created the "Tidy DataSet", calculating the mean for each Subject and Activity using the 
"aggregation" function.

The output of the run_analysis.R file is the data set named "TinyDataSet.txt".  

The file can be easly loaded with the instraction "read.table(file = "TynyDataSet.txt", header=TRUE)" 

A detailed description of the variables can be found in CodeBook.md.