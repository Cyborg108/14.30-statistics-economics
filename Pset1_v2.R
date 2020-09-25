mydata = read.csv("/Users/rupertli/Desktop/Rupert Li MIT Freshman MacBook Storage Folder/MIT/Freshman Fall/14.30/Problem Sets/grade_retention_1430.csv")

# Part (a)
n = length(mydata[[1]])
sprintf("Percentage held back in kindergarten: %f", 100*sum(mydata$retained_kindergarten==1)/n)
sprintf("Percentage held back in elementary: %f", 100*sum(mydata$retained_elementary==1)/n)
sprintf("Percentage not held back: %f", 100*sum((mydata$retained_elementary==0)&(mydata$retained_kindergarten==0))/n)
sprintf("Percentage held back both: %f", 100*sum((mydata$retained_elementary==1)&(mydata$retained_kindergarten==1))/n)

# Part (b)
require(ggplot2)
qplot(mydata$age_11_reading_score[mydata$retained_kindergarten==1],
      geom="histogram",binwidth=0.1)
qplot(mydata$age_11_reading_score[mydata$retained_elementary==1],
      geom="histogram",binwidth=0.1)
qplot(mydata$age_11_reading_score[(mydata$retained_kindergarten==0)&(mydata$retained_elementary==0)],
      geom="histogram", binwidth=0.1)

# Part (c)
qplot(mydata$kingergarten_cognitive_score[mydata$retained_kindergarten==1],
      geom="histogram",binwidth=0.1)
qplot(mydata$kingergarten_cognitive_score[mydata$retained_elementary==1],
      geom="histogram",binwidth=0.1)
qplot(mydata$kingergarten_cognitive_score[(mydata$retained_kindergarten==0)&(mydata$retained_elementary==0)],
      geom="histogram",binwidth=0.1)
