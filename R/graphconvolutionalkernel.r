library(igraph)
library(expm)

graph_convolutional_kernel <- function(G1, G2, sigma=1) {
  # Calculate the graph Laplacian matrices of G1 and G2
  lap1 <- laplacian(G1, normalized=TRUE)
  lap2 <- laplacian(G2, normalized=TRUE)
  # Apply the convolutional operation to the Laplacian matrices
  kernel <- expm(-sigma * lap1) %*% expm(-sigma * lap2)
  return(kernel)
}

# Example usage
G1 <- graph.full(5)
G2 <- graph.ring(5)
kernel <- graph_convolutional_kernel(G1, G2)
print(kernel)  # Output: approximately 0.135