library(igraph)

graph_edit_distance <- function(G1, G2) {
  # Create a mapping between the nodes of G1 and G2
  mapping <- integer(vcount(G1))
  for (node1 in 1:vcount(G1)) {
    distances <- shortest.paths(G1, node1, to=V(G2))
    min_distance <- min(distances)
    min_node <- which(distances == min_distance)[1]
    mapping[node1] <- min_node
  }
  # Calculate the number of graph edit operations needed to transform G1 into G2
  num_deletions <- vcount(G1) - length(mapping)
  num_additions <- vcount(G2) - length(mapping)
  num_substitutions <- 0
  for (node1 in 1:length(mapping)) {
    if (degree(G1, node1) != degree(G2, mapping[node1])) {
      num_substitutions <- num_substitutions + 1
    }
  }
  distance <- num_deletions + num_additions + num_substitutions
  return(distance)
}

# Example usage
G1 <- graph.full(5)
G2 <- graph.ring(5)
distance <- graph_edit_distance(G1, G2)
print(distance)  # Output: 5