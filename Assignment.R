# Installing and Initializing Packages:
install.packages("tidyverse")
library(tidyverse)
library(GGally)
renv::snapshot() # ave the state of your library.

# Loading and Exploring Data:
data(iris)
head(iris)
summary(iris)
str(iris)


# Data Manipulation:
df <- tbl_df(iris) 
df
filter(df, Species == "versicolor")
filter(df, Petal.Length > 2)
filter(df, Petal.Length > 6 & Sepal.Length > 7)
arrange(df, Sepal.Length, Petal.Width)
arrange(df, desc(Sepal.Length))
select(df, Species, Petal.Width, Petal.Length)
mutate(df, log.Sepal.length = log(Sepal.Length))
summarise(df, mean(Petal.Length))
group_by(df, Species) %>% count(n())
df %>% 
  group_by(Species) %>%
  summarise(mean(Petal.Length))
#1 Scatter PLot
ggplot(data=df, aes(x = Sepal.Length, y = Sepal.Width))+
  geom_point(aes(color=Species, shape=Species)) +
  xlab("Sepal Length") +
  ylab("Sepal Width") +
  ggtitle("Sepal Length-Width")


# 2) Box Plot

box <- ggplot(data=df, aes(x=Species, y=Sepal.Length))

box + 
  geom_boxplot(aes(fill=Species)) +
  ylab("Sepal Length") +
  ggtitle("Iris Boxplot") +
  stat_summary(fun.y=mean, geom="point", shape=5, size=4)


# 3) Histogram
histogram <- ggplot(data=df, aes(x=Sepal.Width))

histogram +
  geom_histogram(binwidth=0.2, color="black", aes(fill=Species)) +
  xlab("Sepal Width") + 
  ylab("Frequency") + 
  ggtitle("Histogram of Sepal Width")

# 4) bar plot
bar <- ggplot(data=df, aes(x=Species))

bar +
  geom_bar(aes(fill=Species)) + xlab("Species") + 
  ylab("Count") +
  ggtitle("Bar plot of Sepal Length") 



# 5) Faceting
facet <- ggplot(data=df, aes(Sepal.Length, y=Sepal.Width, color=Species)) +
  geom_point(aes(shape=Species), size=1.5) +
  xlab("Sepal Length") +
  ylab("Sepal Width") +
  ggtitle("Faceting") 
# Along columns
facet + facet_grid(. ~ Species)
