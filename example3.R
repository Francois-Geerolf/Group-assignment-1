rm(list = ls())
library("tidyverse")
library("fredr")
fredr_set_key("XXX")

GDP <- fredr(series_id = "GDP")
PCE <- fredr(series_id = "PCE")
GPDI <- fredr(series_id = "GPDI")

GDP %>%
  bind_rows(PCE) %>%
  bind_rows(GPDI) %>%
  filter(date >= as.Date("2019-01-01")) %>%
  # select(1:3) %>%
  group_by(series_id) %>%
  mutate(value_100 = 100*value/value[1]) %>%
  ggplot + geom_line(aes(x = date, y = value_100, color = series_id))
