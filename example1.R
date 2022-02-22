library("rdbnomics")
library("tidyverse")

rdb(ids = c("BEA/NIPA-T10105/A191RC-A", 
            "BEA/NIPA-T10105/DPCERC-A")) %>%
  glimpse()


rdb(ids = c("BEA/NIPA-T10105/A191RC-A", 
            "BEA/NIPA-T10105/DPCERC-A")) %>%
  mutate(value = value / 1000000,
         series_name = series_name %>% gsub(" - Annually", "", .)) %>%
  select(date = period, value, series_name) %>%
  ggplot(.) + xlab("") + ylab("Trillion") + theme_minimal() +
  geom_line(aes(x = date, y = value, linetype = series_name)) +
  scale_y_continuous(breaks = seq(0, 20, 2.5),
                     labels = scales::dollar_format(accuracy = 0.1))
