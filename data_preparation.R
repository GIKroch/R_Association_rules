library(foreign)
library(dplyr)
library(tidyr)
library(arules)
setwd("C:/Users/user/Desktop/studia/Data Science/unsupervised learnin/association_rule_project")
df <- read.dta("ESS8e02.dta")
df1 <- data.frame(country = df$cntry, gender = df$gndr, pplfair = df$pplfair,
                  gincdif = df$gincdif, happy = df$happy, sclmeet = df$sclmeet,
                  inprdsc = df$inprdsc, sclat = df$sclact, rlgbg = df$rlgblg, 
                  dfincac = df$dfincac, sblazy = df$sblazy, eduyrs = df$eduyrs,
                  imprich = df$imprich, iprspot = df$iprspot, impfun = df$impfun)

##Wrangling data

###from data removing no answer, don't know, refusal
df1 <- df1 %>% filter(pplfair != "Refusal") %>% filter(pplfair != "Don't know") %>%  filter(pplfair != "No answer")

df1 <- df1 %>% filter(gincdif != "Refusal") %>% filter(gincdif != "Don't know") %>%  filter(gincdif != "No answer")

df1 <- df1 %>% filter(happy != "Refusal") %>% filter(happy != "Don't know") %>%  filter(happy != "No answer")

df1 <- df1 %>% filter(sclmeet != "Refusal") %>% filter(sclmeet != "Don't know") %>%  filter(sclmeet != "No answer")

df1 <- df1 %>% filter(inprdsc != "Refusal") %>% filter(inprdsc != "Don't know") %>%  filter(inprdsc != "No answer")

df1 <- df1 %>% filter(sclat != "Refusal") %>% filter(sclat != "Don't know") %>%  filter(sclat != "No answer")

df1 <- df1 %>% filter(rlgbg != "Refusal") %>% filter(rlgbg != "Don't know") %>%  filter(rlgbg != "No answer")

df1 <- df1 %>% filter(dfincac != "Refusal") %>% filter(dfincac != "Don't know") %>%  filter(dfincac != "No answer")

df1 <- df1 %>% filter(sblazy != "Refusal") %>% filter(sblazy != "Don't know") %>%  filter(sblazy != "No answer")

df1 <- df1 %>% filter(eduyrs != "Refusal") %>% filter(eduyrs != "Don't know") %>%  filter(eduyrs != "No answer")

df1 <- df1 %>% filter(imprich != "Refusal") %>% filter(imprich != "Don't know") %>%  filter(imprich != "No answer")

df1 <- df1 %>% filter(iprspot != "Refusal") %>% filter(iprspot != "Don't know") %>%  filter(iprspot != "No answer")

df1 <- df1 %>% filter(impfun != "Refusal") %>% filter(impfun != "Don't know") %>%  filter(impfun != "No answer")


#### Part of data wranling done in Python



final1 <- read.csv("modified.csv")
final1 <- sample_n(final1,5000)

quantile(final1$consumption)
final1$consumption <- ifelse(final1$consumption <= 8, 1, 
                            ifelse(final1$consumption > 8 & 
                                   final1$consumption <= 10, 2, 
                                   ifelse(final1$consumption > 10 & 
                                            final1$consumption <= 12, 3, 4)))
final1$Type <- NULL

for (i in colnames(final1)){
  final1[,i] <- paste(i,":",final1[,i])  
}
