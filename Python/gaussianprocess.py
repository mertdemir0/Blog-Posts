import numpy as np
from sklearn.gaussian_process import GaussianProcessRegressor
from sklearn.gaussian_process.kernels import RBF, ConstantKernel as C

# Define the mean and covariance functions
kernel = C(1.0, (1e-3, 1e3)) * RBF(10, (1e-2, 1e2))
gp = GaussianProcessRegressor(kernel=kernel, n_restarts_optimizer=9)

# Fit the GP to the data
X = np.array([[1, 2, 3], [4, 5, 6]])
y = np.array([1, 2])
gp.fit(X, y)

# Make predictions
x_pred = np.array([[7, 8, 9]])
y_pred, sigma = gp.predict(x_pred, return_std=True)
print("Predicted value: ", y_pred)
print("Uncertainty: ", sigma)