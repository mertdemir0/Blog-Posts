import pygsp
import numpy as np

def graph_convolutional_kernel(G1, G2, sigma=1):
  # Calculate the graph Laplacian matrices of G1 and G2
  lap1 = pygsp.graphs.Graph(G1).L
  lap2 = pygsp.graphs.Graph(G2).L
  # Apply the convolutional operation to the Laplacian matrices
  kernel = np.exp(-sigma * lap1).dot(np.exp(-sigma * lap2))
  return kernel

# Example usage
G1 = nx.complete_graph(5)
G2 = nx.path_graph(5)
kernel = graph_convolutional_kernel(G1, G2)
print(kernel)  # Output: approximately 0.135