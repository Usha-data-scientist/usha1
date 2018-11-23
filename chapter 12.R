# 12.data manipulation with data.table package

install.packages("data.table") 
# load required library
library(data.table)
mydata = fread("https://github.com/arunsrinivasan/satrdays-workshop/raw/master/flights_2014.csv")
nrow(mydata)

ncol(mydata)

names(mydata)
   
head(mydata)


dat1 = mydata[ , origin] # returns a vector
dat1
dat1 = mydata[ , .(origin)] # returns a data.table
dat1 = mydata[, c("origin"), with=FALSE]
dat2 =mydata[, 2, with=FALSE]
dat2
dat3 = mydata[, .(origin, year, month, hour)]
dat3
dat4 = mydata[, c(2:4), with=FALSE]
dat4
dat5 = mydata[, !c("origin"), with=FALSE]
dat5
dat6 = mydata[, !c("origin", "year", "month"), with=FALSE]
dat6
dat7 = mydata[,names(mydata) %like% "dep", with=FALSE]
dat7
setnames(mydata, c("dest"), c("Destination"))
setnames(mydata, c("Destination","origin"), c("dest", "origin.of.flight"))
# Filter based on one variable
dat8 = mydata[origin.of.flight== "JFK"]
dat9 = mydata[origin.of.flight %in% c("JFK", "LGA")]
dat10 = mydata[!origin.of.flight %in% c("JFK", "LGA")]
dat11 = mydata[origin.of.flight == "JFK" & carrier == "AA"]
# Indexing (Set Keys)
setkey(mydata, origin.of.flight)
data12 = mydata[c("JFK", "LGA")]
system.time(mydata[origin.of.flight %in% c("JFK", "LGA")])
system.time(mydata[c("JFK", "LGA")])
setkey(mydata, origin.of.flight, dest)
# First key column 'origin' matches "JFK" and second key column 'dest' matches "MIA"
mydata[.("JFK", "MIA")]
mydata[origin.of.flight == "JFK" & dest == "MIA"]
key(mydata)
mydata01 = setorder(mydata, origin.of.flight)
mydata02 = setorder(mydata, -origin.of.flight)
mydata03 = setorder(mydata, origin.of.flight, -carrier)
mydata[, dep_sch:=dep_time - dep_delay]
mydata002 = mydata[, c("dep_sch","arr_sch"):=list(dep_time - dep_delay, arr_time - arr_delay)]
mydata[, dep_sch:=dep_time - dep_delay][,.(dep_time,dep_delay,dep_sch)]
mydata[, .(mean = mean(arr_delay, na.rm = TRUE),
           median = median(arr_delay, na.rm = TRUE),
           min = min(arr_delay, na.rm = TRUE),
           max = max(arr_delay, na.rm = TRUE))]
mydata[, .(mean(arr_delay), mean(dep_delay))]
mydata[, lapply(.SD, mean), .SDcols = c("arr_delay", "dep_delay")]
mydata[, lapply(.SD, mean)]
mydata[, sapply(.SD, function(x) c(mean=mean(x), median=median(x)))]
mydata[, .(mean_arr_delay = mean(arr_delay, na.rm = TRUE)), by = origin.of.flight]
mydata[, .(mean_arr_delay = mean(arr_delay, na.rm = TRUE)), keyby = origin.of.flight]
mydata[, .(mean(arr_delay, na.rm = TRUE), mean(dep_delay, na.rm = TRUE)), by = origin.of.flight]
mydata[, lapply(.SD, mean, na.rm = TRUE), .SDcols = c("arr_delay", "dep_delay"), by = origin.of.flight]
setkey(mydata, "carrier")
unique(mydata)
setkey(mydata, NULL)
unique(mydata)
mydata[, .SD[1:2], by=carrier]
mydata[, .SD[.N], by=carrier]
dt = mydata[, rank:=frank(-distance,ties.method = "min"), by=carrier]
dat = mydata[, cum:=cumsum(distance), by=carrier]
DT <- data.table(A=1:5)
DT[ , X := shift(A, 1, type="lag")]
DT[ , Y := shift(A, 1, type="lead")]
DT = data.table(x=6:10)
DT[x %between% c(7,9)]
DT = data.table(Name=c("dep_time","dep_delay","arrival"), ID=c(2,3,4))
DT[Name %like% "dep"] 
(dt1 <- data.table(A = letters[rep(1:3, 2)], X = 1:6, key = "A"))
(dt2 <- data.table(A = letters[rep(2:4, 2)], Y = 6:1, key = "A"))
merge(dt1, dt2, by="A")
merge(dt1, dt2, by="A", all.x = TRUE)
merge(dt1, dt2, by="A", all.y = TRUE)
merge(dt1, dt2, by="A", all.y = TRUE)
setDF(mydata)
set.seed(123)
X = data.frame(A=sample(3, 10, TRUE),
               B=sample(letters[1:3], 10, TRUE))
mydata[, .N, by = month] [order(-N)] 
mydata
mydata[, .(mean_arr_delay = mean(arr_delay, na.rm = TRUE)), by = month][order(-mean_arr_delay)][1:3]               
mydata[, lapply(.SD, mean, na.rm = TRUE), .SDcols = c("arr_delay", "dep_delay"), by = origin][(arr_delay + dep_delay) > 20]
mydata[carrier == "DL",
       lapply(.SD, mean, na.rm = TRUE),
       by = .(origin, dest),
       .SDcols = c("arr_delay", "dep_delay")]
mydata[, .SD[1], .SDcols="air_time", by=origin][air_time > 300, sum(air_time)]

