floor, answer = 0, 0
File.read('./input.txt').split("").each_with_index do |f, index|
  f == "(" ? floor += 1 : floor -= 1
  answer = (index+1) and break if floor == -1
end

## Test
puts "Answer: #{ answer }\nValid? - #{ (answer == 1783) }"