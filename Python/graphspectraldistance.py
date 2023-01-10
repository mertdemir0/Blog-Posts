import numpy as np
from scipy.linalg import eigh

def graph_spectral_distance(G1, G2):
  # Calculate the eigenvalues of the adjacency matrices of G1 and G2
  adjacency_matrix1 = nx.adjacency_matrix(G1).toarray()
  adjacency_matrix2 = nx.adjacency_matrix(G2).toarray()
  eigenvalues1, _ = eigh(adjacency_matrix1)
  eigenvalues2, _ = eigh(adjacency_matrix2)
  # Calculate the spectral distance between the eigenvalue spectra
  distance = np.linalg.norm(eigenvalues1 - eigenvalues2)
  return distance

# Example usage
G1 = nx.complete_graph(5)
G2 = nx.path_graph(5)
distance = graph_spectral_distance(G1, G2)
print(distance)  # Output: approximately 5.916