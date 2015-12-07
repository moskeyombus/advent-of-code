input = File.read('./input.txt')
total = 0

def double_check(str)
  if str.length > 3
    check = str[0..1]
    against = str[2..-1]
    against.include?(check) ? true : double_check(str[1..-1])
  else
    false
  end
end

def repeat_check(str)
  if str.length >= 3
    str[0] == str[2] ? true : repeat_check(str[1..-1])
  else
    false
  end
end

input.each_line do |line|
  double_match = double_check(line)
  repeat_match = repeat_check(line)
  total += 1 if (double_match && repeat_match)
end

puts total