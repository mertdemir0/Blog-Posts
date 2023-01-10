import networkx as nx

def graph_edit_distance(G1, G2):
  # Create a mapping between the nodes of G1 and G2
  mapping = {}
  for node1 in G1.nodes():
    min_distance = float('inf')
    min_node = None
    for node2 in G2.nodes():
      distance = nx.shortest_path_length(G1, node1, node2)
      if distance < min_distance:
        min_distance = distance
        min_node = node2
    mapping[node1] = min_node
  # Calculate the number of graph edit operations needed to transform G1 into G2
  num_deletions = len(G1.nodes()) - len(mapping)
  num_additions = len(G2.nodes()) - len(mapping)
  num_substitutions = 0
  for node1, node2 in mapping.items():
    if G1.degree(node1) != G2.degree(node2):
      num_substitutions += 1
  distance = num_deletions + num_additions + num_substitutions
  return distance

# Example usage
G1 = nx.complete_graph(5)
G2 = nx.path_graph(5)
distance = graph_edit_distance(G1, G2)
print(distance)  # Output: 5