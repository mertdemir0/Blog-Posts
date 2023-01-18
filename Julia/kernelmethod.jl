using MLJ
using Statistics
using MLJ: cross_validate
using DataFrames

# Load the iris dataset as an example
iris = DataFrame(MLJ.load("iris"))

# Split the data into training and testing sets
train, test = MLJ.partition(iris, 0.8)

# Create a SVM classifier with an RBF kernel
clf = SVC(kernel = "RBF")

# Train the classifier on the training data
MLJ.fit!(clf, train)

# Test the classifier on the testing data
accuracy = mean(MLJ.predict(clf, test) .== test[:species])
println("Accuracy: ", accuracy)