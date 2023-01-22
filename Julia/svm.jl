#=
svm:
- Julia version: 
- Author: M D
- Date: 2023-01-22
=#
using LIBSVM, RDatasets

# load the iris dataset
iris = dataset("datasets", "iris")
X = iris[:,1:4]
y = iris[:,5]

# split the data into training and test sets
train_indices = sample(1:size(iris, 1), 0.8*size(iris, 1))
X_train = X[train_indices, :]
y_train = y[train_indices]
X_test = X[setdiff(1:size(iris, 1), train_indices), :]
y_test = y[setdiff(1:size(iris, 1), train_indices)]

# train the SVM classifier with an RBF kernel
model = LIBSVM.svmtrain(X_train, y_train, kernel="RBF")

# make predictions on the test set
y_pred = LIBSVM.svmpredict(model, X_test)

# evaluate the model's accuracy
println("Accuracy: ", mean(y_pred .== y_test))