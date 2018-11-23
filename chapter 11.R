# 11.data manipulation with dplyr package
# install and load dplyr package

install.packages("dplyr")
library(dplyr) 
#load Data
mydata = read.csv("C:/users/kavya/downloads/groups.csv")
mydata
mydata[3]
# Selecting Random N Rows
sample_n(mydata,3)
samples
# Selecting Random Fraction of Rows
sample_frac(mydata,0.1)
mydata1 = read.csv("E:/sampledata.csv")

x1 = distinct(mydata)
x1
# Remove Duplicate Rows based on a variable
x2 = distinct(mydata, Index, .keep_all= TRUE)
x2
# Remove Duplicates Rows based on multiple variables
x2 = distinct(mydata, Index, Y2010, .keep_all= TRUE)
x2
# Selecting Variables (or Columns)
mydata2 = select(mydata1, Index, State:Y2008)
mydata2
# Dropping Variables
mydata = select(mydata1, -Index, -State)
mydata
mydata = select(mydata1, -c(Index,State))
mydata
mydata2 = select(mydata1, Index, State:Y2008)
mydata = select(mydata1, -Index, -State)
mydata
mydata = select(mydata1, -c(Index,State))
mydata
# Selecting or Dropping Variables starts with 'Y'
mydata3 = select(mydata1, starts_with("Y"))
mydata3
mydata33 = select(mydata1, -starts_with("Y"))
mydata33
mydata4 = select(mydata1, contains("A"))
mydata4
mydata5 = select(mydata1, State, everything())
mydata5
mydata6 = rename(mydata1, Index1=Index)
mydata6
# Filter Rows
mydata7 = filter(mydata1, Index == "A")
mydata7
# Multiple Selection Criteria
mydata7 = filter(mydata6, Index1 %in% c("A", "C"))
mydata7
# 'AND' Condition in Selection Criteria
mydata8 = filter(mydata6, Index1 %in% c("A", "C") & Y2002 >= 1300000 )
mydata8

mydata9 = filter(mydata6, Index1 %in% c("A", "C") | Y2002 >= 1300000)
mydata9
# NOT Condition
mydata10 = filter(mydata6, !Index1 %in% c("A", "C"))
mydata10 = filter(mydata6, grepl("Ar", State))
# Summarize selected variables
summarise(mydata, Y2015_mean = mean(Y2015), Y2015_med=median(Y2015))
# Summarize Multiple Variables
summarise_at(mydata, vars(Y2005, Y2006), funs(n(), mean, median))
numdata = mydata[sapply(mydata,is.numeric)]
summarise_all(numdata, funs(n(),mean,median))
summarise_all(mydata["Y2002"], funs(nlevels(.), nmiss=sum(is.na(.))))
arrange(mydata, Y2002, Y2011)
mydata
dt = sample_n(select(mydata, Y2002, Y2004),10)
or 
dt = mydata %>% select(Y2002, Y2004) %>% sample_n(10)
dt
group_by(mydata, Y2002)
or
mydata %>% group_by(Y2002)
mydata
mydata1 = read.csv("E:/sampledata.csv")

t = summarise_at(group_by(mydata1, Index), vars(Y2003,Y2005), funs(n(), mean(mydata1, na.rm = TRUE)))
mydata1
mean(mydata1$Y2005)

t = mydata1 %>% group_by(Index) %>%
  summarise_at(vars(Y2003:Y2005), funs(n(), mean(., na.rm = TRUE)))
t

do(data_frame, expressions_to_apply_to_each_group)
t = mydata1%>% filter(Index %in% c("A", "C","I")) %>% group_by(Index) %>%
  do(head( . , 2))
t
t = mydata1 %>% select(Index, Y2015) %>%
  filter(Index %in% c("A", "C","I")) %>%
  group_by(Index) %>%
  do(arrange(.,desc(Y2015))) %>%  slice(3)
t
t = mydata1 %>% select(Index, Y2015) %>%
  filter(Index %in% c("A", "C","I")) %>%
  group_by(Index) %>%
  filter(min_rank(desc(Y2015)) == 3)
t
t = mydata1%>%
  group_by(Index)%>%
  summarise(Mean_2014 = mean(Y2014, na.rm=TRUE),
            Mean_2015 = mean(Y2015, na.rm=TRUE)) %>%
  arrange(desc(Mean_2015))
t
mutate(data_frame, expression(s) )
or
data_frame %>% mutate(expression(s))
mydata1 = mutate(mydata, change=Y2015/Y2014)
mydata1
mydata11 = mutate_all(mydata, funs("new" = .* 1000))
mydata11
mydata12 = mutate_at(mydata, vars(Y2008:Y2010), funs(Rank=mi_rank(.)))
mydata12
mydata13 = mutate_at(mydata1, vars(Y2008:Y2010), funs(Rank=min_rank(desc(.))))
mydata13
mydata1 = read.csv("E:/sampledata.csv")

out = mydata1 %>% group_by(Index) %>% filter(min_rank(desc(Y2015)) == 1) %>%
  select(Index, State, Y2015)
out
out2 = mydata1 %>% group_by(Index) %>% mutate(Total=cumsum(Y2015)) %>%
  select(Index, Y2015, Total)
out2
library(dplyr)

df3 = inner_join(x, y, by = C("ID"="ID"))
df1 = data.frame(ID = c(1, 2, 3, 4, 5),
                 w = c('a', 'b', 'c', 'd', 'e'),
                 x = c(1, 1, 0, 0, 1),
                 y=rnorm(5),
                 z=letters[1:5])
df1

df2 = data.frame(ID= c(1, 7, 3, 6, 8),
                 a = c('z', 'b', 'k', 'd', 'l'),
                 b = c(1, 2, 3, 0, 4),
                 c =rnorm(5),
                 d =letters[2:6])
df2
df3 = inner_join(df1, df2, by = "ID")
df3
inner_join(df1, df2, by = c("ID"="ID1"))
left_join(df1, df2, by = "ID")
mtcars$model <- rownames(mtcars)
mtcars
first <- mtcars[1:20, ]
first
second <- mtcars[10:32, ]
mtcars
x=data.frame(ID = 1:6, ID1= 1:6)
x
y=data.frame(ID = 1:6,  ID1 = 1:6)
y
union(x,y)
union_all(x,y)
setdiff(first, second)
df <- c(-10,2, NA)
df
df =data.frame(x = c(1,5,6,NA))
df
df %>% mutate(newvar=if_else(x<5, x+1, x+2,0))
df
mydf =data.frame(x = c(1:5,NA))
mydf
mydf %>% mutate(newvar= if_else(is.na(x),"I am missing",
                                if_else(x==1,"I am one",
                                        if_else(x==2,"I am two",
                                                if_else(x==3,"I am three","Others")))))
mydf
df = mydata %>%
  rowwise() %>% mutate(Max= max(Y2012,Y2013,Y2014,Y2015)) %>%
  select(Y2012:Y2015,Max)
df
df1=data.frame(ID = 1:6,  x=letters[1:6])
df1
df2=data.frame(ID = 7:12, x=letters[7:12])
df2
xy = bind_rows(df1,df2)
xy
xy = rbind(df1,df2)
xy
xy = bind_cols(x,y)
or
xy = cbind(x,y)
mydata1%>% group_by(Index) %>%
  summarise(Pecentile_25=quantile(Y2015, probs=0.25),
            Pecentile_50=quantile(Y2015, probs=0.5),
            Pecentile_75=quantile(Y2015, probs=0.75),
            Pecentile_99=quantile(Y2015, probs=0.99))
x= data.frame(N= c(1:10))
x
x = mutate(x, pos = ntile(x$N,5))
length(unique(mtcars$cyl))
by_cyl <- group_by(mtcars, cyl)
models <- by_cyl %>% do(mod = lm(mpg ~ disp, data = .))
summarise(models, rsq = summary(mod)$r.squared)
models %>% do(data.frame(
  var = names(coef(.$mod)),
  coef(summary(.$mod)))
)
mydata2 = select_if(mydata, is.numeric)
mydata2
mydata3 = select_if(mydata, is.factor)
mydata3
mydata11 = mutate_if(mydata, is.numeric, funs("new" = .* 1000))
mydata11
k <- c("a", "b", "", "d")
k
na_if(k, "")

