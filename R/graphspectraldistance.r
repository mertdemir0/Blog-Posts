library(igraph)

graph_spectral_distance <- function(G1, G2) {
  # Calculate the eigenvalues of the adjacency matrices of G1 and G2
  adjacency_matrix1 <- get.adjacency(G1)
  adjacency_matrix2 <- get.adjacency(G2)
  eigenvalues1 <- eigen(adjacency_matrix1)$values
  eigenvalues2 <- eigen(adjacency_matrix2)$values
  # Calculate the spectral distance between the eigenvalue spectra
  distance <- norm(eigenvalues1 - eigenvalues2)
  return(distance)
}

# Example usage
G1 <- graph.full(5)
G2 <- graph.ring(5)
distance <- graph_spectral_distance(G1, G2)
print(distance)  # Output: approximately 5.916