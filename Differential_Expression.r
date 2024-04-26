#Load in the packages required for the analysis

library(DESeq2)
library (readr)
library (gplots)
library("RColorBrewer")

#Set the working directory to the folder where the counts are stored

setwd("C:/Users/rowbr/OneDrive/Documents/Counts")

#Check that you're actually in the right directory

getwd()

#Check that all the files we expect to be in the working directory are actually there

dir()

#Naming all of our samples manually
#Since we have samples from 2 data sets that are named differently, I have to rename them in a consistent format.
#Just a note for clarity: the count files with treatment label EV will be renamed with DC3000 as the treatment. This treatment was inoculation with P. syringae pv. tomato DC3000 carrying an empty vector (EV) rather than a plasmid with an effector protein like in the other treatments.
#Names follow the format: treatment_timepoint_replicate_dataset.

samples <- c("mock_12h_01_eti",
             "mock_12h_02_eti",
             "mock_12h_03_eti",
             "mock_24h_01_eti",
             "mock_24h_02_eti",
             "mock_24h_03_eti",
             "mock_6h_01_eti",
             "mock_6h_02_eti",
             "mock_6h_03_eti",
             "DC3000_12h_01_eti",
             "DC3000_12h_02_eti",
             "DC3000_12h_03_eti",
             "DC3000_24h_01_eti",
             "DC3000_24h_02_eti",
             "DC3000_24h_03_eti",
             "DC3000_6h_01_eti",
             "DC3000_6h_02_eti",
             "DC3000_6h_03_eti",
             "AvrRpt2_12h_01_eti",
             "AvrRpt2_12h_02_eti",
             "AvrRpt2_12h_03_eti",
             "AvrRpt2_24h_01_eti",
             "AvrRpt2_24h_02_eti",
             "AvrRpt2_24h_03_eti",
             "AvrRpt2_6h_01_eti",
             "AvrRpt2_6h_02_eti",
             "AvrRpt2_6h_03_eti",
             "AvrRpm1_12h_01_eti",
             "AvrRpm1_12h_02_eti",
             "AvrRpm1_12h_03_eti",
             "AvrRpm1_24h_01_eti",
             "AvrRpm1_24h_02_eti",
             "AvrRpm1_24h_03_eti",
             "AvrRpm1_6h_01_eti",
             "AvrRpm1_6h_02_eti",
             "AvrRpm1_6h_03_eti",
             "flg_12h_01_pti",
             "flg_12h_02_pti",
             "flg_12h_03_pti",
             "flg_24h_01_pti",
             "flg_24h_02_pti",
             "flg_24h_03_pti",
             "flg_6h_01_pti",
             "flg_6h_02_pti",
             "flg_6h_03_pti",
             "mock_12h_01_pti",
             "mock_12h_02_pti",
             "mock_12h_03_pti",
             "mock_24h_01_pti",
             "mock_24h_02_pti",
             "mock_24h_03_pti",
             "mock_6h_01_pti",
             "mock_6h_02_pti",
             "mock_6h_03_pti",
             "unt_0h_01_pti",
             "unt_0h_02_pti",
             "unt_0h_03_pti")

#Reading in our files

files <-file.path(list.files("C:/Users/rowbr/OneDrive/Documents/Counts"))

#printing out the file list to makes sure all the files are there

files

#Assigning our sample names to the count files 

names(files)<- samples

#Printing out files again to make sure they all have the approriate names now

files

#Setting up our experimental variables:

treatment

timepoint

dataset 
