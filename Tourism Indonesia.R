# Load necessary libraries
library(dplyr)
library(tidyr)
library(readr)

# Load data
tourism_data <- read_csv('tourism_with_id.csv')
user_data <- read_csv('user.csv')
rating_data <- read_csv('tourism_rating.csv')
package_tourism <- read_csv('package_tourism.csv')

# Merge user data and ratings with tourist locations
rating_with_place <- rating_data %>%
  left_join(tourism_data, by = "Place_Id") %>%
  left_join(user_data, by = "User_Id")

# Clean and format the data
# For Tableau, ensure Lat, Long, Price, Ratings, and other key columns are in correct formats
rating_with_place$Price <- as.numeric(rating_with_place$Price)
rating_with_place$Place_Ratings <- as.numeric(rating_with_place$Place_Ratings)

# Save cleaned dataset for Tableau
write_csv(rating_with_place, "cleaned_tourism_data.csv")
