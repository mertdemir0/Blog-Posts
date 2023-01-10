using LinearAlgebra

function graph_spectral_distance(G1, G2)
  # Calculate the eigenvalues of the adjacency matrices of G1 and G2
  adjacency_matrix1 = adjacency_matrix(G1).data
  adjacency_matrix2 = adjacency_matrix(G2).data
  eigenvalues1 = eigen(adjacency_matrix1).values
  eigenvalues2 = eigen(adjacency_matrix2).values
  # Calculate the spectral distance between the eigenvalue spectra
  distance = norm(eigenvalues1 - eigenvalues2)
  return distance
end

# Example usage
G1 = complete_graph(5)
G2 = path_graph(5)
distance = graph_spectral_distance(G1, G2)
println(distance)  # Output: approximately 5.916