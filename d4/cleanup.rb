input = File.new("input.txt", "r")
data = input.read
input.close

contained = 0
overlaps = 0
data.each_line do |line|
    line.chomp!
    first = line[0,line.index(",")]
    second = line[line.index(",")+1,line.length]
    if((first.split("-")[0].to_i <= second.split("-")[0].to_i && first.split("-")[1].to_i >= second.split("-")[1].to_i) or (second.split("-")[0].to_i <= first.split("-")[0].to_i && second.split("-")[1].to_i >= first.split("-")[1].to_i))
        contained += 1
    end
    if((first.split("-")[0].to_i <= second.split("-")[0].to_i && first.split("-")[1].to_i >= second.split("-")[0].to_i) or (second.split("-")[0].to_i <= first.split("-")[0].to_i && second.split("-")[1].to_i >= first.split("-")[0].to_i))
        overlaps += 1
    end
end
puts contained, overlaps