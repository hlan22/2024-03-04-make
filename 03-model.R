library(readr)
library(docopt)

"
Usage: 03-model.R --file_path=<file_path> --output_path=<output_path>
" -> doc

opt <- docopt(doc)

data <- read_csv(opt$file_path)

# model

model <- glm(survived ~ as.factor(pclass) + sex + age + fare, 
             data = data, 
             family = "binomial")

summary(model)

write_rds(model, opt$output_path) # rds = R data

# To run the script: type: 
# Rscript 03-model.R --file_path=data/clean/titanic_clean.csv --output_path=output/model.RDS

