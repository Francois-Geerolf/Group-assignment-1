
library("rdbnomics")
# Here you forgot the WB/WDI/ for the two last series
rdb(ids = c("WB/WDI/NY.GDP.MKTP.PP.KD-ET",
            "WB/WDI/NY.GDP.MKTP.PP.KD-ZG",
            "WB/WDI/NY.GDP.MKTP.PP.KD-XM")) %>%
  # select only the colums that you'll use: the series_name, date, value
  select(series_name, period, value) %>%
  # Keep only observations after 1995: use filter
  filter(period >= as.Date("1995-01-01")) %>%
  # Here you put eveything in base 100 for 1995
  group_by(series_name) %>%
  mutate(value = 100*value/value[period == as.Date("1995-01-01")]) %>%
  # Here you plot
  ggplot(.) + xlab("") + ylab("") + theme_minimal() +
  # here you had one mistake: the date is "period" here
  geom_line(aes(x = period, y =value, linetype = series_name)) +
  # This is to put the legend inside the graph
  scale_x_date(breaks = "5 years",
               labels = date_format("%Y")) +
  scale_y_log10(breaks = seq(100, 700, 100)) +
  theme(legend.position = c(0.4, 0.9),
        legend.title = element_blank())
  
  