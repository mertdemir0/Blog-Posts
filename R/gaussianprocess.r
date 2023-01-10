library(gausspr)

# Define the mean and covariance functions
k <- rbf(1, 0.2) # Radial Basis Function
gp <- gausspr(X, y, kernel=k)

# Fit the GP to the data
X <- cbind(c(1, 2, 3), c(4, 5, 6))
y <- c(1, 2)
fit(gp)

# Make predictions
x_pred <- cbind(c(7, 8, 9))
y_pred, sigma <- predict(gp, x_pred)

print(paste("Predicted value: ", y_pred))
print(paste("Uncertainty: ", sigma))