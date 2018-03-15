library(ggmap)
library(ggplot2)
dat = read.csv("crashreports.csv")
map = get_map(c(longs[1],lats[1]),maptype = "road",zoom =16)
crashpoint = data.frame(long=longs[1],lat=lats[1])
p = geom_point(data=crashpoint, aes(x=long,y=lat), color="red",size = 3)
ggmap(map) + p
head(dat$Location)
dat$dtime = strptime(as.character(dat$Crash.Date.Time),"%m/%d/%Y %I:%M:%S %p", tz="EST")
timeTable = table(dat$dtime$wday)
## Crashes by Days of the Week
par(las=2)
barplot(timeTable, main ="Crashes: Day of Week", names.arg = c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"),col = "green")
