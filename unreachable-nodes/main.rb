class GraphNode

  attr_accessor :value, :neighbors
  
  def initialize(value)
    @value = value
    @neighbors = []
  end
  
  def add_edge(neighbor)
    @neighbors << neighbor
  end
  
  end
  
class Graph

  attr_accessor :nodes

def initialize
    @nodes = []
end

def add_node(value)
    graph_node = @nodes.find { |obj| obj.value == value } 
    if !graph_node
    graph_node = GraphNode.new(value)
    @nodes << graph_node 
    end
    return graph_node
end

end

def dfs(s)
    $visited[s] = true;
    $ans += 1;
    graph_node = $nodes.find { |obj| obj.value == s }
    neighbors = graph_node.neighbors
    for i in 0...neighbors.length
      if($visited[neighbors[i]] == false)
        dfs(neighbors[i])
      end
    end
end

ARGF.each_line do |line|
    $input_data += line
end

lines = input_data.split(/\n+/)

first_line = lines[0].split(" ")
nodes =  first_line[0]
edge =  first_line[1]
head = lines[lines.length - 1]
items = lines.slice(1..lines.length - 2)

graph = Graph.new

for i in 1..nodes.to_i
    graph.add_node(i)
end
for i in 0...items.length
    item = items[i].split(" ")
    graph.add_node(item[0].to_i).add_edge(item[1].to_i)
end

$nodes = graph.nodes
$visited = Hash.new(false) 
$ans = 0;
 
dfs(head.to_i)

puts $ans
