m <- matrix(c(1,2,3,4,5,6),nrow = 2,ncol = 3)
m
m1<- matrix(c(1,2,3,4,5,6),nrow = 2,byrow = T)
m1
m <- matrix(1:12,nrow = 3,byrow = T)
m

nrow(m)
ncol(m)

dim(m)

# matrix indexing
m[2,3]
m[2,]

m[1,]

m[,3] 
m[2,]
m[,2]

m[c(2,3),]
m[,c(1,3)]

m[c(1,3),c(2,4)]

m[-1,]
m[,-2]
m[-1,-2]

m<- matrix(c(10,20,30,40),nrow = 2,byrow = T)
colnames(m)<-c("Age","Score")
rownames(m)<-c("Rudransh",'Sayan')
m

m["Rudransh","Age"]

#rbind()

x<- c(1,2,3)
y<-c(4,5,6)
rbind(x,y)

# cbind()

cbind(x,y)


#matrix arithematic
A<- matrix(c(1,2,3,4),nrow = 2)
B<-matrix(c(5,6,7,8), nrow = 2)

A+B
A-B
A*B # element wise multiplication

A%*%B #matrix multiplication

# transpose of a matrix

t(A)


sum(A)
mean(A)
max(A)
min(A)

colSums(A)
rowSums(A)
colMeans(A)
rowMeans(A)


m <- matrix(1:12,nrow = 3,byrow = T)
apply(m,1,sum)
apply(m,2,sum)


m <-matrix(1:9,nrow = 3,byrow = TRUE)
nrow(m)
ncol(m)
dim(m)

m[2,2]
m[1,]
m[3,]
m[,2]
m[c(1,3),c(1,3)]
m[c(1,3),]
m[,c(1,3)]
m[-2,]
m[,-2]
m[-1,-3]

x <- c(10, 20, 30)
y <- c(40, 50, 60)
rbind(x,y)
cbind(x,y)


A <- matrix(c(1, 2, 3, 4), nrow = 2)
B <- matrix(c(5, 6, 7, 8), nrow = 2)

A + B
A - B
A * B
A / B
A %*% B

M <- matrix(1:12, nrow = 3, byrow = TRUE)
rowSums(M)
colSums(M)
rowMeans(M)
colMeans(M)

apply(M,1,sum)
apply(M,2,sum)
apply(M,1,mean)
apply(M,2,mean)


B <- matrix(c(80,75,90,65,88,72,92,81,95),nrow = 3,byrow = T)
colnames(B) <- c("Math","Stats",'R')
rownames(B) <- c("Student1","Student2","Student3")

B
B["Student2","Stats"]
B["Student3",]
B[,"R"]

A <- matrix(1:9, nrow = 3, byrow = TRUE)
t(A)
rowSums(A)
colSums(A)
rowMeans(A)
colMeans(A)

diag(3)
diag(c(10,20,30))


A <- matrix(c(1,2,3,4), nrow = 2)
B <- matrix(c(5,6,7,8), nrow = 2)

A * B
A %*% B

M <- matrix(
  c(10, 25, 5,
    30, 15, 40,
    8, 50, 20),
  nrow = 3,
  byrow = TRUE
)
M
M[M > 20]
which(M > 20 , arr.ind = TRUE)

M <- matrix(1:9, nrow = 3)
as.vector(M)

scores <- matrix(
  c(78, 85, 92,
    65, 74, 81,
    90, 88, 95,
    55, 60, 70),
  nrow = 4,
  byrow = TRUE
)

rownames(scores) <- c("A", "B", "C", "D")
colnames(scores) <- c("Math", "Stats", "R")

colMeans(scores)

names(which.max(rowMeans(scores)))
names(which.max(colMeans(scores)))
scores[scores>85]
which(scores > 85 , arr.ind = TRUE)
scores[names(which.max(rowMeans(scores))),]

ifelse(scores > 75,TRUE,FALSE)
length(scores[ifelse(scores > 75,TRUE,FALSE)])

rowSums(scores >= 75)
