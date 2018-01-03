str = File.read(File.dirname(__FILE__) + '/input.txt')
moves = str.split(",")
@location = {n:0, e:0}
@max_distance = 0

def tally_move(move)
  case move
    when "ne"
      @location[:n] += 1
      @location[:e] += 1
    when "n"
      @location[:n] += 1
    when "nw"
      @location[:n] += 1
      @location[:e] -= 1
    when "e"
      @location[:e] += 1
    when "w"
      @location[:e] -= 1
    when "s"
      @location[:n] -= 1
    when "sw"
      @location[:n] -= 1
      @location[:e] -= 1
    when "se"
      @location[:n] -= 1
      @location[:e] += 1
  end
end

def total_distance
  vertical_distance = @location[:n].abs
  horizontal_distance = @location[:e].abs
  additional_h_d = horizontal_distance - vertical_distance
  distance = vertical_distance
  distance += additional_h_d if additional_h_d > 0
  return distance
end

moves.each do |move|
  tally_move(move)
  distance = total_distance
  @max_distance = distance if distance > @max_distance
end

p @max_distance