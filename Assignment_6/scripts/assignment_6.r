data1 <- read_csv("./assignment_6/data/data_plot1.csv")
data2 <- read_csv("./assignment_6/data/data_plot2.csv")
data3 <- read_csv("./assignment_6/data/data_plot3.csv")
data4 <- read_csv("./assignment_6/data/data_plot4.csv")
data5 <- read_csv("./assignment_6/data/data_plot5.csv")
data6 <- read_csv("./assignment_6/data/data_plot6.csv")

#plot 1

ggplot(data1, aes(x = name, y = value)) + 
  geom_boxplot()   +
  geom_violin()

#plot2
  
ggplot(data2, aes(x = area, y = poptotal)) + 
  geom_point() + geom_smooth(method = 'gam', formula = y ~ x) 
