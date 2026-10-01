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