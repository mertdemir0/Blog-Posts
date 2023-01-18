from sklearn.svm import SVC
from sklearn.datasets import load_iris
from sklearn.model_selection import train_test_split

# Load the iris dataset as an example
iris = load_iris()
X = iris.data
y = iris.target

# Split the data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)

# Create a SVM classifier with an RBF kernel
clf = SVC(kernel='rbf')

# Train the classifier on the training data
clf.fit(X_train, y_train)

# Test the classifier on the testing data
accuracy = clf.score(X_test, y_test)
print("Accuracy: ", accuracy)