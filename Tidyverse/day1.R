library(tidyverse)

employees_tbl <-tibble(
  name = c("A","B","C"),
  age = c(23,25,22),
  salary = c(55000,62000,58000)
)

employees_tbl

# tibble vs dataframe

employees <- data.frame(
  name = c("A","B","C"),
  age = c(23,25,22)
)

class(employees)
class(employees_tbl)

# glimpse()
glimpse(employees_tbl)

#as_tibble()

employees_tbl <- as_tibble(employees)
class(employees_tbl)

# tribble()

employees_tbl <- tribble(
  ~name, ~age, ~department,
   "A",  23,   "Statistics",
   "B",  25,   "HEOR",
   "C",  22,   "Programming"
)

employees_tbl

x <- c(10,20,30,40,50,60)
x %>%
   mean()

x %>%
  mean() %>%
  round(1)

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

# in base R
df <-employees2[order(employees2$salary),c("name","salary")]
df

df[df$salary > 60000,]

# In tidyverse

employees2 %>%
  filter(salary > 60000)%>%
  arrange(salary) %>%
  select(name,salary) %>%
  view()

# dplyr # wecan load library(dplyr) but we will work with entire 
# tidyverse so we just need library(tidyverse)         

# 1. filter()

subset(employees2,salary > 60000)

employees2 %>%
  filter(salary > 60000)
# multiple conditions

employees2 %>%
  filter(
    salary > 60000,
    experience >=3
  )
#or 
employees2 %>%
  filter(salary > 60000 & experience >= 3)

employees2 %>%
  filter(
    department == 'HEOR' |
    department == "Statistics"
  )

employees2 %>%
  filter(department %in% c("Statistics","HEOR"))


df <- tibble(
  name = c("A", "B", "C"),
  salary = c(50000, NA, 70000)
)
df %>%
  filter(salary > 60000)
filter(employees2,salary > 60000)

df %>%
  filter(!is.na(salary),salary > 60000)

#1

filter(employees2,salary > 60000)

employees2 %>%
  filter(salary > 60000)


#2

filter(employees2 , experience >= 3 & salary >= 70000)

employees2 %>%
  filter(experience >= 3 & salary >= 70000)

#3

filter(employees2, department == "Statistics" | department =="HEOR")

employees2 %>%
  filter(department %in% c("Statistics","HEOR"))

#4

filter(employees2, salary >= 60000 & salary <= 75000)

employees2 %>%
  filter(salary >= 60000 & salary <= 75000)

#5

filter(employees2, department != "Statistics")

employees2 %>%
  filter(department != 'Statistics')

#6
employees2 %>%
  filter( salary >= 60000) %>%
  filter(experience >= 3)

#7
employees2 %>%
  filter(salary > 60000)  # this pipes the dataframe throug pipe operator and filter knows 
 # on which dataframe the filter needs to be applied

filter(employees2, salary > 60000)  # here we need to provide the dataframe to the filter() function


#2. select()

employees2 %>%
  select(name,salary)  # selects columns

employees2 %>%
  select(name,age,department,salary)

employees2 |>
  select(-age)

employees2 |>
  select(-age,-experience)

employees2 |>
  select(-c(age,experience))

employees2 |>
  select(age:salary)

employees2 |>
  select(name, age:salary)

employees2 |>
  select(salary,everything())

employees2 |>
  select(starts_with("sal"))

employees2 |>
  select(ends_with("ry"))

employees2 |>
  select(contains("exp"))

employees2 |>
  select(matches("salary|experience"))

df <- tibble(
  score1 = c(80, 90),
  score2 = c(85, 95),
  score3 = c(88, 92),
  name = c("A", "B")
)

df |>
select(num_range("score",1:3))

employees2 |>
  select(where(is.numeric))

employees2 |>
  select(where(is.character))
         
employees2 |>
  select(name,where(is.numeric))

# relocate
employees2 |>
  relocate(salary)

employees2 |>
  relocate(salary, .after = name)

employees2 |>
  relocate(salary, .before = age)

#rename
employees2 |>  # new name = old name
  rename(
    employee_name = name,
    annual_salary = salary
     )


employees2

employees2 |>
  filter(salary > 60000) |>
  select(name, department, salary)

employees2 |>   # this would still work because salary is still present
  select(name, department, salary) |>
  filter(salary > 60000)

#exercise

#1 
employees2 |>
  select(name,salary)

employees2 |>
  select(name,department,experience)

employees2 |>
  select(-age)

employees2 |>
  select(-c(age,experience))

employees2 |>
  select(age:salary)

employees2 |>
  select(salary,everything())
employees2 |>
  select(contains("exp"))
employees2 |>
  select(where(is.numeric))

employees2 |>
  rename(
    employee_name = name,
    annual_salary = salary
  )

employees2 |>
  filter(salary >= 65000 & experience >= 3) |>
  select(name, department, salary)

employees2 |>    # this works bcz salary column is still there in the dataframe
  select(name, salary) |>
  filter(salary > 60000)

employees2 |>   # this does not work bcz salary column has not been selected and then u are filtering on salary column
  select(name, department) |>
  filter(salary > 60000)


#3. arrange()

employees2[order(employees2$salary),]

employees2 |>
  arrange(salary)

employees2 |>
  arrange(desc(salary))

employees2 |>
  arrange(department,desc(salary))

employees2 |>
  arrange(desc(department),
  salary)

employees2 |>
  arrange(department,desc(salary))

employees2 |>
  arrange(name)

employees2 |>
  arrange(department)

employees2 |>
  arrange(desc(department))


df <- tibble(
  name = c("A", "B", "C", "D"),
  salary = c(50000, NA, 70000, 60000)
)

df|>  #NA values are placed at the end
  arrange(salary)

employees_sorted <- employees2 |>
  arrange(desc(salary))
employees_sorted

employees2 |>
  filter(salary > 60000) |>
  arrange(desc(salary)) |>
  select(name,department,salary)

# group_by()

employees2 |>   # arrange will not necessarilly sort separately within each group
  group_by(department) |>
  arrange(desc(salary))


employees2 |>
  group_by(department) |>
  arrange(desc(salary), .by_group = TRUE)

#practicse

employees2 |>
  arrange(salary)

employees2 |>
  arrange(desc(salary))

employees2 |>
  arrange(desc(experience),salary)

employees2 |>
  arrange(department, desc(salary))


employees2 |>
  filter(salary >= 60000) |>
  arrange(desc(salary))

employees2 |>
  select(name,department,salary) |>
  filter(salary >= 60000) |>
  arrange(desc(salary))


employees2 |>
  arrange(desc(salary)) |>
  select(name, salary)

employees2 |>
  select(name, salary) |>
  arrange(desc(salary))
# these produce the same result bcz salarycolumn is being selected in both cases

employees2 |>
  filter(experience >=3)|>
  select(name ,department, salary , experience) |>
  arrange(desc(salary))

# mutate()

employees2$bonus <- employees2$salary*0.1
employees2

employees2$bonus <- NULL
employees2 |>
  mutate(bonus = salary*0.1)

employees_with_bonus <- employees2 |>
  mutate(bonus = salary*0.1)
employees_with_bonus

employees2 |>
  mutate(bonus = salary*0.1,
         total_compensation = salary + bonus)

#modifying a existing column
employees2 |>
  mutate(salary = salary*1.1)

employees2 |>
  mutate(
    monthly_salary = salary/12,
    salary_thousands = salary/100,
    experience_months = experience*12
  )

employees2 |>
  mutate(
    experience_level = if_else(experience >=3 , "Experienced","Junior"))


#case when()

employees2 |>
  mutate(
    salary_level = if_else(
      salary >= 75000,"High",
      if_else(salary >= 60000,"Medium","Low")
    )
  )


employees2 |>      # orders matters in case when
  mutate(salary_level = case_when(
    salary >= 75000 ~ "High",
    salary >= 60000 ~ "Medium",
    TRUE ~ "Low"  #default
  ))

salary = c(50000, NA, 70000)

case_when(
  salary >= 70000 ~ "High",
  salary >= 60000 ~ "Medium",
  TRUE ~ "Low"
)

case_when(
  is.na(salary) ~ NA_character_,
  salary >= 70000 ~ "High",
  salary >= 60000 ~ "Medium",
  TRUE ~ "Low"
)

 employees2 |>
   mutate(high_salary = salary > 70000)

 employees2 |>
   mutate(
     annual_bonus = salary*0.1,
     monthly_salary = salary/12,
     salary_per_year_experience = salary/experience
   )

 employees2 |>
   mutate(annual_bonus = salary*0.1,
          total_compensation = salary + annual_bonus) |>
   filter(total_compensation >= 75000)

 
 employees2 |>
   mutate(bonus = salary*0.1) |>
   arrange(desc(bonus))

 employees2 |>
   mutate(bonus = salary*0.1)|>
   select(name,salary,bonus)

 employees2 |>   #all,used,unused,none  these options are available here
   mutate(
     bonus = salary*0.1,
     .keep = "used"
   )
 
 employees2 |>  #Unlike mutate(), it keeps only the variables you explicitly create/select.
   transmute(name,bonus = salary*0.1)
 
 
 #excercise
 
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
   mutate(bonus = salary*0.1)

 employees2 |>
   mutate(monthly_salary = salary/12)

 employees2 |>
   mutate(bonus = salary*0.1,
          total_salary = salary + bonus)

 employees2 |>
   mutate(experience_level = ifelse(experience >= 3,'Experienced',
                 "junior"))

 employees2 |>
   mutate(salary_level = case_when(
     salary >= 75000 ~ "High",
     salary >= 60000 ~ "Medium",
     TRUE ~ "Low"
   ))

 employees2 |>
   mutate(high_salary = salary >= 70000)

 employees2 |>
   mutate(bonus = salary*0.1) |>
   filter(bonus >= 7000) |>
   select(name,salary,bonus)

 employees2 |>
   mutate(
     salary_level = case_when(
       salary >= 75000 ~"High",
       salary >= 60000 ~ "Medium",
       TRUE ~ "Low"
     ),
     experience_level = if_else(
       experience >= 3,"Experienced","Junior"
     )
   ) |>
   select(name,department,salary,
          salary_level,experience_level)
 
 
 employees2 |>  # here we are creating a new column bonus
   mutate(
     bonus = salary * 0.10
   )

 employees2 |>  # here we are editing the already existing column
   mutate(
     salary = salary * 1.10
   )
 
 #advanced pipeline
 
 employees2 |>
   mutate(
     bonus = salary*0.1,
     salary_level = case_when(
       salary >= 75000 ~ "High",
       salary >= 60000 ~ "Medium",
       TRUE ~ "Low"
     )
   ) |>
   filter(
     experience >=3
   ) |>
   arrange(desc(bonus)) |>
   select(name,department,salary,experience,bonus,salary_level)
 
 
 employees2 |>
   mutate(
     bonus = salary * 0.10,
     total = salary + bonus
   )
 
 employees2 |>
   mutate(
     bonus = salary * 0.10,
     total = salary + bonus,
     tax = total * 0.10,
     after_tax = total - tax
   )
 