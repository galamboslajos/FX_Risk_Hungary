####### Clearing data set and some essential plots for the analysis #######
###### Loading Packages ######
library(tidyquant)
library(ggplot2)
library(dplyr)

###### Loading Exchange Rate Data ######
# USD/HUF Nominal 
USD_HUF <- tq_get("USDHUF=X", get = "stock.prices", from = "2000-01-01", to = "2024-01-01")
USD_HUF <- USD_HUF %>% select(date, adjusted)
USD_HUF <- USD_HUF %>% rename(USD_HUF = adjusted)

### USD/HUF Nominal Plotting (longer) ###
ggplot(USD_HUF, aes(x = date, y = USD_HUF)) +
  geom_line(color = "blue") +
  geom_vline(aes(xintercept = as.numeric(as.Date("2022-02-24"))), color = "red", linetype = "dashed") +
  labs(x = "Date", y = "USD/HUF", title = "Long term USD/HUF exchange rate") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),  # Center the plot title
        text = element_text(size = 14),  # Increase the base font size
        panel.border = element_rect(colour = "black", fill=NA, size=1),  # Add a box around the plot
        axis.text.x = element_text(angle = 45, hjust = 1)) +  # Tilt the x-axis text
  scale_x_date(expand = c(0, 0),  # Remove gaps on the x-axis
               date_breaks = "1 year",  # Add date marks every year
               date_labels = "%Y")

### USD/HUF Nominal Plotting (recent) ###
ggplot(USD_HUF, aes(x = date, y = USD_HUF)) +
  geom_line(color = "blue") +
  geom_vline(aes(xintercept = as.numeric(as.Date("2022-02-24"))), color = "red", linetype = "dashed") +
  labs(x = "Date", y = "USD/HUF", title = "Recent USD/HUF Exchange rate") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),  # Center the plot title
        text = element_text(size = 14),  # Increase the base font size
        panel.border = element_rect(colour = "black", fill=NA, size=1),  # Add a box around the plot
        axis.text.x = element_text(angle = 45, hjust = 1)) +  # Tilt the x-axis text
  scale_x_date(expand = c(0, 0),  # Remove gaps on the x-axis
               limits = c(as.Date("2019-01-01"), NA),  # Start the x-axis from the first day of 2019
               date_breaks = "1 year",  # Add date marks every year
               date_labels = "%Y") +  # Format the date marks as years
  scale_y_continuous(expand = c(0, 0),  # Remove gaps on the y-axis
                     limits = c(250, NA))  # Start the y-axis from 250

### USD/HUF Returns Plotting ###
USD_HUF <- USD_HUF %>% mutate(Return = (USD_HUF/lag(USD_HUF) - 1) * 100)

ggplot(USD_HUF, aes(x = date, y = Return)) +
  geom_line(color = "blue") +
  geom_vline(aes(xintercept = as.numeric(as.Date("2022-02-24"))), color = "red", linetype = "dashed", alpha = 0.5) +
  labs(x = "Date", y = "Return (%)", title = "USD/HUF Return series") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),  # Center the plot title
        text = element_text(size = 14),  # Increase the base font size
        panel.border = element_rect(colour = "black", fill=NA, size=1),  # Add a box around the plot
        axis.text.x = element_text(angle = 45, hjust = 1)) +  # Tilt the x-axis text
  scale_x_date(expand = c(0, 0),  # Remove gaps on the x-axis
               date_breaks = "1 year",  # Add date marks every year
               date_labels = "%Y")  # Format the date marks as years

###### Other Exchange Rates ######
EUR_HUF <- tq_get("EURHUF=X", get = "stock.prices", from = "2000-01-01", to = "2024-01-01")
EUR_HUF <- EUR_HUF %>% select(date, adjusted)
EUR_HUF <- EUR_HUF %>% rename(EUR_HUF = adjusted)
plot(EUR_HUF$date, EUR_HUF$EUR_HUF, type = "l", xlab = "Date", ylab = "EUR_HUF", main = "EUR_HUF exchange rate")

USD_EUR <- tq_get("USDEUR=X", get = "stock.prices", from = "2000-01-01", to = "2024-01-01")
USD_EUR <- USD_EUR %>% select(date, adjusted)
USD_EUR <- USD_EUR %>% rename(USD_EUR = adjusted)
plot(USD_EUR$date, USD_EUR$USD_EUR, type = "l", xlab = "Date", ylab = "USD_EUR", main = "USD_EUR exchange rate")
