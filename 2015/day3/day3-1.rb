x, y = 0, 0
visited = [[x,y]]
File.read('./input.txt').split("").each do |direction|
 case direction
 when "^"
  y += 1
 when ">"
  x += 1
 when "v"
  y -= 1
 when "<"
  x -= 1
 end
 visited << [x, y]
end

##Test
puts "Answer: #{visited.uniq.count}\nValid? - #{ visited.uniq.count == 2592 }"