import numpy as np
from sklearn.decomposition import PCA
from sklearn.metrics.pairwise import rbf_kernel

# Define the kernel function
def kernel(X, Y):
    return rbf_kernel(X, Y, gamma=0.5)

# Define the eigenvoices function
def eigenvoices(X, n_components):
    K = kernel(X, X)
    pca = PCA(n_components=n_components, svd_solver='arpack')
    pca.fit(K)
    eigenvoices = np.dot(pca.components_, np.sqrt(pca.explained_variance_))
    return eigenvoices

# Define the dataset
X = np.random.randn(100, 20)

# Extract eigenvoices
eigenvoices = eigenvoices(X, 10)

print("Eigenvoices shape: ", eigenvoices.shape)