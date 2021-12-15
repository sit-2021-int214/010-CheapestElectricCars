#Electornic Car Company has  a total of 180 electric cars. The average of top speed 180 cars is 176.40 km/h.
#A sample of cars is Mercedes thatt have ana average top speed is 173.33 km/hr. The standard deviation of the population is known to  b e 21.79
#a. State the null and alternativce hypotheses
#b. Using the critical v alue apporach, test the hypotheses at the 5% level of significance.
#   Using the p-value approach, test the hypotheses at the 5% level of significance.
#c. At 95% confidence, Compute intercal estimatetion of pop mean

library("dplyr")
library("readr")
library("stringr")

vehicle <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/010-CheapestElectricCars/main/cheapestElectricCars(Clean).csv");

mercedes <- vehicle %>% filter(str_detect(Name,"Mercedes"))

n <- count(vehicle) %>% as.numeric()
print(n)
alpha <- 0.05
print(alpha)
mean <- mean(mercedes$TopSpeed.km.h.)
print(mean)
sd <- sd(mercedes$TopSpeed.km.h.)
print(sd)
mue0 <- mean(vehicle$TopSpeed.km.h.)
print(mue0)

t <- (mean-mue0)/(sd/(sqrt(n)))
print(t)

pvalue <- pt(t, n-1 ,lower.tail = FALSE)
print(pvalue)

tcrit <- qt(1-alpha, n-1)
print(tcrit)

if(pvalue <= alpha){
  print("Reject H0")
}else{
  print("Not Reject H0")
}

if(t >= tcrit){
  print("Reject H0")
}else{
  print("Not Reject H0")
}
