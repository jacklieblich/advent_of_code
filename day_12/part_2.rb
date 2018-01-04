require 'set'

str = File.read(File.dirname(__FILE__) + '/input.txt')
@connections = str.split("\n")
@connections.map!{ |c| c.split(" <-> ") }
@connections.map!{ |c| [c[0].to_i, c[1].split(", ").map(&:to_i)] }

@sets = []

def insert_node(node, set)
  unless set.include?(node)
    set << node
    @connections[node][1].each{ |n| insert_node(n, set)}
  end
end

(@connections.length - 1).times do |node|
  if @sets.empty? || !@sets.reduce(:merge).include?(node) 
    set = Set.new
    @sets << set
    insert_node(node, set)
  end
end
p @sets.length
