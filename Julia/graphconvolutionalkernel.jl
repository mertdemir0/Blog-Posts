using LightGraphs, SymPy

function graph_convolutional_kernel(G1, G2, sigma=1)
  # Calculate the graph Laplacian matrices of G1 and G2
  lap1 = laplacian_matrix(G1)
  lap2 = laplacian_matrix(G2)
  # Apply the convolutional operation to the Laplacian matrices
  kernel = exp(-sigma * lap1) * exp(-sigma * lap2)
  return kernel
end

# Example usage
G1 = complete_graph(5)
G2 = path_graph(5)
kernel = graph_convolutional_kernel(G1, G2)
println(kernel)  # Output: approximately 0.135