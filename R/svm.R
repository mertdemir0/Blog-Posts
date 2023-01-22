library(e1071)

# load the iris dataset
data(iris)

# split the data into training and test sets
train_indices <- sample(1:nrow(iris), 0.8*nrow(iris))
train_data <- iris[train_indices, 1:4]
train_labels <- iris[train_indices, 5]
test_data <- iris[-train_indices, 1:4]
test_labels <- iris[-train_indices, 5]

# train the SVM classifier with an RBF kernel
model <- svm(train_data, train_labels, kernel = "radial")

# make predictions on the test set
predictions <- predict(model, test_data)

# evaluate the model's accuracy
mean(predictions == test_labels)
