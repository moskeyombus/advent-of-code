input = File.read('./input.txt')
@total_code_chars = 0
@total_memory_chars = 0
count = 0

def count_chars_in_memory(line)
  puts line + " - #{line.strip.length}"
  stripped = line.strip.chomp('"').reverse.chomp('"').reverse.gsub('\\\\', '\\').gsub('\"', '"')#.gsub('\x..', 'x')
  puts stripped + " - #{stripped.length}"
  stripped.length
end

input.each_line do |line|
  count += 1
  if count <= 2
    @total_code_chars += line.strip.length
    @total_memory_chars += count_chars_in_memory(line)
  end

end

puts "Total code chars: #{@total_code_chars}\nTotal chars in memory: #{@total_memory_chars}\nDifference:#{@total_code_chars-@total_memory_chars}"