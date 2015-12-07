require 'matrix'
class Matrix
  def []=(i, j, x)
    @rows[i][j] = x
  end
end

total = 0
input = File.read('./input.txt')
@lights = Matrix.build(1000, 1000) {|row, col| false }

def change_light(instruction, current)
  return !current if instruction == "toggle"
  instruction == "turn_on" ? true : false
end

input.each_line do |line|
  instruction = line.slice(/[^\d]*/).rstrip.gsub(" ", "_")
  @start_x, @start_y, @end_x, @end_y = line.split(/[a-z,\s]/).reject{ |e| e == "" }.map(&:to_i)
  (@start_y..@end_y).to_a.each do |y_coord|
    (@start_x..@end_x).to_a.each do |x_coord|
      @lights[x_coord, y_coord] = change_light(instruction, @lights[x_coord, y_coord])
    end
  end
end

@lights.each { |light| total +=1 if light }
puts total