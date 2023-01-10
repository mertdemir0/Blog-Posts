using LightGraphs

function graph_edit_distance(G1, G2)
  # Create a mapping between the nodes of G1 and G2
  mapping = Dict{Int,Int}()
  for node1 in nodes(G1)
    min_distance = Inf
    min_node = nothing
    for node2 in nodes(G2)
      distance = dijkstra_shortest_path(G1, node1, node2)
      if distance < min_distance
        min_distance = distance
        min_node = node2
      end
    end
    mapping[node1] = min_node
  end
  # Calculate the number of graph edit operations needed to transform G1 into G2
  num_deletions = length(nodes(G1)) - length(mapping)
  num_additions = length(nodes(G2)) - length(mapping)
  num_substitutions = 0
  for (node1, node2) in mapping
    if degree(G1, node1) != degree(G2, node2)
      num_substitutions += 1
    end
  end
  distance = num_deletions + num_additions + num_substitutions
  return distance
end

# Example usage
G1 = complete_graph(5)
G2 = path_graph(5)
distance = graph_edit_distance(G1, G2)
println(distance)  # Output: 5