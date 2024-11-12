data(mtcars)
mtcars_cy1_greater_than_5 <- mtcars[mtcars$cyl >= 5,]
print(mtcars_cy1_greater_than_5)
mtcars_first_10 <- head(mtcars,10)
print(mtcars_first_10)


#Q1)
DF <- data.frame(
  PatientID = 1:4,
  AdmDate = c("10/15/2009","11/01/2009","10/21/2009","10/28/2009"),
  Age = c(25,34,28,52),
  Diabetes = c("Type1","Type2","Type1","Type1"),
  Status = c("Poor","Improved","Excellent","Poor")
)

#Q2)
ans1 <- DF[,c(1,3)]
print(ans1)
ans2 <- DF[DF$Diabetes == "Type1",]
ans2 <- DF[grepl("Type1",DF$Diabetes),]
print(ans2)
ans3 <- nrow(DF[grepl("Poor",DF$Status,ignore.case = T),])
ans3 <- nrow(DF[DF$Status=="Poor",])
print(ans3)
print(summary(DF))
mean(DF$Age[DF$Diabetes=="Type1"])
DF[,c(1,3)]
DF[DF$Diabetes=="Type1",]
nrow(DF[DF$Status=="Poor",])
summary(DF)
mean(DF$Age[DF$Diabetes == "Type1"])
x <- list(
  PatientID = nrow(DF)+1,
  AdmDate = "10/15/2009",
  Age = 25,
  Diabetes = "Type1",
  Status = "Poor"
)
DF <- rbind(DF,x)
DF




#Q3)
MyList <- list(
  title = "My First List",
  criteria = list(
    a = c(12,14,16,20),
    mat = matrix(1:10,nrow = 5),
    score = c('First','Second','Third')
  )
)
print(MyList)
print(MyList$criteria)
print(MyList$criteria$a)




# Create the components
a <- c(12, 14, 16, 20)

# Create a matrix with 5 rows (for simplicity, we use 3 columns)
matrix_data <- matrix(1:15, nrow = 5, ncol = 3)

# Create a vector for scores
s <- c("First", "Second", "Third")

# Create the criteria list
criteria <- list(
  Age = a,
  Matrix = matrix_data,
  Score = s
)

# Create the MyList with a title and criteria
MyList <- list(
  Title = "My First List",
  Criteria = criteria
)

# Print MyList
print(MyList)

# Print the criteria component of MyList
print(MyList$Criteria)

# Print vector a
print(a)



as.numeric(c("7", "7*", "2-3i", "7.9"))
gender <- c(2, 1, 1, 2, 0, 1, 1)
recode <- c(male = 1, female = 2)
print(recode)
gender <- factor(gender, levels = recode, labels = names(recode), ordered = T)
print(gender)
gender <- c("M", "male ", "Female", "fere", "Mme")
print(grepl("m", gender))
xc <- c('a' = 5, 'b' = 6, 'c' = 7, 'd' = 8)
print(xc)
sapply(c("b","ba"),function(x)length(gregexpr(x,"babab")[[1]]))