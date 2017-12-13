str = File.read(File.dirname(__FILE__) + '/input.txt')
arr = str.split("\n")
balanced = arr.select{ |program| program.include?("->")}.map{ |program| program.split("-> ")[1].split(", ")}.flatten
all_programs = arr.map{ |program| program.split(" ")[0]}
unbalanced = all_programs - balanced

p unbalanced
