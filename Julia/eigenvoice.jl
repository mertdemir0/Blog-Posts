using LinearAlgebra
using KernelEigenmodes
using GaussianProcesses

# Define the kernel function
function kernel(X, Y)
    return exp(-0.5 * sqdist(X, Y))
end

# Define the eigenvoices function
function eigenvoices(X, n_components)
    K = kernel(X, X)
    eigenvectors, eigenvalues = eigen(K)
    eigenvoices = eigenvectors * sqrt.(eigenvalues)
    return eigenvoices[:, 1:n_components]
end

# Define the dataset
X = randn(100, 20)

# Extract eigenvoices
eigenvoices = eigenvoices(X, 10)

println("Eigenvoices shape: ", size(eigenvoices))