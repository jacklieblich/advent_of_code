require 'set'

str = File.read(File.dirname(__FILE__) + '/input.txt')
@connections = str.split("\n")
@connections.map!{ |c| c.split(" <-> ") }
@connections.map!{ |c| [c[0].to_i, c[1].split(", ").map(&:to_i)] }

@set = Set.new

def insert_node(node)
  unless @set.include?(node)
    @set << node
    @connections[node][1].each{ |n| insert_node(n)}
  end
end

insert_node(0)
p @set.length