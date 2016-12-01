total = 0
File.read('./input.txt').each_line do |line|
  dimensions = line.split('x').map(&:to_i)
  volume = dimensions.inject(:*)
  dimensions.delete_at(dimensions.index(dimensions.max) || dimensions.length)
  total += ((dimensions[0]*2) + (dimensions[1]*2) + volume)
end

## Test
puts "Answer: #{total}\nValid? - #{ total == 3812909 }"