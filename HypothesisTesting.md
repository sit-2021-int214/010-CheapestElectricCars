## Analytical Inferential Statistics :beer:
Electronic Car Company has a total of 180 electric cars. The average of top speed 180 cars is 176.40 km/hr. 
Using the critical value approach, test to determine if Mercedes speed less than average top speed  (Let a =  0.05)
At 95% confidence, Compute interval estimateion of pop mean.

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