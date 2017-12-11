str = File.read(File.dirname(__FILE__) + '/input.txt')
@garbage_chars = 0
def remove_garbage(str)
	open_garbage = str.index("<")
	return str if open_garbage == nil
	close_garbage = str.index(">")
	@garbage_chars += str[open_garbage+1..close_garbage-1].delete('!').length
	str = str[0..open_garbage-1] + str[close_garbage+1..-1]
	remove_garbage(str)
end

def remove_canceled(str)
	delete_at = []
	str.each_char.with_index do |char, index|
		if char == "!" && !delete_at.include?(index)
			delete_at << index + 1
		end
	end
	start_index = 0
	new_str = ""
	delete_at.each do |index|
		new_str += str[start_index..index-1]
		start_index = index + 1
	end
	new_str += str[start_index..-1]
end

canceled_str = remove_canceled(str)
garbage_free_str = remove_garbage(canceled_str)
p @garbage_chars