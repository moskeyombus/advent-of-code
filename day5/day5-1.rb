input = File.read('./input.txt')
bad_strings = ["ab", "cd", "pq", "xy"]
good_strings = ('a'..'z').to_a.map{ |val| val += val }
total = 0

input.each_line do |line|
  bad_string_match = bad_strings.map{ |bad| line.include?(bad) }.any?
  good_string_match = good_strings.map{ |good| line.include?(good) }.any?
  vowel_match = line.gsub(/[^aeiou]/i, '').split("").count >= 3
  total += 1 if(vowel_match && good_string_match && !bad_string_match)
end

puts total