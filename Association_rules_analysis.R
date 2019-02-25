library(arules)
library(foreign)
write.table(final1, "final1.csv", row.names = F, col.names = F, sep = ",")


### Association rules
trans1 <- read.transactions("final1.csv", format = "basket", sep = ",")
ctable <- crossTable(trans1)


rules.trans1<-apriori(trans1, parameter=list(supp=0.1, conf=0.5)) 

rules.by.conf<-sort(rules.trans1, by="confidence", decreasing=TRUE) 
inspect(head(rules.by.conf))

rules.by.lift<-sort(rules.trans1, by="lift", decreasing=TRUE) 
inspect(head(rules.by.lift))

rules.by.count<- sort(rules.trans1, by="count", decreasing=TRUE) 
inspect(head(rules.by.count))

rules.by.supp<-sort(rules.trans1, by="support", decreasing=TRUE) 
inspect(head(rules.by.supp))


rules.consumption_1<-apriori(data=trans1, parameter=list(supp=0.05,conf = 0.4), 
                             appearance=list(default="lhs",rhs="consumption : 1"), control=list(verbose=F)) 
inspect(rules.consumption_1)


rules.consumption_2<-apriori(data=trans1, parameter=list(supp=0.1,conf = 0.8), 
                             appearance=list(default="lhs",rhs="consumption : 2"), control=list(verbose=F)) 
inspect(rules.consumption_2)


rules.consumption_3<-apriori(data=trans1, parameter=list(supp=0.34,conf = 0.7), 
                             appearance=list(default="lhs",rhs="consumption : 3"), control=list(verbose=F)) 
inspect(rules.consumption_3)


rules.consumption_4<-apriori(data=trans1, parameter=list(supp=0.1,conf = 0.7), 
                             appearance=list(default="lhs",rhs="consumption : 4"), control=list(verbose=F)) 
inspect(rules.consumption_4)
