library(readr)

data <- readr::read_csv("data/titanic_clean.csv")

# model

model <- glm(survived ~ as.factor(pclass) + sex + age + fare, 
             data = data, 
             family = "binomial")

summary(model)

write_rds(model, "output/model.RDS") # rds = R data
