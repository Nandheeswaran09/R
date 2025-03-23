#data visulazation


#BACI GRPAHICS
install.packages("CO2")
library(CO2)
plot(CO2$conc,CO2$uptake)

View(CO2)


#GRIDGRPAHICS
x<-CO2$conc
y<-CO2$uptake
library(grid)
pushViewport(plotViewport())
pushViewport(dataViewport(x,y))
grid.rect()
grid.xaxis()
grid.yaxis()
grid.points(x,y)
grid.text("CO2$conc",x=unit(-3,"lines"),gp=gpar(col="blue"),rot=90)
grid.text("CO2$uptaake",y=unit(-3,"lines"),rot = 0)
popViewport(2)


#gemoteric
install.packages("tidyverse")
library(tidyverse)

head(CO2,n=10)
str(CO2)
#bar
ggplot(CO2) +geom_bar(aes(x=CO2$conc))
#line
ggplot(CO2) +geom_line(aes(x=CO2$uptake,y=CO2$conc))
#scatterplot
ggplot(CO2) +geom_point(aes(x=CO2$uptake,y=CO2$conc))
#boxplot
ggplot(CO2) +geom_boxplot(aes(x=CO2$uptake,y=CO2$conc))
#continousx
ggplot(CO2) +geom_quantile(aes(x=CO2$uptake,y=CO2$conc))
#richerdisplay
ggplot(CO2) +geom_violin(aes(x=CO2$uptake,y=CO2$conc))
#smalldata
ggplot(CO2) +geom_jitter(aes(x=CO2$uptake,y=CO2$conc))


#piechart
install.packages("plotrix")
library(plotrix)

pie3D(CO2$conc,labels = lbl,explode=0.1,main="piechart")


#histogram
hist(CO2$uptake,xlab = "uptake",col = "red",border = "green")

#boxplot
boxplot(CO2$conc[0:10],main="mutiple")

