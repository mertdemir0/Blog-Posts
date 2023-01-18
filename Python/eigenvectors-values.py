import numpy as np

# Define a matrix
A = np.array([[3, 2, 1], [2, 3, 2], [1, 2, 3]])

# Find the eigenvectors and eigenvalues
eigen_values, eigen_vectors = np.linalg.eig(A)

# Print the results
print("Eigenvalues:")
print(eigen_values)
print("Eigenvectors:")
print(eigen_vectors)