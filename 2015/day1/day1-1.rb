floor = 0
File.read('./input.txt').split("").each{ |f| f == "(" ? floor +=1 : floor -= 1  }

## Test
puts "Answer: #{ floor }\nValid? - #{ (floor == 232) }"