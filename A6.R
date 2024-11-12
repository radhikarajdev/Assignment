#Q1
library(dplyr)
set.seed(123)
# Define countries and continents
countries <- c("Country A", "Country B", "Country C", "Country D", "Country E", 
               "Country F", "Country G", "Country H", "Country I", "Country J",
               "Country K", "Country L", "Country M", "Country N", "Country O",
               "Country P", "Country Q", "Country R", "Country S", "Country T")
continents <- c("North America", "Europe", "Asia", "Africa", "Oceania")
# Create the dataset with 20 different years (2000 to 2019)
data <- expand.grid(Country = countries, Year = 2000:2019) %>%
  mutate(
    Continent = sample(continents, size = nrow(.), replace = TRUE),  # Randomly assign continents
    LifeExp = round(runif(nrow(.), 60, 85), 1),                      # Random life expectancy between 60 and 85
    Pop = round(runif(nrow(.), 1000000, 50000000)),                  # Random population between 1M and 50M
    gdpPerc = round(runif(nrow(.), 1000, 50000), 2)                  # Random GDP per capita between 1K and 50K
  )
print(data)

nrow(data)

#(1)
unique_countries <- data %>%
  group_by(Continent) %>%
  summarize(Unique_Countries = n_distinct(Country))
print(unique_countries)

#(2)
lowest_gdp_europe <- data %>%
  filter(Continent == "Europe") %>% 
  slice_min(gdpPerc, n = 1)
#or
#
#lowest_gdp_europe <- data %>%
#filter(Continent == "Europe") %>%
#  arrange(gdpPerc) %>%
#  head(1)
#
#Without dplyr
#europe_data <- data[data$Continent == "Europe", ]
#lowest_gdp_europe <- europe_data[which.min(europe_data$gdpPerc), ]
print(lowest_gdp_europe)


#(3)



#(4)
highest_gdp <- data %>%
    arrange(desc(gdpPerc)) %>%
    head(5)
#or
#highest_gdp <- data %>%
#  top_n(5,gdpPerc)
print(highest_gdp)



#(5)
countries_life_exp_80 <- data %>%
  filter(LifeExp >= 80) %>%
  select(Country, Year, LifeExp)
print(countries_life_exp_80)



#(6)
library(purrr)
correlation_data <- data %>%
  group_by(Country) %>%
  summarize(correlation = cor(LifeExp, gdpPerc, use = "complete.obs")) %>%
  arrange(desc(abs(correlation))) %>%
  slice_head(n = 10)
print(correlation_data)



#(7)
average_population <- data %>%
  filter(Continent != "Asia") %>%
  group_by(Continent, Year) %>%
  summarize(Avg_Pop = mean(Pop, na.rm = TRUE)) %>%
  arrange(desc(Avg_Pop))
print(average_population)



#(8)
consistent_population <- data %>%
  group_by(Country) %>% 
  summarize(std_dev_pop = sd(Pop, na.rm = TRUE),n = n()) %>%
  filter(n > 1) %>% 
  arrange(std_dev_pop) %>%
  head(3)
print(consistent_population)



#(9)
given_year <- 2010
population_decrease_life_expectancy_increase <- data %>%
  filter(Year != given_year) %>%
  arrange(Country, Year) %>%
  group_by(Country) %>%
  mutate(
    Prev_Pop = lag(Pop),
    Prev_LifeExp = lag(LifeExp)
  ) %>%
  filter(Pop < Prev_Pop, LifeExp > Prev_LifeExp) %>%
  select(Country, Year, Pop, LifeExp, Prev_Pop, Prev_LifeExp)
print(population_decrease_life_expectancy_increase)






#Q2
#(1)
# Create the dataset
medicine_data <- data.frame(
  MedID = 1:10,
  Med_Name = c("Paracetamol", "Aspirin", "Amoxicillin", "Ibuprofen", "Cetirizine", 
               "Metformin", "Lisinopril", "Omeprazole", "Atorvastatin", "Simvastatin"),
  Company = c("PharmaA", "PharmaB", "PharmaA", "PharmaC", "PharmaB", 
              "PharmaD", "PharmaA", "PharmaE", "PharmaD", "PharmaF"),
  Manf_year = c(2020, 2019, 2018, 2020, 2021, 
                2019, 2021, 2020, 2018, 2022),
  Exp_date = c(2023, 2022, 2024, 2023, 2025, 
               2023, 2026, 2025, 2024, 2026),
  Quantity_in_stock = c(50, 60, 40, 80, 30, 
                        90, 55, 70, 35, 45),
  Sales = c(1500, 1200, 1300, 1800, 1100, 
            1700, 1600, 1400, 1000, 2000)
)
# Write the dataset to a CSV file
write.csv(medicine_data, "DataSet.csv", row.names = FALSE)

#(2)
# Read the CSV file
med_data <- read.csv("DataSet.csv")
# Show the first 4 records
head(med_data, 4)

#(3)
# Show the last 4 records
tail(med_data, 4)

#(4)
# Find correlation between Quantity_in_stock and Exp_date
correlation <- cor(med_data$Quantity_in_stock, med_data$Exp_date)
print(paste("Correlation between Quantity_in_stock and Exp_date:", correlation))

#(5)
# Summarize the sales by year of manufacturing
sales_by_year <- aggregate(Sales ~ Manf_year, data = med_data, sum)
# Create a bar plot
barplot(sales_by_year$Sales, names.arg = sales_by_year$Manf_year, 
        main = "Sales by Year of Manufacturing", 
        xlab = "Year of Manufacturing", 
        ylab = "Sales", 
        col = "lightblue")
#OR
# Load necessary library for plotting
library(ggplot2)
# Bar plot for Sales with year of manufacturing
ggplot(med_data, aes(x = factor(Manf_year), y = Sales)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(title = "Sales vs Manufacturing Year", x = "Manufacturing Year", y = "Sales")

#(6)
companies <- table(med_data$Company)
multi_type_companies <- names(companies[companies > 1])
multi_type_companies


#(7)
# Find unique types of medicine available
unique(med_data$Med_Name)

#(8)
# Find medicines that are expiring (Exp_date <= 2023)
expiring_meds <- med_data[med_data$Exp_date <= 2023, ]
boxplot(Exp_date ~ Med_Name, data = expiring_meds, 
        main = "Box Plot of Expiring Medicines", 
        xlab = "Medicine Name", 
        ylab = "Expiration Year", 
        col = "lightblue", 
        border = "blue")
#OR
# Boxplot for expiring medicines
ggplot(expiring_meds, aes(x = factor(Med_Name), y = Exp_date)) +
  geom_boxplot(fill = "lightgreen") +
  labs(title = "Expiring Medicines", x = "Medicine", y = "Expiration Year")

#(9)
# Calculate the average stock in the store
avg_stock <- mean(med_data$Quantity_in_stock)
print(paste("Average stock in store:", avg_stock))


#(10)
# Regression line between Manufacturing Year and Sales
ggplot(med_data, aes(x = Manf_year, y = Sales)) +
  geom_point() +
  geom_smooth(method = "lm", col = "red") +
  labs(title = "Regression Line: Manufacturing Year vs Sales", x = "Manufacturing Year", y = "Sales")
#OR
plot(med_data$Manf_year, med_data$Sales, 
     main = "Regression Line between Manufacturing Year and Sales", 
     xlab = "Manufacturing Year", 
     ylab = "Sales", 
     pch = 19, col = "blue")

# Fit a linear model
model <- lm(Sales ~ Manf_year, data = med_data)

# Add the regression line
abline(model, col = "red")
