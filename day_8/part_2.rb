str = File.read(File.dirname(__FILE__) + '/input.txt')
arr = str.split("\n").map{|cmd| cmd.split(" ")}
@h = Hash.new(0)

def execute(command)
  command[1] == "inc" ? @h[command[0]] += command[2].to_i : @h[command[0]] -= command[2].to_i
end

def condition_met?(command)
  case command[5]
  when ">"
    @h[command[4]] > command[6].to_i
    when "<"
    @h[command[4]] < command[6].to_i
    when "=="
    @h[command[4]] == command[6].to_i
    when "!="
    @h[command[4]] != command[6].to_i
    when ">="
    @h[command[4]] >= command[6].to_i
    when "<="
    @h[command[4]] <= command[6].to_i
  end
end

maxes = []
arr.each do |cmd|
  execute(cmd) if condition_met?(cmd)
  maxes <<  @h.values.max
end
p maxes.max