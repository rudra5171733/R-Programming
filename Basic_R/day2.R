#Vectors
x<- c(10,20,30,40)
y<-c("Rudransh",'Sayan')
z<-c(TRUE,FALSE,TRUE)

typeof(x)
typeof(y)

a<-c(10,20,"30")
a
typeof(a)

# Coercion hierarchy
# A simplified hierarchy to remember for now is:

b<- c(TRUE,10)
b
b<- c(TRUE,"10")
b

d<- c(10,20,30,40,50,60)
d[1]

d[c(1,2,3)]
d[c(1,3,4)]
d[-1]
d[-c(1,3,4)]

length(d)
names <- c("Rudransh","Sayan")
length(names)

#vectorized operations

x<-c(10,20,30,40,50,60,70)
x + 10
x/10


x<-c(1,2,3)
y<-c(4,5,6)

x+y
x*y

a<-c(1,2,3)
b<-c(4,5,6,7)
a+b
a*b

a<- c(1,2,3)
b<-c(3,4,5,6,7,8)
a+b
a*b

#Logical Indexing

x<-c(12,14,36,73,21,34,56)
x>25
x[x>25]

x[x<40]
x[x >= 30]
x[x != 14]

x <- seq(1,5)
x
x<-seq(1,10,by = 2)
x


1:10
x<-3:15
x

rep(5,3)
x<-rep(5,7)
x
x<-rep(c(2,7),5)
x
y<-rep(c(1,2),each = 5)
y


n <- c(5,10,15,20,25)
names<-c("A","B","C","D","E")
logical_values <- c(TRUE,FALSE,TRUE,FALSE,TRUE)

n[1]
n[3]
n[length(n)]
n[c(1,3,5)]
n[-1]
n[-c(2,4)]

n+5
n*2
n^2
n/5

n[n>10]
n[n<20]
n[n >= 15]
n[n == 20]
n[n!=15]


seq(1,20)
20:1
rep(5,10)
rep(c(1,2,3),3)
rep(c(1,2,3),each = 2)

a <- c(1, 2, 3)
b <- c(1, 2, "3")
c <- c(TRUE, FALSE, 1)
d <- c(TRUE, FALSE, "R")

typeof(a)
typeof(b)
typeof(c)
typeof(d)


x<-c(10,20,30,40,50)
x[2:4]
x<-c(5,10,15,20,25)
x[x %% 2 == 0]

x[c(1,3)] # gives the first and third element of the vector
x[-c(1,3)] # gives all the elements except the first and the third element

x<-c(1,2,3)
x*2 +5

x<-c(TRUE,10,"R")
typeof(x)

x <- c(10, 20, 30, 40, 50)

x[x > 15 & x < 45]
length(x) # gives the length of the vector x 
x[length(x)] # gives the last element of the vector


x<-c(A=10,B=20,C=30)
x
x["A"]
x[c("A","C")]

x<- c(10,20,30)
names(x) <-c("A","B","C")
names(x)
x

which(x > 20) # returns the index of value satisfying the condition

x<- c(10,20,30,40,50,60)
which.max(x)
which.min(x)
min(x)
max(x)


any(x > 45)  # asks if atleast 1  value satisfies the condition and returns TRUE or FALSE
any(x > 100)

all(x > 5) # checks whether all values satisfy the condition


x <- c(10,20,NA,30,40)
x 
x[x>20]

is.na(x)

x[is.na(x)]
x[!is.na(x)]


x<-c(10,20,30,NA,40,NA)
sum(x)

sum(x,na.rm = TRUE)


# NULL vs NA
x<-c(10,NA,30)
length(x)
x<-NULL
length(x)


x<-c(23,11,45,1,67,56,45,68,90)
sort(x)
sort(x,decreasing =T)

x<-c(10,20,30,40)
rev(x)

x<-c(10,10,20,30,20,30,10)
unique(x)

duplicated(x)

x<-"100"
y <- as.numeric(x)
y

x<-100
y <- as.character(x)
y

as.logical(1)
as.logical(2)
as.logical(0)

x<-c(10,20,30,40,50,60,70,80)
ifelse(x>25,"Hello","get lost")

x[ x> 15 & x< 45]
x[x < 15 | x> 45]

x <- c(10,20,30,40,50)
x != 30

x<-c(Age = 23,Height = 175, Weight = 70)
x[c("Age","Weight")]


x <- c(12, 5, 27, 8, 35, 14, 40)
which(x > 20)
which(x < 15)
which(x %% 2 == 0)

x <- c(12, 50, 23, 80, 45, 10)
max(x)
which.max(x)
min(x)
which.min(x)

x <- c(10, 20, 30, 40, 50)

any(x > 45)
any(x > 100)

all(x > 5)
all(x > 20)


x <- c(10, 20, NA, 40, NA, 60)
which(is.na(x))
x[which(is.na(x))]
x[which(!is.na(x))]
sum(x,na.rm = T)
mean(x,na.rm = T)

x <- c(30, 10, 20, 10, 40, 30, 50)
sort(x)
sort(x,decreasing = T)
rev(x)
unique(x)
x[duplicated(x)]


marks <- c(35, 67, 82, 29, 91, 45)
ifelse(marks > 40,"Pass","Fail")

x <- c(5, 12, 18, 25, 31, 40, 50)
x[x > 10 & x < 40]
x[x < 10 | x > 40]


hours <- c(8, 7.5, 9, 6, NA, 8.5, 10, 4, 7, NA)
length(hours[!is.na(hours)])
length(hours[is.na(hours)])
mean(hours,na.rm = TRUE)
hours[which.max(hours)]
which.max(hours)

ifelse(is.na(hours),"Missing",ifelse(hours >= 8,"Full","Less"))

which(hours >= 8 & !is.na(hours))
hours[hours >=8 & !is.na(hours)]

hours[!is.na(hours)]
(length(hours[hours >= 8 & !is.na(hours)])/length(hours[!is.na(hours)]))*100
