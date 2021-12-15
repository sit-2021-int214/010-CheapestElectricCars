## Analytical Inferential Statistics 
#### δ unknown
Electronic Car Company has a total of 180 electric cars. The average of top speed 180 cars is 176.40 km/hr. 
Using the critical value approach, test to determine if Mercedes speed less than average top speed  (Let a =  0.05)
At 95% confidence, Compute interval estimateion of pop mean.

### หาค่า SD ของ top speed ของรถยี่ห้อ mercedes

| MERCEDES | TOP SPEED(km/h) |
|:---:|--------------------------|
| Mercedes EQA 250    | 160 |
| Mercedes EQA 300 4MATIC  | 160 |
|  Mercedes EQA 350 4MATIC  | 160 | 
|  Mercedes EQB 350 4MATIC  | 160  |
|  Mercedes EQC 400 4MATIC  | 180  |
|  Mercedes EQS 450+  | 210  |
|  Mercedes EQS 580 4MATIC  | 210  |
|  Mercedes EQV 300 Extra-Long | 160  |
|  Mercedes EQV 300 Long  | 160  |
| sd | 21.79  |


### Step 0: Assign variables

```
mercedes <- vehicle %>% filter(str_detect(Name,"Mercedes"))

n <- count(vehicle) %>% as.numeric()
#180

alpha <- 0.05

mean <- mean(mercedes$TopSpeed.km.h.)
# 173.33

sd <- sd(mercedes$TopSpeed.km.h.)
#21.79

mue0 <- mean(vehicle$TopSpeed.km.h.)
#176.4

```

### Step 1: State the hypothesis

```
Ho : µ <= 176.40
Ha : µ > 176.40
```

### Step 2: Level of significance

```
alpha <- 0.05
```

### Step 3: Test statistic

```
t <- (mean-mue0)/(sd/(sqrt(n)))
#-1.887
```

### Step 4: Finding P-value approach or Critical Value approach

```
# P-value approach


# Critical Value approach
tcrit <- qt(1-alpha, n-1)
#1.653

```

### Step 5: Compare

```
# Using p-value approach
if(pvalue<=alpha){
  print("Reject H0")
}else{
  print("Accept H0")
}

# Using critical value
if(t >= tcrit){
  print("Reject H0")
}else{
  print("Accept H0")
}
```

### Step 6: Conclusion
The conclusion is Reject Ho
That's mean Mecedes speed is more than average top speed.
