def get_largest_diff(arr)
  arr.sort!
  arr[-1] - arr[0]
end

def check_sum(arr)
  diff_arr = []
  arr.each do |subarr|
    diff_arr << get_largest_diff(subarr)
  end
  diff_arr.reduce(:+)
end

str = File.read(File.dirname(__FILE__) + '/input.txt')
arr = str.split().map(&:to_i).each_slice(16).to_a
p check_sum(arr)