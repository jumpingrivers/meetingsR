library(tibble)
library(dplyr)
library(ggplot2)
library(hrbrthemes)

dd = tribble(
  ~conf,~cost,~days,
  "rstudio::conf 2018", 695, 4,
  "New York R", 725, 2,
  "useR! 2017",770, 4,
  "Earl London",1191, 3,
  "R Finance 2017", 600,2,
  "SatRday 2017", 82, 3,
  "eRum 2016", 30, 3)
dd$per = dd$cost/dd$days
dd = dd %>% arrange(per) %>%
  mutate(conf = factor(conf, levels = conf))

ggplot(dd) + geom_col(aes(conf, per)) +
  theme_ipsum_rc(grid="X") +
  coord_flip() +
  labs(x="Conference", y="Cost per day ($)",
       title="Conference cost per day incl tutorials",
       subtitle="Industry ticket for the full conference",
       caption="jumpingrivers.com")
