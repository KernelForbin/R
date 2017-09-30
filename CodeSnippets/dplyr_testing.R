# testing
1+1
x <- 5
x

# loading library
library(dplyr)

# loading dataset
data(diamonds, package='ggplot2')

# info
nrow
dim

# display
nrow(diamonds)
ncol(diamonds)
dim(diamonds)
head(diamonds)
tail(diamonds)
head(diamonds, n=4)
head(tail(diamonds), n=2)

# piping
diamonds %>% tail
diamonds %>% tail %>% head(n=2)

# selecting
diamonds %>% select(carat, price)
select(diamonds, carat, price)
diamonds %>% select(1,7)
diamonds %>% select(-carat, -price)
diamonds %>% select(clarity:price)

# filtering rows
filter(diamonds, cut == 'Ideal')
diamonds %>% filter(cut == 'Ideal')
diamonds %>% filter(cut == 'Ideal' & color == 'E')
diamonds %>% filter(cut == 'Ideal' & carat >= 1)
diamonds %>% filter(cut == 'Ideal' | carat >= 1)

# dplyr: slicing
diamonds %>% slice(c(1, 5, 15))
diamonds %>% slice(7:12)

# dplyr: mutating, adding columns
diamonds %>% mutate(price/carat)
diamonds %>% mutate(Ratio=price/carat)
diamonds %>% mutate(Ratio=price/carat) %>% mutate(Total=Ratio*2)
diamonds %>% mutate(Ratio=price/carat, Total=Ratio*2)
diamonds %>% mutate(Ratio=price/carat) %>% select(1,2,7,11)
diamonds %>% mutate(Ratio=price/carat) %>% select(1,2,7,11,3)

# writing mutation to database
diamonds <- diamonds %>% mutate(Ratio=price/carat)
diamonds


# math
diamonds %>% summarize(mean(price))
mean(diamonds$price)
diamonds %>% summarize(AvgPrice=mean(price))
diamonds %>% summarize(AvgPrice=mean(price), TotalSize=sum(carat))

# math and grouping
diamonds %>% 
  group_by(cut) %>%
  summarize(AvgPrice=mean(price))

diamonds %>% 
  filter(carat >= .75) %>% 
  group_by(cut) %>% 
  summarize(AvgPrice=mean(price), TotalSize=sum(carat))

# assignment math and grouping to variable  
diamondsummary <- diamonds %>% 
  filter(carat >= .75) %>% 
  group_by(cut) %>% 
  summarize(AvgPrice=mean(price), TotalSize=sum(carat))
diamondsummary

# doing the above with nesting instead of piping
summarize(group_by(filter(diamonds, carat >= .75), cut),
  AvgPrice=mean(price), TotalSize=sum(carat))








