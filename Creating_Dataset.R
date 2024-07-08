library(tidyquant)
library(ggplot2)
library(dplyr)

AAPL <- tq_get("AAPL", from = "2010-01-01", to = "2019-12-31")
AAPL <- AAPL %>%
  select(date, adjusted) %>%
  rename(price = adjusted)

plot(AAPL$date, AAPL$price, type = "l", col = "blue", xlab = "Date", ylab = "Price", main = "AAPL Stock Price")