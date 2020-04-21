
### CONVERTING CSVs to DATA.FRAMEs #####################################################################################

calendar <- read.csv(file = 'data/raw_data/calendar.csv')
sell_prices <- read.csv(file = 'data/raw_data/sell_prices.csv')
sales_train_validation <- read.csv(file = 'data/raw_data/sales_train_validation.csv')
sample_submission <- read.csv(file = 'data/raw_data/sample_submission.csv')

save(calendar, sell_prices, sales_train_validation, sample_submission, file = 'data/001_raw_data.RData')

