## Analytical Inferential Statistics :beer:
Electronic Car Company has a total of 180 electric cars. The average of top speed 180 cars is 176.40 km/hr. 
Using the critical value approach, test to determine if Mercedes speed less than average top speed  (Let a =  0.05)
At 95% confidence, Compute interval estimateion of pop mean.

### หา SD ค่าของ top speed ของรถยี่ห้อ mercedes

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
n <- 180
µ <- 
mean <-  
sd <- 

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


```

### Step 4: Finding P-value approach or Critical Value approach

```
# P-value approach


# Critical Value approach

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
if(z<=-zalpha){
  print("Reject H0")
}else{
  print("Accept H0")
}
```

### Step 6: Conclusion
The conclusion is Reject Ho
That's mean Mecedes speed is more than average top speed.
