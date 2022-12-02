input = File.new("input.txt", "r")
data = input.read

moves = {"A X" => 4, "A Y" => 8, "A Z" => 3, "B X" => 1, "B Y" => 5, "B Z" => 9, "C X" => 7, "C Y" => 2, "C Z" => 6}
movesTwo = {"A X" => 3, "A Y" => 4, "A Z" => 8, "B X" => 1, "B Y" => 5, "B Z" => 9, "C X" => 2, "C Y" => 6, "C Z" => 7}

pos = {"A" => 1, "B" => 2, "C" => 3}
posPlayer = {"X" => 1, "Y" => 2, "Z" => 3}

sum = 0
rigged = 0

data.each_line do |line|
  line.chomp!
  sum += moves[line]
  rigged += movesTwo[line]
end

puts sum
puts rigged

