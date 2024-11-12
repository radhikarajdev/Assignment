# Q1)  Assign and print the values 23.4, 45 and 678 to the variables A, B, C.
A <- 23.4
B <- 45
C <- 678
print(A)
print(B)
print(C)

# Q2) Display the entire variable you have created on the screen.
ls()

#Q3) Remove the variable C and display the list.
rm(C)
ls()

#Q4) Create a comment “I am learning R”
#I am learning R

#Q5) Create strings firstname and lastname as “MyName” and “MySurname”
fistname <- "MyName"
lastname <- "MySurname"

#Q6) Create the variable that can hold a value as 0 or 1.
a<-c(0,1)
print(a)

#Q7) Perform the operation as +, -, * and / on variables A, B, C together.
print(A+B+C)
print(A*B*C)
print(C-A-B)
print(C/B/A)

#Q8) Apply the following functions on some values:
#Exp(), log(), log10(), log2(), pi, sqrt()
exp(2)
log(2)
log10(10)
log2(2)
pi
sqrt(100)

#Q9) Write the statement to solve the following expressions:
#1. 23 + (4.5 * 2.3) / 10 
print(23+(4.5*2.3)/10)
#2. 456 / 12 – log(90)
print(456/12-log(90))
#3. Exp(5) + 12 / (5 ^ 6)
print(exp(5)+12/(5^6))
#4. √45 * 12/3
print(sqrt(45)*12/3)