require 'matrix'
class Matrix
  def []=(i, j, x)
    @rows[i][j] = x
  end
end

total = 0
input = File.read('./input.txt')
@lights = Matrix.build(1000, 1000) {|row, col| 0 }

def change_light(instruction, current)
  return (current + 2) if instruction == "toggle"
  instruction == "turn_on" ? (current + 1) : (current - 1)
end

input.each_line do |line|
  instruction = line.slice(/[^\d]*/).rstrip.gsub(" ", "_")
  puts instruction
  @start_x, @start_y, @end_x, @end_y = line.split(/[a-z,\s]/).reject{ |e| e == "" }.map(&:to_i)
  puts @start_x, @start_y, @end_x, @end_y
  (@start_y..@end_y).to_a.each do |y_coord|
    (@start_x..@end_x).to_a.each do |x_coord|
      update = change_light(instruction, @lights[x_coord, y_coord])
      @lights[x_coord, y_coord] = update if update >= 0
    end
  end
end

@lights.each { |light| total += light }
puts total