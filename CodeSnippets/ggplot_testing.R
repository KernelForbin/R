# loading libraries
library(ggplot2)
library(ggthemes)

# loading dataset
data(diamonds, package='ggplot2')

# charting
ggplot(diamonds)
ggplot(diamonds, aes(x=carat, y=price))
ggplot(diamonds, aes(x=carat, y=price)) + geom_point()

# adding color to dots
ggplot(diamonds, aes(x=carat, y=price, color=cut)) + 
  geom_point()

# splitting in to trellis charts with facet_wrap
ggplot(diamonds, aes(x=carat, y=price, color=cut)) + 
  geom_point() + 
  facet_wrap( ~ cut)

# using rings instead of dots, changing size
ggplot(diamonds, aes(x=carat, y=price, color=cut)) + 
  geom_point(shape=1, size=1) + 
  facet_wrap( ~ cut)

# adding transparency
ggplot(diamonds, aes(x=carat, y=price, color=cut)) + 
  geom_point(shape=1, size=1, alpha=1/3) + 
  facet_wrap( ~ cut)

# assigning ggplot to variable
g <- ggplot(diamonds, aes(x=carat, y=price, color=cut)) +
  geom_point()
g + face_wrap( ~ cut)

# using ggthemes to apply themes to stored variable
g + theme_economist() + scale_color_economist()
g + theme_wsj() + scale_color_wsj()
g + theme_fivethirtyeight() + scale_color_fivethirtyeight()
g + theme_excel() 

# other types of plots
ggplot(diamonds, aes(x=price)) + geom_histogram()
ggplot(diamonds, aes(x=price)) + geom_density()
ggplot(diamonds, aes(x=cut, y=price)) + geom_boxplot()
ggplot(diamonds, aes(x=cut, y=price)) + geom_violin()

# adding color to other types of plots
ggplot(diamonds, aes(x=price, color=)) +
  geom_density(fill='red', color='blue')

# adding color to fill based on data
ggplot(diamonds, aes(x=price, color=)) +
  geom_density(aes(fill=cut, color='grey50'))

# adding opacity, not based on data
ggplot(diamonds, aes(x=price, color=)) +
  geom_density(aes(fill=cut, color='grey50'), alpha=1/3)

# Advanced Visualization
ggplot(diamonds, aes(x=cut, y=price)) +
  geom_jitter(alpha=1/3, size=1, shape=1, width=.35, aes(color=carat)) +
  geom_violin(draw_quantiles = c(.25, .50, .75), 
              alpha=1/2, aes(fill=carat)) +
  scale_color_gradient(low='#56B1F7', high='#C91010') +
  scale_fill_gradient(low='#56B1F7', high='#C91010')
