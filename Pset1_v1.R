mydata = read.csv("/Users/rupertli/Desktop/Rupert Li MIT Freshman MacBook Storage Folder/MIT/Freshman Fall/14.30/Problem Sets/grade_retention_1430.csv")
#What percentage of the children were held back in kindergarten?
#What percentage were held back in elementary school (1st-4th grade)?
#What percentage were not held back?
#What percentage were held back both in kindergarten and elementary?
hbk = 0
hbe = 0
nhb = 0
hbke = 0
n = length(mydata[[1]])
for(i in 1:n)
{
  if (mydata[[1]][i])
  {
    hbk = hbk+1
  }
  if (mydata[[2]][i])
  {
    hbe = hbe+1
  }
  if (!mydata[[1]][i] & !mydata[[2]][i])
  {
    nhb = nhb+1
  }
  if (mydata[[1]][i] & mydata[[2]][i])
  {
    hbke = hbke+1
  }
}
sprintf("Percentage held back in kindergarten: %f", 100*hbk/n)
sprintf("Percentage held back in kindergarten: %f", 100*sum(mydata$retained_kindergarten==1)/n)
sprintf("Percentage held back in elementary: %f", 100*hbe/n)
sprintf("Percentage held back in elementary: %f", 100*sum(mydata$retained_elementary==1)/n)
sprintf("Percentage not held back: %f", 100*nhb/n)
sprintf("Percentage not held back: %f", 100*sum((mydata$retained_elementary==0)&(mydata$retained_kindergarten==0))/n)
sprintf("Percentage held back both: %f", 100*hbke/n)
sprintf("Percentage held back both: %f", 100*sum((mydata$retained_elementary==1)&(mydata$retained_kindergarten==1))/n)

require(ggplot2)

qplot(mydata$age_11_reading_score[mydata$retained_kindergarten==1], geom="histogram")
qplot(mydata$age_11_reading_score[mydata$retained_elementary==1], geom="histogram")
