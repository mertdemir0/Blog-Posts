using GaussianProcesses
using KernelFunctions

# Define the mean and covariance functions
k = SEIso(1.0) # Squared Exponential Isotropic
gp = GaussianProcess(k)

# Fit the GP to the data
X = [[1, 2, 3], [4, 5, 6]]
y = [1, 2]
fit!(gp, X, y)

# Make predictions
x_pred = [[7, 8, 9]]
mean, var = predict_y(gp, x_pred)

print("Predicted value: ", mean)
print("Uncertainty: ", sqrt(var))