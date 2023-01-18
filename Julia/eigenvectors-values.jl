A = Array([3 2 1; 2 3 2; 1 2 3])
using LinearAlgebra
eigenvalues = eigvals(A)
eigenvectors = eigvecs(A)
println("Eigenvalues:")
println(eigenvalues)
println("Eigenvectors:")
println(eigenvectors)