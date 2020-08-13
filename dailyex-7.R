#Ryan Erickson
#Assignment 7

####Assignment is on slide #174 of lecture slides

#Libraries
library(tidyverse)

#Data
url = 'https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv'
covid = read_csv(url)

#Assignment Scripts
##Makling the new data
region = data.frame(state = state.name, abb = state.abb, region = state.region)

##Joining the Data

covid_new = covid %>% 
  right_join(region, by = ('state')) %>% 
  group_by(region, date) %>% 
  summarise(cases = sum(cases), deaths = sum(deaths)) %>% 
  pivot_longer(cols = c('cases', 'deaths'))

##ggplot
ggplot(covid_new, aes(x = date, y = value)) + 
    geom_line(aes(col = region)) + 
    facet_wrap(name~region, scales = 'free') + 
    theme_light() 
###add more themes and titles
    
  