#Q1
set.seed(123)
# Create a data matrix with random marks for 20 students in 3 subjects
MARKS <- matrix(sample(50:100, 60, replace = TRUE), nrow = 20, ncol = 3)
colnames(MARKS) <- c("SUB1", "SUB2", "SUB3")
MARKS

#(a)
# Calculate total marks for each student
total_marks <- apply(MARKS, 1, sum)
total_marks

#(b)
