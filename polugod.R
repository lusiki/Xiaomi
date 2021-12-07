










huawei <- read_excel("C:/Users/Lukas/OneDrive/Desktop/MIrela/Huawei.xlsx")  %>%
  mutate(Date = as.Date(DATE, format = "%Y-%m-%d")) %>%
  select(title = TITLE, text = MENTION_SNIPPET, Date, source = FROM, url = URL, keyword = FOUND_KEYWORDS, -Keyword) 


samsung <- read_excel("C:/Users/Lukas/OneDrive/Desktop/MIrela/Samsung.xlsx")  %>%
  mutate(Date = as.Date(DATE, format = "%Y-%m-%d")) %>%
  select(title = TITLE, text = MENTION_SNIPPET, Date, source = FROM, url = URL, keyword = FOUND_KEYWORDS)
xiaomi <- read_excel("C:/Users/Lukas/OneDrive/Desktop/MIrela/Xiaomi.xlsx")  %>%
  mutate(Date = as.Date(DATE, format = "%Y-%m-%d")) %>%
  select(title = TITLE, text = MENTION_SNIPPET, Date, source = FROM, url = URL, keyword = FOUND_KEYWORDS)

toolkit <- rbind.data.frame(huawei, samsung, xiaomi) %>% 
  mutate(tool = "toolkit")


p7 <- read_excel("C:/Users/Lukas/OneDrive/Desktop/MIrela/p7.xlsx") %>%
  select (-1) %>%
  mutate(Date = substr(Date,1,10)) %>%
  mutate(Date = as.Date(Date, format = "%Y-%m-%d"))%>% 
  select(-c(type, impressions,engagements, author))



p8 <- read_excel("C:/Users/Lukas/OneDrive/Desktop/MIrela/p8.xlsx")%>%
  select (-1) %>%
  mutate(Date = substr(Date,1,10)) %>%
  mutate(Date = as.Date(Date, format = "%Y-%m-%d"))%>% 
  select(-c(type, impressions,engagements, author))

p9 <- read_excel("C:/Users/Lukas/OneDrive/Desktop/MIrela/p9.xlsx")%>%
  select (-1) %>%
  mutate(Date = substr(Date,1,10)) %>%
  mutate(Date = as.Date(Date, format = "%Y-%m-%d"))%>% 
  select(-c(type, impressions,engagements, author))

p10 <- read_excel("C:/Users/Lukas/OneDrive/Desktop/MIrela/p10.xlsx")%>%
  select (-1) %>%
  mutate(Date = substr(Date,1,10)) %>%
  mutate(Date = as.Date(Date, format = "%Y-%m-%d"))%>% 
  select(-c(type, impressions,engagements, author))


metrikom <- rbind.data.frame(p7,p8,p9,p10) 


 metrikom <- metrikom %>% 
  mutate(keyword =case_when( grepl("xiaomi", text, ignore.case = TRUE) ~ "xiaomi",
         grepl("huawei", text, ignore.case = TRUE) ~"huawei",
         grepl("samsung", text, ignore.case = TRUE) ~"samsung")) %>%
   mutate(tool = "metrikom")
 
metriTOOLKIT <- rbind.data.frame(metrikom,toolkit ) %>% 
  arrange(-Date)
 
 
 
 
 
 
 
 
 