#Q1)
a <- seq(from = 1.3 , to = 4.9 , by = 0.3)
b <- rep(1:4,5)
b <- rep(seq(from=1 , to=4 , by=1) , times=5)
c <- seq(from=14 , to=0 , by=-2)
d <- rep(c(5,12,13,20), each=2)

#Q2)
data<-iris
data
class(data)
nrow(data)
ncol(iris)
is.factor(iris$Species)
levels(iris$Species)
length(levels(iris$Species))

#Q3)
mean_sw <- tapply(iris$Sepal.Width , iris$Species , mean)
mean_sw
mean_sl <- tapply(iris$Sepal.Length , iris$Species , mean)
sd_sw <- tapply(iris$Sepal.Width , iris$Species , sd)
sd_sl <- tapply(iris$Sepal.Length , iris$Species , sd)
write.csv(iris,"iris.class.csv",row.names = FALSE)
iris.class<-read.csv("iris.class.csv")
iris.class$Calyx.Width <- character(nrow(iris.class))
for (i in 1:nrow(iris.class)) {
   iris.class$Calyx.Width[i]<-ifelse(iris.class$Sepal.Length[i]<5,"short","long")
}
iris.class

#Q4)
data(mtcars)
str(mtcars)
names(mtcars)
subset_A <- subset(mtcars, cyl>=5)
subset_A <- mtcars[mtcars$cyl>=5,]
print(subset_A)
subset_B <- head(mtcars, 10)
subset_B <- mtcars[1:10, ]
print(subset_B)
mtcars$make <- rownames(mtcars)
subset_C <- subset(mtcars,grepl("Honda",make,ignore.case = TRUE)) #ignore.case=true - makes string matching case insensitive
subset_C <- mtcars[grepl("Honda", rownames(mtcars)), ]
print(subset_C)




# Creating a factor from a character vector
gender <- c("Male", "Female", "Female", "Male")
gender_factor <- factor(gender)

print(gender_factor)


