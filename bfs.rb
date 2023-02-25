#OpenStruct is also preferable
class Node
  attr_accessor :value, :visited, :adjs
  def initialize(value:, visited: false, adjs: [])
    @value = value
    @visited = visited
    @adjs = adjs
  end
end

class Graph
  attr_accessor :nodes
  def initialize(nodes: nil)
    @nodes = nodes
  end
end

class BFS
  def initialize(graph:)
    @graph = graph
    @queue = []
  end

  def run
    if queue.empty?
      queue.push(graph.nodes.first)
    end

    while !queue.empty?
      node = queue.find{ |el| el.visited == false }
      if node.nil?
        return queue
      end
      node.adjs.each{ |el| 
        next if queue.include?(el)
        queue.push(el)
      }
      node.visited = true
    end
  end

  private

  attr_accessor :graph, :queue
end

class RunProgram
  @@n1 = Node.new(value: 1)
  @@n2 = Node.new(value: 2)
  @@n3 = Node.new(value: 3)
  @@n4 = Node.new(value: 4)

  @@n1.adjs.push(@@n2, @@n4)
  @@n2.adjs.push(@@n1, @@n3)
  @@n3.adjs.push(@@n4, @@n2)
  @@n4.adjs.push(@@n1, @@n3)

  def self.run
    graph = Graph.new(nodes: [@@n1, @@n2, @@n3, @@n4])
    p BFS.new(graph: graph).run
  end
end

RunProgram.run