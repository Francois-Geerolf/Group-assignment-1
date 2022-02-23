library("tidyverse")
library("fredr")

# fred_key <- "####"

fredr_series_search_text(search_text = "federal funds",
                         order_by = "popularity",
                         sort_order = "desc",
                         limit = 1) %>%
  pull(id) %>%
  map_dfr(., fredr) %>%
  filter(date >= as.Date("1990-01-01")) %>%
  ggplot(.) + 
  geom_line(aes(x = date, y = value/100)) +
  labs(x = "Observation Date", y = "Rate") + theme_minimal() +
  theme(legend.title = element_blank(),
        legend.position = c(0.4, 0.8)) +
  scale_x_date(breaks = as.Date(paste0(seq(1990, 2020, 2), "-01-01")),
               labels = date_format("%y")) +
  scale_y_continuous(breaks = seq(-0.01, 0.12, 0.01),
                     labels = scales::percent_format(accuracy = 1)) + 
  xlab("") + ylab("10-Year Treasury Rate")
