library(tidyquant)
library(ggplot2)
library(dplyr)

USD_HUF <- tq_get("USDHUF=X", get = "stock.prices", from = "2000-01-01", to = "2024-01-01")
USD_HUF <- USD_HUF %>% select(date, adjusted)
USD_HUF <- USD_HUF %>% rename(USD_HUF = adjusted)
plot(USD_HUF$date, USD_HUF$USD_HUF, type = "l", xlab = "Date", ylab = "USD_HUF", main = "USD_HUF exchange rate")

EUR_HUF <- tq_get("EURHUF=X", get = "stock.prices", from = "2000-01-01", to = "2024-01-01")
EUR_HUF <- EUR_HUF %>% select(date, adjusted)
EUR_HUF <- EUR_HUF %>% rename(EUR_HUF = adjusted)
plot(EUR_HUF$date, EUR_HUF$EUR_HUF, type = "l", xlab = "Date", ylab = "EUR_HUF", main = "EUR_HUF exchange rate")

USD_EUR <- tq_get("USDEUR=X", get = "stock.prices", from = "2000-01-01", to = "2024-01-01")
USD_EUR <- USD_EUR %>% select(date, adjusted)
USD_EUR <- USD_EUR %>% rename(USD_EUR = adjusted)
plot(USD_EUR$date, USD_EUR$USD_EUR, type = "l", xlab = "Date", ylab = "USD_EUR", main = "USD_EUR exchange rate")
