students <- data.frame(
  name = c("A","B","C","D"),
  age = c(22,21,23,24),
  marks = c(78,87,75,86)
)

students


students <- data.frame(
  name = c("A","B","C","D"),
  age = c(22,21,23,24),
  marks = c(78,87,75,56),
  passed = c(TRUE,TRUE,TRUE,FALSE)
)

students
str(students)
nrow(students)
ncol(students) 

dim(students)

names(students)
colnames(students)

students$marks

mean(students$marks)

students$marks >80

students[["marks"]]
students["marks"] #returns a dataframe
students[3]
students[[3]]

students[1,2]
students[1,]

students[,3]

students[c(1,3),]
students[,c(1,3)]

employees<-data.frame(
  name = c("A","B","C","D","E"),
  age = c(23,25,22,28,24),
  department = c("Statistics",
                 "Programming",
                 "Statistics",
                 "HEOR",
                 "Programming"),
  salary = c(55000,62000,58000,75000,65000),
  experience = c(1,3,2,5,2)
)

employees
nrow(employees)
ncol(employees)
dim(employees)

str(employees)
colnames(employees)
names(employees)

employees$salary
employees[["salary"]]
employees[1,]
employees[,c("name","salary")]
employees[c(1,3,5),]
mean(employees$salary)

# Refining Rows

employees$salary > 60000
employees[employees$salary > 60000,]
employees[employees$department == "Statistics",]

employees[employees$department == "Statistics" & employees$salary > 55000,]

employees[employees$department == "Statistics" |  employees$department == "HEOR",]
employees[employees$department %in% c("Statistics","HEOR"),]

employees[employees$salary > 60000,]

employees[employees$experience >= 3,]

employees[employees$department == "Statistics",]
employees[employees$department %in% c("Statistics","HEOR"),]
employees[employees$department == "Statistics" & employees$salary > 55000,]
employees[employees$salary >= 58000 & employees$salary <= 70000,]
employees[employees$department != "Statistics",]

employees[employees$department %in% c("Statistics","Programming") & employees$salary >= 60000,]

# Modifying dataframes

employees$bonus <- employees$salary*0.1
employees

employees$experience_level <- ifelse(employees$experience >=3,"Experienced","Junior")
employees

employees$salary <- employees$salary*1.05
employees$salary

employees[employees$name == "D","salary"] <- 80000

employees$bonus <- NULL
employees
employees$experience_level <- NULL

employees<-data.frame(
  name = c("A","B","C","D","E"),
  age = c(23,25,22,28,24),
  department = c("Statistics",
                 "Programming",
                 "Statistics",
                 "HEOR",
                 "Programming"),
  salary = c(55000,62000,58000,75000,65000),
  experience = c(1,3,2,5,2)
)

#1
employees$annual_bonus <- employees$salary*0.1

employees$experience_level <- ifelse(employees$experience >=3,"Experienced","Junior")

employees$salary_after_bonus <- employees$salary + employees$annual_bonus

employees[employees$name == "D","salary"] <- 80000

employees$annual_bonus <- NULL

employees$high_salary <- ifelse(employees$salary >= 65000,TRUE,FALSE)
employees

#order

order(employees$salary)
employees[order(employees$salary),]

employees[order(employees$salary, decreasing = TRUE),]

employees[order(employees$department,employees$salary),]

employees[order(employees$salary),]
employees[order(employees$salary,decreasing = TRUE),]

employees[order(employees$experience,decreasing = TRUE),]
which.max(employees$salary)

employees[which.max(employees$salary),]

employees[order(employees$department,-employees$salary),]




test_data <- data.frame(
  name = c("A", "B", "C", "D", "E"),
  age = c(23, NA, 25, 28, NA),
  salary = c(55000, 62000, NA, 75000, 65000)
)

test_data

is.na(test_data$age)
sum(is.na(test_data$age))

sum(is.na(test_data$salary))

test_data[is.na(test_data$age),]
mean(test_data$age)
mean(test_data$age,na.rm = TRUE)

test_data[!is.na(test_data$age),]

is.na(test_data)
sum(is.na(test_data))

colSums(is.na(test_data))
rowSums(is.na(test_data))


test_data <- data.frame(
  name = c("A", "B", "C", "D", "E"),
  age = c(23, NA, 25, 28, NA),
  salary = c(55000, 62000, NA, 75000, 65000)
)

sum(is.na(test_data$age))
sum(is.na(test_data$salary))
mean(test_data$age,na.rm = TRUE)

test_data[is.na(test_data$salary),]
test_data[!is.na(test_data$age),]

sum(is.na(test_data))

colSums(is.na(test_data))
rowSums(is.na(test_data))

test_data[!is.na(test_data$age) & !is.na(test_data$salary),]

#subset()

employees[employees$salary > 60000,]
subset(employees,salary > 60000)
subset(employees,department == "Statistics" & salary > 55000)

# select

subset(employees,salary >60000,select = c(name,salary))

subset(employees,
       salary > 60000,
       select  = -experience)



employees<-data.frame(
  name = c("A","B","C","D","E"),
  age = c(23,25,22,28,24),
  department = c("Statistics",
                 "Programming",
                 "Statistics",
                 "HEOR",
                 "Programming"),
  salary = c(55000,62000,58000,75000,65000),
  experience = c(1,3,2,5,2)
)

subset(employees,salary > 60000)
subset(employees,department == "Statistics")
subset(employees,department == "Statistics" & experience >= 2)
subset(employees, department == "Programming" | department == "HEOR")
subset(employees, salary >=58000 & salary <= 80000)
subset(employees, salary > 60000, select = c(name,department,salary))
subset(employees , experience >=2 & salary >= 60000,select = c(name,experience,salary))


# cbind and rbind
employees<-data.frame(
  name = c("A","B","C","D","E"),
  age = c(23,25,22,28,24),
  department = c("Statistics",
                 "Programming",
                 "Statistics",
                 "HEOR",
                 "Programming"),
  salary = c(55000,62000,58000,75000,65000),
  experience = c(1,3,2,5,2)
)



new_employee <- data.frame(
  name = "F",
  age = 26,
  department = "Statistics",
  salary = 70000,
  experience = 3
)

employees <- rbind(employees,new_employee)
employees

new_employees <- data.frame(
  name = c("G", "H"),
  age = c(27, 29),
  department = c("HEOR", "Programming"),
  salary = c(72000, 68000),
  experience = c(4, 6)
)

employees <- rbind(employees,new_employees)
employees

bonus <- c(5000, 6000, 5500, 8000, 6500, 7000, 7200, 6800)
employees <- cbind(employees,bonus)
employees


rownames(employees)
rownames(employees) <- employees$name
employees
employees$name

# duplicated
test <- data.frame(
  name = c("A", "B", "A", "C"),
  salary = c(50000, 60000, 50000, 70000)
)

duplicated(test)
test[duplicated(test),]
test_unique <- test[!duplicated(test),]
test_unique


test[duplicated(test$name),]


employees<-data.frame(
  name = c("A","B","C","D","E"),
  age = c(23,25,22,28,24),
  department = c("Statistics",
                 "Programming",
                 "Statistics",
                 "HEOR",
                 "Programming"),
  salary = c(55000,62000,58000,75000,65000),
  experience = c(1,3,2,5,2)
)

new_employee <- data.frame(
  name = "F",
  age = 26,
  department = "Statistics",
  salary = 70000,
  experience = 3
)

employees <- rbind(employees,new_employee)
employees

new_employees <- data.frame(
  name = c("G","H"),
  age = c(27,29),
  department = c("HEOR","Programming"),
  salary = c(72000,68000),
  experience = c(4,6)
)

employees<- rbind(employees,new_employees)
employees

bonus <- c(5000,6000,5500,8000,6500,7000,7200,6800)

length(bonus) == nrow(employees)

employees <- cbind(employees,bonus)
employees


test <- data.frame(
  name = c("A", "B", "A", "C", "B"),
  salary = c(50000, 60000, 50000, 70000, 60000)
)

duplicated(test)
test[duplicated(test),]

test_unique <- test[!duplicated(test),]
test_unique


employees<-data.frame(
  name = c("A","B","C","D","E"),
  age = c(23,25,22,28,24),
  department = c("Statistics",
                 "Programming",
                 "Statistics",
                 "HEOR",
                 "Programming"),
  salary = c(55000,62000,58000,75000,65000),
  experience = c(1,3,2,5,2)
)

duplicated(employees$name)
duplicated(employees$department)
duplicated(employees[c("name","salary")])

# Character vs Factor

df <- data.frame(
  name = c("A","B","C")
)

str(df)

x <- factor(c("A","B","A","C"))
x
levels(x)

department <- factor(
  c("Statistics","HEOR","Statistics","Programming")
)
department

#factor pitfall
x<- factor(c("10","20","30"))
as.numeric(as.character(x))  # firs convert factors to character and then to numeric no direct conversion from factor to numeric not possible

# Recycling 

df <- data.frame(
  name = c("A", "B", "C", "D"),
  salary = c(50000, 60000, 70000, 80000)
)

bonus <- c(5000, 6000)

df$bonus <- bonus
df            

# drop = FALSE
df <- data.frame(
  name = c("A", "B", "C"),
  salary = c(50000, 60000, 70000)
)
df[,"salary"] # gives avector
df[,"salary",drop = FALSE] #preserves the dataframe structure
class(df[,"salary"])
class(df[,"salary",drop = FALSE])


df$salary[2] <- NA  #Just sets salary of 2nd person NA
df

df$salary <- NULL  # removes the entire salary column

df[["salary"]]
df$salary
df["salary"]

which.max(df$salary)
df[which.max(df$salary),1]

#Master Challenge
employees2 <- data.frame(
  name = c("A", "B", "C", "D", "E", "F"),
  age = c(23, 29, 25, 31, 27, 24),
  department = c(
    "Statistics",
    "HEOR",
    "Statistics",
    "Programming",
    "HEOR",
    "Statistics"
  ),
  salary = c(55000, 72000, 68000, 85000, 75000, 62000),
  experience = c(1, 5, 3, 7, 4, 2)
)

employees2[which.max(employees2$salary),]

experienced<- subset(employees2,experience >= 3)
experienced$salary
mean(subset$salary)

table(employees2$department)
install.packages("tidyverse")

tapply(employees2$salary, employees2$department, mean)

employees2$salary_level <- ifelse(employees2$salary >= 75000,"High",
                                  ifelse(employees2$salary >= 60000,"Medium","Low"))
employees2

subset(employees2, experience >= 3& salary >= 70000,
       select = c("name","department","salary","experience"))

which.max(tapply(employees2$salary,employees2$department,mean))
avg_salary <- tapply(
  employees2$salary,
  employees2$department,
  mean
)

names(avg_salary)[which.max(avg_salary)]

#tapply

#Take a vector, split it into groups, and apply a function to each group.

salary <- c(55000, 72000, 68000, 85000, 75000, 62000)

department <- c(
  "Statistics",
  "HEOR",
  "Statistics",
  "Programming",
  "HEOR",
  "Statistics"
)

tapply(salary,department,mean)

tapply(employees2$salary,
       employees2$department,
       min)
tapply(employees2$salary,
       employees2$department,
       length)
tapply(employees2$salary,
             employees2$department,
             sd)

tapply(employees2$salary,
       employees2$department,
       function(x) max(x) - min(x))

# Multiple grouoing
 employees2$experience_level <- ifelse(employees2$experience >= 3,
                                       "Experienced",
                                       "Junior")

 tapply(employees2$salary,
        list(employees2$department,employees2$experience_level),
        mean) 

 
salary <- c(50000,NA,70000,80000)
department <- c("A","A","B","B") 

tapply(salary,department,mean)

tapply(salary,department,mean,na.rm = TRUE)

#tapply() vs table

table(employees2$department) #Count categories
tapply(employees2$salary,employees2$department,mean) #Apply a function by group


# tapply() vs aggregrate

tapply(employees2$salary,employees2$department,mean)
aggregate(
  salary ~ department,
  data = employees2,
  FUN = mean
)

tapply(employees2$salary,employees2$department,max)
tapply(employees2$salary,employees2$department,min)
tapply(employees2$salary,employees2$department,sd)
tapply(employees2$salary,employees2$department,length)
tapply(employees2$experience,employees2$department,mean)
tapply(employees2$salary,
       employees2$department,
       function(x) max(x) - min(x))
tapply(employees2$salary,
       list(employees2$department,employees2$experience_level),
       mean)
