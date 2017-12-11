str = File.read(File.dirname(__FILE__) + '/input.txt')
arr = str.split("\n").map{ |str| str.delete(",")}
programs = arr.map{ |program| program.split()}
programs.each{ |program| program.delete_at(2)}
@program_weights = {}
programs.each do |program|
  @program_weights[program[0]] = program[1][1..-2].to_i
end

@program_h = {}
programs.each do |program|
  @program_h[program[0]] = program[2..-1]
end
@unbalanced = nil
@other_weights= nil
@unbalanced_weight = nil

def get_weight(program)
  sum = @program_weights[program]
  @program_h[program].each{ |child| sum += get_weight(child)}
  return sum
end

def delete_keys(program)
  
end

def unbalanced(program)
  weights = {}
  @program_h[program].each do |program|
    weights[program] = get_weight(program)
  end
  values = weights.values
  values.each do |value|
    if values.count(value) > 1
      weights.delete_if{ |x| weights[x] == value}
      break
    end
  end
  if weights.empty?
    p @program_weights[@unbalanced] - (@unbalanced_weight - @other_weights)
  else
    weights.each do |program, weight|
      @unbalanced = program
      @unbalanced_weight = weight
      @other_weights = values.select{ |x| x != weight}.first
      unbalanced(program)
    end
  end
end

unbalanced("gynfwly")