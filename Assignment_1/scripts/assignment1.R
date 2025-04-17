install.packages("u")
library(usethis)
use_git()

project_setup <- function(){
  folders <- c('data', 'results', 'figures', 'scripts')
  mainDir <- getwd()
  sapply(folders, function(subDir){
    dir.create(file.path(mainDir, subDir))
  })
}

project_setup()

renv::init()
renv::snapshot()

install.packages("tidyverse")
library(tidyverse)
library(ggplot2)
renv::snapshot()

data(iris)
iris <- as_tibble(iris)
head(iris) 
summary(iris)
str(iris)

filter(iris, Species == "versicolor")
filter(iris, Petal.Length > 6 & Sepal.Length > 7)
iris %>% 
  group_by(Species) %>%
  summarise(mean(Petal.Length))

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(aes(color = Species)) +
  labs(title = "Sepal Length vs Sepal Width by Species") +
  theme_minimal()

ggsave("figures/Sepal Length vs Sepal Width by Species.png", width = 6, height = 4, dpi = 300)

ggplot(iris, aes(x = Petal.Length, y = Petal.Width)) + 
  geom_point(aes(color = Species)) +
  labs(title = "Petal Length vs Petal Width by Species") +
  theme_minimal()

ggsave("figures/Petal Length vs Petal Width by Species.png", width = 6, height = 4, dpi = 300)