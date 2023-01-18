# Define a matrix
A <- matrix(c(3,2,1,2,3,2,1,2,3), nrow=3, ncol=3)

# Find the eigenvectors and eigenvalues
eigen_values <- eigen(A)$values
eigen_vectors <- eigen(A)$vectors

# Print the results
print("Eigenvalues:")
print(eigen_values)
print("Eigenvectors:")
print(eigen_vectors)