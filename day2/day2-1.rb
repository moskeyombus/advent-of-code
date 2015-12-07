total = 0
File.read('./input.txt').each_line do |line|
  dimensions = line.split('x').map(&:to_i)
  l, w, h = dimensions
  surface_area = (2*l*w) + (2*w*h) + (2*h*l)
  dimensions.delete_at(dimensions.index(dimensions.max) || dimensions.length)
  total += (surface_area + dimensions.inject(:*))
end

## Test
puts "Answer: #{total}\nValid? - #{ total == 1598415 }"