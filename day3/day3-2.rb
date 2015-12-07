x, y, robo_x, robo_y = 0, 0, 0, 0
visited = [[x,y]]
File.read('./input.txt').split("").each_with_index do |direction, index|
 is_robo = (index+1).even?
 case direction
 when "^"
  is_robo ? robo_y += 1 : y += 1
 when ">"
  is_robo ? robo_x += 1 : x += 1
 when "v"
  is_robo ? robo_y -= 1 : y -= 1
 when "<"
  is_robo ? robo_x -= 1 : x -= 1
 end
 is_robo ? visited << [robo_x, robo_y] : visited << [x, y]
end

## Test
puts "Answer: #{visited.uniq.count}\nValid? - #{ visited.uniq.count == 2360 }"