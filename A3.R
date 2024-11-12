# PatientID <- c(1,2,3,4)
# AdmDate <- as.Date(c("10/15/2009","11/01/2009","10/21/2009","10/28/2009"),format ="%m/%d/%Y")
# Age <- c(25,34,28,52)
# Diabetes <- c("Type1","Type2","Type1","Type1")
# Status <- c("Poor","improved","Excellent","Poor")
# DF <- data.frame(PatientID,AdmDate,Age,Diabetes,Status)

#Q1) Create an array A with elements (12, 13, 14, 15, 16) and display them.
A <- c(12,13,14,15,16)

#Q2) Find the sum of all the elements of A.
sum(A)

#Q3) Find the product of all the element of A.
prod(A)

#Q4) Find the maximum and minimum element of A.
max(A)
min(A)

#Q5) Find the range of array A.
range(A)

#Q6)Find the mean, variance, standard deviation and median of value of A.
mean(A)
var(A)
sd(A)
median(A)

#Q7) Sort the element of A both in increasing and decreasing order and store them in B and C.
B <- sort(A)
C <- sort(A, decreasing=TRUE)

#Q8) Create a matrix of 3x4 to have the set of natural numbers.
X <- matrix(1:12, nr=3, nc=4)

#Q9) Create MxN matrix by combining A, B and C row-wise (RW) and column-wise(CW).
M1 <- cbind(A,B,C,deparse.level = 2)
M2 <- rbind(A,B,C)

#Q10) Find the 2 and 3 row element of RW.
M2[2,]
M2[3,]

#Q11) Find the 1 and 4 column of CW.
M1[,1]
M1[,4]
