library(tidyverse)
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

employees2 |>
  summarise(
    mean_salary = mean(salary)
  )

employees2 |>
  summarise(
    mean_salary = mean(salary),
    min_salary = min(salary),
    max_salary = max(salary)
  )

# summarise vs mutate()

employees2 |>  #mutate keeps all 6 rows
  mutate(
    mean_salary = mean(salary)
  )

employees2 |>  # produces a single row
  summarise(
    mean_salary = mean(salary)
  )


employees2 |>
  summarise(
    mean_salary = mean(salary),
    median_salary = median(salary),
    sd_salary = sd(salary),
    min_salary = min(salary),
    max_salary = max(salary)
  )


#na.rm

employees2 |>
  summarise(
    mean_salary = mean(salary,na.rm = T)
  )

# connection with tapply

tapply(employees2$salary,
       employees2$department,
       mean)


employees2 |>
  group_by(department) |>
  summarise(
    mean_salary = mean(salary)
  )


employees2 |>
  group_by(department) |>
  summarise(
    mean_salary = mean(salary),
    median_salary = median(salary),
    max_salary = max(salary),
    min_salary = min(salary),
    sd_salary = sd(salary)
  )

# counting : n()
 employees2 |>
   summarise(
     employees = n()
   )

 employees2 |>
   group_by(department) |>
   summarise(
     employees = n()
   )

 employees2 |>
   group_by(department) |>
   summarise(
     total_salary = sum(salary))

 # conditional summaries
 
 employees2 |>
   filter(experience >= 3) |>
   summarise(
     mean_salary = mean(salary)
   )

 # Exercise
 
 employees2 |>
   summarise(
     avg_salary = mean(salary)
   )

 employees2 |>
   summarise(
     avg_salary = mean(salary),
     median_salary  = median(salary),
     minimum_salary = min(salary),
     maximum_salary = max(salary)
   )

 employees2 |>
   group_by(department) |>
   summarise(
     no_of_employees = n()
   )

 employees2 |>
   group_by(department) |>
   summarise(
     mean_salary = mean(salary)
   )

 employees2 |>
   group_by(department) |>
   summarise(
     no_of_employees = n(),
     avg_salary = mean(salary)
       )

 employees2 |>
   group_by(department) |>
   summarise(
     total_salary = sum(salary)
   )

 employees2 |>
   group_by(department) |>
   summarise(
     no_of_employees = n(),
     avg_salary = mean(salary),
     sd_salary = sd(salary),
     min_salary = min(salary),
     max_salary = max(salary)
   )

 employees2 |>   # this is dplyr equivalent of tapply()
   group_by(department) |>
   summarise(
     avg_salary = mean(salary)
   )

 tapply(employees2$salary, employees2$department,mean) 
 
 # deeper group_by()
 
 employees2 |>
   group_by(department) |>
   glimpse()

 employees2 |>
   group_by(department) |>
   mutate(
     department_avg = mean(salary)
   )

 employees2 |>
   group_by(department) |>
   summarise(
     department_avg = mean(salary)
   )
 
 
 # grouped calculations with mutate
 
 employees2 |>  # mutate dosent colapse rows
   group_by(department) |>
   mutate(
     dept_avg = mean(salary)
   )
 
 employees2 |>  # summarise collapses rows 
   group_by(department) |>
   summarise(
     dept_avg = mean(salary)
   )
 
 employees2 |>
   group_by(department) |>
   mutate(
     avg_salary = mean(salary),
     more_than_avg_salary = salary > avg_salary
   )

 employees2 |>
   group_by(department) |>
   mutate(
     department_sd = sd(salary)
   )

 #multiple grouping
 employees2 |>
   group_by(department, experience) |>
   summarise(
     avg_salary = mean(salary),
     no_of_employees = n()
   )

 tapply(employees2$salary,
        list(employees2$department,employees2$experience),mean)   

 #n_distinct
 employees2 |>
   group_by(department) |>
   summarise(
     unique_experience_levels = n_distinct(experience)
   )
     
 #.groups()
 
 employees2 |>
   group_by(department) |>
   summarise(
     avg_salary = mean(salary)
   )

 employees2 |>
   group_by(department) |>
   summarise(
     avg_salary = mean(salary),
     .groups = "drop"         # "keep","drop_last","keep"
   )

 employees2 |>
   group_by(department) |>
   summarise(
     avg_salary = mean(salary),
     .groups = "drop_last"
   )
 
 
 employees2 |>
   group_by(department) |>
   summarise(
     avg_salary = mean(salary),
     .groups = "rowwise"
   )

 #ungrouping
 
 result <- employees2 |>
   group_by(department) |>
   summarise(
     avg_salary = mean(salary)
   )
result 
 ungroup(result)

 employees2 |>
   group_by(department) |>
   summarise(
     avg_salary = mean(salary),
     .groups = "drop"
   )

 #Exercise
 employees2 |>
   group_by(department) |>
   mutate(
     avg_salary = mean(salary)
   )

 employees2 |>
   group_by(department) |>
   mutate(
     dept_avg = mean(salary),
     above_dept_avg = salary > dept_avg
   )

 employees2 |>
   group_by(department) |>
   summarise(
     no_of_empl = n(),
     avg_salary = mean(salary),
     median_salary = median(salary),
     sd_salary = sd(salary),
     min_salary = min(salary),
     max_salary = max(salary)
   )

 employees2 |>
   group_by(department,experience) |>
   summarise(
     avg_salary = mean(salary)
   )

 employees2 |>
   group_by(department) |>
   summarise(
     distinct_exp = n_distinct(experience)
   )
 
 employees2 |>  # it does not collapse the no of rows keeos the original no of rows
   group_by(department) |>
   mutate(avg_salary = mean(salary))
 
 employees2 |>  #it collapses the no of rows and returns only one rows with statistics that is being required
   group_by(department) |>
   summarise(avg_salary = mean(salary))

 # conditional summaries
 
 #1. Sum(condition)
 
 employees2 |>
   summarise(
     high_salary = sum(salary >= 20000)
   )

 employees2 |>  # it can also be done using filters
   group_by(department) |>
   summarise(
     high_salary = sum(salary >= 60000)
   )
 
 employees2 |>
   group_by(department) |>
   summarise(
     high_pct = mean(salary >= 60000)*100
   )

 # conditional mean
 
 employees2 |>
   summarise(
     avg_salary = mean(salary[experience >= 3])
   )

 df <- data.frame(
   treatment = c("A","A","A","B","B"),
   events = c(TRUE,FALSE,TRUE,FALSE,TRUE)
 ) 

 df |>
   group_by(treatment) |>
   summarise(
     events = sum(events)
   )

 df|>
   group_by(treatment) |>
   summarise(
     n = n(),
     events = sum(events),
     event_rate = mean(events)
   )

 
 # Exercise
 employees2 |>
   summarise(
     n_emp = sum(salary >= 70000)
   )
employees2 |>
  summarise(
    n_emp_pct = mean(salary >= 70000)*100
  )
employees2 |>
  group_by(department) |>
  summarise(
    n_emp = sum(salary >= 70000)
  )

employees2 |>
  group_by(department) |>
  summarise(
    total_emp = n(),
    no_emp = sum(salary >= 70000),
    emp_pct = mean(salary >= 70000)*100
  )

employees2 |>
  summarise(
    avg_salary = mean(salary[experience >=3])
  )

employees2 |>
  group_by(department) |>
  summarise(
    n = n(),
    mean_salary = mean(salary),
    high_salary_count = sum(salary >= 70000),
    high_salary_percentage = mean(salary >= 70000) * 100
  )

#accross

#we usually write

employees2 |>
  group_by(department) |>
  summarise(
    mean_age = mean(age),
    mean_salary = mean(salary),
    mean_experience = mean(experience)
  )
# we could just write

employees2 |>
  group_by(department) |>
  summarise (across(
    c(age,salary,experience),mean
  )) 

#selecting columns using where
employees2 |>
  summarise(
    across(
      where(is.numeric),mean
    )
  )

#with na.em
employees2 |>
  summarise(
    across(
      where(is.numeric),mean,na.rm=T
    )
  )

employees2 |>
  summarise(
    across(
      where(is.numeric), ~mean(.x,na.rm = T)
    )
  )

#multiple functions

employees2 |>
  summarise(
    across(
      where(is.numeric),
      list(
        mean = mean,
        median = median,
        sd = sd
      )
    )
  )

#naming with .names

employees2 |>
  summarise(
    across(
      where(is.numeric),
      mean,
      .names = "mean_{.col}"
    )
  )

employees2 |>
  summarise(
    across(
      where(is.numeric),
      list(mean = mean,
           sd = sd),
      .names = "{.col}_{.fn}"
    )
    
  )


#acroos() inside mutate()
employees2 |>
  mutate(
    across(
      where(is.numeric),
      ~ .x*2
    )
  )

#creating transformed columns

employees2 |>
  mutate(
    across(
      c(salary,experience),
      ~ .x*2,
      .names = "{.col}_double"
    )
    
  )

#across with grouping

employees2 |>
  group_by(department) |>
  summarise(
    across(
      where(is.numeric),
      mean
    )
  )

employees2 |>
  group_by(department) |>
  summarise(
    across(
      where(is.numeric),
      list(mean = mean,
           sd = sd)
    )
  )

#Exercise

employees2 |>
  summarise(
    across(
      c(age,salary,experience),mean
    )
  )

employees2 |>
  summarise(
    across(
      where(is.numeric),
      mean
    )
  )

employees2 |>
  summarise(
    across(
      where(is.numeric),
      list(mean = mean,
           sd = sd)
    )
  )
employees2 |>
  summarise(
    across(
      where(is.numeric),
      mean,
      .names = "mean_{.col}"
    )
  )
employees2 |>
  mutate(
    across(
    c(salary,experience),
    ~ .x*2,
    .names = "{.col}_double"
  ))

employees2 |>
  group_by(department) |>
  summarise(
    across(
      c(age,salary,experience),
      ~ mean(.x,na.rm = TRUE)
    )
  )

employees2 |>
  group_by(department) |>
  summarise(
    across(
      c(age,salary,experience),
      list(mean = mean,
           sd = sd)
    )
  )


#if_any() and if_all()
 #by now we write that

employees2 |>
  filter(age > 25 | experience > 4)


employees2 |>  #if_any() is equivalent to OR
  filter(
    if_any(
      c(age,experience),
      ~ .x > 4
    )
  )


employees2 |>  #if_all() is equivalent to AND
  filter(
    if_all(
      c(age,experience),
      ~ .x > 4
    )
  )

#Exercise

employees2 |>
  filter(
    age > 25 | experience > 4
  )

employees2 |>
  filter(
    age > 25 & experience > 4
  )
employees2 |>
  filter(
    if_any(where(is.numeric), ~ .x > 70000)
  )
 
if_any()  # acts as a OR between conditions 
if_any()  # acts as a AND between conditions

#reframe

# we do

 employees2 |>
   group_by(department) |>
   summarise(
     min_salary = min(salary),
     max_salary = max(salary)
   )

 # top 2 salary within each department
 
 employees2 |>
   group_by(department) |>
   reframe(
     top_2_salary = head(sort(salary,decreasing = T),2)
   )

 # summarise = usually one group = 1 row
 # rephrase = one group = 0,1 or multiple rows
 
 employees2 |>
   group_by(department) |>
   reframe(
     salary = range(salary)
   )

# .by
 
 employees2 |>
   group_by(department) |>
   summarise(
     avg_salary  = mean(salary)
   )

 employees2 |>
   summarise(
     avg_salary = mean(salary),
     .by = department
   )
 
# .by with mutate
 
 employees2 |>
   mutate(
     department_avg = mean(salary),
     .by = department
   )

#by with filter
 employees2 |>
   filter(
     salary > mean(salary),
     .by = department
   )
 
 
# by with multiple variables
 employees2 |>
   summarise(
     avg_salary = mean(salary),
     .by = c(department, experience)
   )
 
 
 # count()
 # we did
 
  employees2 |>
    group_by(department) |>
    summarise(
      count = n()
    )

  # one shortcut is 
  employees2 |>
    count(department)

  employees2 |>
    count(department , experience)

  # weighted count
  employees2 |>
    count(department, wt = salary)
  
  # the above is similar to
  employees2 |>
    group_by(department) |>
    summarise(
      n = sum(salary)
    )

  
  # n_distinct()
  
  employees2 |>
    summarise(
      unique_departments = n_distinct(department)
    )
  length(unique(employees2$department))
  
  
  # distinct
  # in n_distinct we had
  employees2 |>
    summarise(
      n_departments = n_distinct(department)
    )
  
  
  employees2 |>
    distinct(department)

  # Exercise
  employees2 |>
    group_by(department) |>
    reframe(
      salary = range(salary)
    )

  
  employees2 |>
    summarise(
      avg_salary = mean(salary),
      .by = department
    )

  employees2 |>
    mutate(
      dept_avg = mean(salary),
      .by = department
      )

  employees2 |>
    count(department, experience)
  
  employees2 |>
    filter(
      salary > mean(salary),
      .by = department
    )

  employees2 |>
    count(department)
  
  employees2 |>
    count(department)

  employees2 |>
    distinct(department)
  
  
  group_by(department)  # bsically here we create groups that affect the calcuation for 
                        # for further all satistics ie it is kind of a global grouping
  .by = department   # it is kind of a local grouping
  
  
  employees2 |>
    summarise(
      n_emp = n(),
      avg_salary = mean(salary),
      max_salary = max(salary),
      min_salary = min(salary),
      .by = department
    )

  
  #pull
  
  
  employees2 |>
    summarise(
      avg_salary = mean(salary)
    )
# if we specifically want a vector rather than a tibble
  
  employees2 |>
    summarise(
      avg_salary = mean(salary)
    ) |>
    pull(avg_salary)
  