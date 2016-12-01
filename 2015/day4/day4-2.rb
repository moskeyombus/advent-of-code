require 'digest'
answer = 0
secret = "iwrupvqb"
hash = Digest::MD5.hexdigest(secret + answer.to_s)

while hash[0..5] != "000000"
  answer += 1
  hash = Digest::MD5.hexdigest(secret + answer.to_s)
  puts "#{answer}: #{hash}"
end

puts "Answer: #{hash}"