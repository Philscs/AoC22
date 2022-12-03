input = File.new("input.txt", "r")

data = input.read
input.close

sum = 0
data.each_line do |line|
    line.chomp!
    first = line[0, (line.length.to_f / 2).ceil]
    second = line[(line.length.to_f / 2).ceil, line.length]
    first.each_char do |char|
        if second.include? char
            if char == char.downcase
                sum += char.ord - 96
            else
                sum += char.ord - 38
            end
            break
        end
    end
end
puts sum

badges = 0
count = 0
line1, line2, line3 = nil
data.each_line do |line|
    line.chomp!
    if count%3 == 0
        line1 = line
    elsif count%3 == 1
        line2 = line
    else
        line3 = line
        line1.each_char do |char|
            if line2.include? char and line3.include? char
                if char == char.downcase
                    badges += char.ord - 96
                else
                    badges += char.ord - 38
                end
                break
            end
        end
    end
    count = count + 1
end

puts badges
    
