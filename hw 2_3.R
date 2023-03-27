# read the data
metabolites <- read.csv("C:\\Users\\wdiet\\OneDrive\\Desktop\\metabolite.csv", header = TRUE, sep = ",")

# how many Alzheimer's patients are in the dataset
sum(metabolites$Label == "Alzheimer")

# number of missing values for each column
missing_count <- colSums(is.na(metabolites_no_na))
print(missing_count)

#remove the rows that have missing values for the Dopamine column
metabolites_no_na <- metabolites[complete.cases(metabolites$Dopamine), ]

#replace the missing values in the c4-OH-Pro column with the median value of the same column
median_c4_OH_Pro <- median(metabolites_no_na$c4.OH.Pro, na.rm = TRUE)
metabolites_no_na$c4.OH.Pro <- ifelse(is.na(metabolites_no_na$c4.OH.Pro), median_c4_OH_Pro, metabolites_no_na$c4.OH.Pro)

# drop columns which have more than 25% missing values
metabolites_no_na_col <- metabolites_no_na[, colMeans(is.na(metabolites_no_na)) <= 0.25]
