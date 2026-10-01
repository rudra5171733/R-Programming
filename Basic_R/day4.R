# list
student <- list(
  name = "Rahul",
  age = 23,
  marks = c(70,78,65),
  passed = TRUE
)

typeof(student)

x<- list(10,"Hello",c(1,2,3),TRUE)
x
x[1]
typeof(x[1])
x[[1]]
typeof(x[[1]])

names(student)

student$name
student$age
student$marks
student$passed

student$marks[2]

student["marks"]
student[["marks"]]
student$marks

#nested list

student <- list(
  name = "Rahul",
  academic = list(
    maths = 90,
    stats = 89,
    R = 78
  )
)
student$academic

student$academic$stats


typeof(student["academic"])
student["academic"]["stats"]
typeof(student[["academic"]])

student[["academic"]][["stats"]]

# List can contain matrix too

student <- list(
  name = "Rahul",
  marks = matrix(c(78,89,76,80),nrow = 2,byrow = TRUE)
)

student$marks
student["marks"]
student[["marks"]]
student$marks[1,2]
student[["marks"]][1,2]


# task 1
employee <- list(
  name = "Rudransh",
  age = 23,
  department = "Statistics",
  skills = c("R","Python","SQL"),
  experience = 1.5
)

employee$name
employee[["skills"]]
employee[["skills"]][2]
names(employee)
typeof(employee)
length(employee)

employee["skills"]  #returns a list
employee[["skills"]]  # returns the original skill vector


employee[1]
employee[[1]]
employee$name


typeof(employee[1])
typeof(employee[[1]])
typeof(employee$name)


# modification of lists
employee <- list(
  name = "Rudransh",
  age = 23,
  department = "Statistics",
  skills = c("R","Python","SQL"),
  experience = 1.5
)

employee$age <- 24
employee
employee[["age"]] <-45
employee

# Add a new element
employee$location <- "Delhi"
employee
employee[["Hobby"]] <- "Reading Books"
employee
employee[['Salary']] <- 75000

# Modify an element inside a vector stored in a list
employee$skills[2] <- "SAS"
employee
 
# Remove an Element
employee$experience <- NULL
employee


names(employee)
length(employee)

#nested List problem

employee <- list(
  name = "Rudransh",
  personal = list(
    age = 23,
    city= "Delhi"
  ),
  job = list(
    department = "Statistics",
    role = "Biostatistician"
  ),
  skills = c("R","Python","SAS")
)

employee[["name"]]
employee$name

employee$personal$age
employee[["personal"]][["age"]]
employee$personal$city
employee[["personal"]][["city"]]
employee$job$department
employee[["job"]][["department"]]
employee$job$role
employee[["job"]][["role"]]
employee$skills[2]
employee[["skills"]][2]


employee[[c("job","role")]]
employee[[c("personal","age")]]


employee[[c("personal","city")]]
employee[[c("job","department")]]
employee[["skills"]][2]
employee["skills"][[1]][2]

employee["skills"]


# Apply family of functions

#1. lapply()

scores <- list(
  maths = c(89,76,90),
  statistics = c(90,78,96),
  programming = c(90,78,98)
)

typeof(lapply(scores,mean))
lapply(scores,mean)

lapply(scores,function(x) max(x))
lapply(scores, function(x) mean(x))

employee <- list(
  name = "Rudransh",
  age = 23,
  department = "Statistics",
  skills = c("R", "Python", "SAS")
)

lapply(employee,length)

x <- list(
  a = c(1, 2, 3),
  b = c(4, 5, 6),
  c = c(7, 8, 9)
)
x
for(i in x){
  print(mean(i))
}

lapply(x,mean)


sapply(x,mean)
sapply(scores,mean)

scores <- list(
  math = c(80, 90, 70, 85),
  statistics = c(75, 88, 92, 80),
  programming = c(95, 85, 90, 100)
)
scores
lapply(scores,mean)
sapply(scores,mean)
lapply(scores, max)
sapply(scores, min)
lapply(scores,length)

lapply(scores, function(x) max(x) - min(x))

# apply()
# 
# Primarily works on matrices/arrays.

# lapply()
# 
# Works on a list/vector and returns a list.

# sapply()
# 
# Works similarly to lapply() but tries to simplify the result.

result1 <- lapply(scores, mean)
result2 <- sapply(scores, mean)

typeof(result1)
typeof(result2)

class(result1)
class(result2)

lapply(scores, range)
sapply(scores, range)

str(lapply(scores, range))
str(sapply(scores, range))

#vapply
vapply(scores,mean,numeric(1))
vapply(scores,range,numeric(2))

sapply(scores, range)


names_list <- list(
  first = "R",
  second = "Python",
  third = "SAS"
)
vapply(names_list, identity, character(1))
logical_list <- list(
  a = TRUE,
  b = FALSE,
  c = TRUE
)

vapply(logical_list, identity, logical(1))


scores <- list(
  math = c(80, 90, 70, 85),
  statistics = c(75, 88, 92, 80),
  programming = c(95, 85, 90, 100)
)

vapply(scores,mean,numeric(1))
vapply(scores,max,numeric(1))
vapply(scores,min,numeric(1))
vapply(scores,length,numeric(1))
vapply(scores,function(x) max(x) - min(x) , numeric(1))

#mapply multiple inputs

names <- c("A","B","C")
scores <- c(80,90,75)

mapply(function(names,scores){
  paste(names,"scored",scores)
} , names,scores)

x<-c(34,67,89)
y<-c(23,67,39)

mapply(sum,x,y)

students <- c("A", "B", "C", "D")

math <- c(80, 90, 75, 88)

stats <- c(85, 92, 78, 90)

mapply(sum,math,stats)
(1/2)*mapply(sum,math,stats)

mapply(function(students,math,stats){
  paste(students,"has average:",(1/2)*mapply(sum,math,stats))
},students,math,stats)

mapply(mean, math, stats)
mapply(function(x, y) mean(c(x, y)), math, stats)

mapply(
  function(student, math, stats) {
    paste(student, "has average", mean(c(math, stats)))
  },
  students,
  math,
  stats
)


#Map()
students <- c("A", "B", "C", "D")
math <- c(80, 90, 75, 88)
stats <- c(85, 92, 78, 90)

Map(sum,math,stats)
mapply(sum,math,stats)


Map(function(x,y) (x+y)/2,math,stats)

Map(function(students,math,stats){
  paste(students,"has average:",(math+stats)/2)
},students,math,stats)


# Unlist
x <- list(
  a = c(1, 2, 3),
  b = c(4, 5, 6)
)
unlist(x)

#task
students <- c("A", "B", "C", "D")
math <- c(80, 90, 75, 88)
stats <- c(85, 92, 78, 90)

Map(function(x,y) x+y,math,stats)
Map(function(x,y) (x+y)/2,math,stats)

Map(function(students,math,stats){
  paste(students,"Total:", math + stats)
},students,math,stats)


total_map <- Map(sum, math, stats)

average_map <- Map(
  function(x, y) (x + y) / 2,
  math,
  stats
)

total_map
average_map
unlist(average_map)

#Final Challenge
employees <- list(
  emp1 = list(
    name = "A",
    department = "Statistics",
    skills = c("R", "SAS"),
    scores = c(80, 90, 85)
  ),
  emp2 = list(
    name = "B",
    department = "Programming",
    skills = c("Python", "SQL"),
    scores = c(75, 88, 92)
  ),
  emp3 = list(
    name = "C",
    department = "Statistics",
    skills = c("R", "Python"),
    scores = c(95, 91, 89)
  )
)

#1
employees$emp1$name
employees[["emp1"]][["name"]]

employees$emp2$department
employees[["emp2"]][["department"]]

employees$emp3$skills[2]
employees[["emp3"]][["skills"]][2]

#2
employee_names <- lapply(employees, "[[", "name")
employee_names

employees_names<-lapply(employees , function(x) x$name)
employees_names

#3

lapply(employees, function(x) x$scores)
lapply(employees,"[[","scores")

#4
sapply(employees, function(x)  mean(x$scores))

#5
vapply(employees, function(x) max(x$scores),numeric(1))

#6
sapply(employees, function(x){
  length(x$skills)
})

#7
names(which.max(sapply(employees,function(x) mean(x$scores))))
#8

employees[names(which.max(sapply(employees,function(x) mean(x$scores))))]
          
#9
lapply(employees,function(x) max(x$scores) - min(x$scores))

#10
employee_names <- sapply(employees, function(x) x$name)
Map(
  function(name, employee) {
    paste(
      name,
      "Average =",
      round(mean(employee$scores), 2)
    )
  },
  employee_names,
  employees
)


# last Challenge
employees <- list(
  emp1 = list(
    name = "A",
    department = "Statistics",
    skills = c("R", "SAS"),
    scores = c(80, 90, 85)
  ),
  emp2 = list(
    name = "B",
    department = "Programming",
    skills = c("Python", "SQL"),
    scores = c(75, 88, 92)
  ),
  emp3 = list(
    name = "C",
    department = "Statistics",
    skills = c("R", "Python"),
    scores = c(95, 91, 89)
  )
)

#1
employees$emp3$skills[2]
employees[["emp3"]][["skills"]][2]

#2
lapply(employees, function(x) max(x$scores))

#3
names(which.max(sapply(employees , function(x) max(mean(x$scores)))))

#4
vapply(employees, function(x) length(x$skills),numeric(1))

#5
emp_avg <- sapply(employees , function(x) mean(x$scores))
emp_avg 
employee_names <- sapply(employees, function(x) x$name)
employee_names

Map(function(employee,scores){
  paste(employee,"Average:",scores)
} ,employee_names,emp_avg )
