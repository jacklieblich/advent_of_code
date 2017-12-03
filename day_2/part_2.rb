def get_divisible(arr)
  arr.sort!.reverse!
  (0..arr.length-2).each do |i|
    (i+1..arr.length-1).each do |j|
      result = arr[i].divmod(arr[j])
      if result[1] == 0
        return result[0]
      end
    end
  end
end

def check_sum(arr)
  diff_arr = []
  arr.each do |subarr|
    diff_arr << get_divisible(subarr)
  end
  diff_arr.reduce(:+)
end

str = File.read(File.dirname(__FILE__) + '/input.txt')
arr = str.split().map(&:to_i).each_slice(16).to_a
p check_sum(arr)