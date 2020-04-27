
library(tidyverse)

### Reshaping and groping sales ########################################################################################

sales_longer <- sales_train_validation %>%
  pivot_longer(cols = starts_with('d_'), names_to = 'day', values_to = 'sales') 
  
sales_states <- sales_longer %>% 
  group_by(state_id, day) %>% 
  summarise(sales_states = sum(sales)) %>% 
  pivot_wider(names_from = 'state_id', values_from = 'sales_states')

sales_stores <- sales_longer %>% 
  group_by(store_id, day) %>% 
  summarise(store_states = sum(sales)) %>% 
  pivot_wider(names_from = 'store_id', values_from = 'store_states')

sales_categories <- sales_longer %>%
  group_by(cat_id, day) %>% 
  summarise(cat_sales = sum(sales)) %>% 
  pivot_wider(names_from = 'cat_id', values_from = 'cat_sales')

sales_depts <- sales_longer %>%
  group_by(dept_id, day) %>% 
  summarise(dept_sales = sum(sales)) %>%
  pivot_wider(names_from = 'dept_id', values_from = 'dept_sales')

sales_items <- sales_longer %>%
  group_by(item_id, day) %>% 
  summarise(item_sales = sum(sales)) %>%
  pivot_wider(names_from = 'item_id', values_from = 'item_sales')

sales_merged <- sales_states %>% 
  inner_join(sales_stores) %>% 
  inner_join(sales_categories) %>% 
  inner_join(sales_depts) %>% 
  inner_join(sales_items)


sales_ids <- sales_train_validation %>% 
  select(-ends_with('_id')) %>% 
  pivot_longer(cols = starts_with('d_'), names_to = 'day', values_to = 'sales') %>% 
  pivot_wider(names_from = 'id', values_from = 'sales')

saless_all <- sales_merged %>% 
  inner_join(sales_ids)
  
