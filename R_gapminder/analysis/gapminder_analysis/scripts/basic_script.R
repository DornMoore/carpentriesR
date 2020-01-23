# Load gapminder data
gapminder <- read.csv("../../data/gapminder_data.csv")
# Example gapminder
summary(gapminder$lifeExp)

# Plotting
ggplot(data = gapminder, 
       mapping=aes(x=gdpPercap, y=lifeExp, by=year,color=year )) + geom_point()

ggplot(data = gapminder, 
       mapping=aes(x=gdpPercap, y=lifeExp, by=year,color=continent )) + 
  geom_point(alpha = 0.5) + scale_x_log10() + geom_smooth(method = "lm")



americas <-filter(gapminder,continent == "Americas")

myplot <- ggplot(data = americas, 
       mapping=aes(x=year, y=lifeExp, color=continent)) + 
  geom_line() + facet_wrap(~country) + 
  labs(x="Year", y="Life Expectancy", title = "Figure 1")
ggsave(filename = "../../analysis/myplot.png",plot=myplot, width=12, height=10, dpi=300 )
