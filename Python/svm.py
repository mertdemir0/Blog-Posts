from sklearn import datasets
from sklearn.model_selection import train_test_split
from sklearn.svm import SVC

# load the iris dataset
iris = datasets.load_iris()
X = iris.data
y = iris.target

# split the data into training and test sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)

# train the SVM classifier with an RBF kernel
clf = SVC(kernel='rbf')
clf.fit(X_train, y_train)

# make predictions on the test set
y_pred = clf.predict(X_test)

# evaluate the model's accuracy
print("Accuracy:", metrics.accuracy_score(y_test, y_pred))