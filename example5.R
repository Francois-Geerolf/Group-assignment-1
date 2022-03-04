library("rdbnomics")
C <- rdb(ids = c("WB/WDI/NY.GDP.MKTP.PP.KD-ET",
                 "WB/WDI/NY.GDP.MKTP.PP.KD-ZG",
                 "WB/WDI/NY.GDP.MKTP.PP.KD-XM")) %>%
  select(series_name, period, value) %>%
  filter(period >= as.Date("1995-01-01")) %>%
  group_by(series_name) %>%
  mutate(value = 100 * value / value[period == as.Date("1995-01-01")])
  
  C <- C %>% 
  ggplot(.) + xlab("") + ylab("") + theme_minimal() + geom_line(aes(x = period, y = value, linetype = series_name)) + geom_line(aes(x = period, y = value, linetype = series_name))


C

round(12.25)
12.25 %>% round(.) %>% paste0(" months") %>% paste0(" and 2 days")


paste0(paste0(round(12.25), " months"), " and 2 days")
