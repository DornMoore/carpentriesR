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


#filter out a dataframe with just records from teh americas
americas <-filter(gapminder,continent == "Americas")

#Create a plot with custom labels
myplot <- ggplot(data = americas, 
       mapping=aes(x=year, y=lifeExp, color=continent)) + 
  geom_line() + facet_wrap(~country) + 
  labs(x="Year", y="Life Expectancy", title = "Figure 1")

#save our plot as a pdf
ggsave(filename = "../../analysis/myplot.pdf",plot=myplot, width=12, height=10, dpi=300 )

# Add a new column with population in millions
gapminder$pop_millions <- gapminder$pop/1000000

#############
#Functions

#Temp converter
far2kelvin <- function(temp){
  kelvin <- ((temp - 32) * 5/9) + 273.15
  return(kelvin)
}
far2kelvin(32)

k2c <- function(k){
  celcius <- k-273.15
  return(celcius)
}


# FILTER/SUBSET #
europeSelect <- gapminder %>% 
  filter(continent == "Europe") %>%  #Filter 
  select(year, country, gdpPercap) # Select


gapminder_after_1990 <- gapminder %>%
  filter(year>1990)

#Write the CSV of the output
write.csv(gapminder_after_1990, file="../../analysis/gapminder_after_1990.csv", row.names=FALSE)
