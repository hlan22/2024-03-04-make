# analysis file

# load data
data <- read_csv("data/titanic.csv")

# clean data
data <- janitor::clean_names(data)

data

# eda

ggplot(data = data, aes(x=pclass, fill = as.factor(survived))) +
  geom_bar() +
  ggtitle("titanic")

ggplot(data, aes(x=survived))+
  geom_bar()

# model
model <- glm(survived ~ as.factor(pClass) + sex + age + fare, 
             data = data)
summary(model)

# results
coef <- broom::tidy(model)

coef

# process results

coef <- coef |>
  dplyr::mutate(or = exp(estimate))

coef

# plot results

ggplot(coef |> dplyr::filter(term != "(Intercept)"),
       aes(x = term, y = or)) +
  geom_point() +
  coord_flip() +
  geom_hline(yintercept = 1)








