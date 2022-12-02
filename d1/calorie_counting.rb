input = File.new("input.txt", "r")
data = input.read

highest = [0,0,0]
count = 0
data.each_line do |line|
    if(line.to_i == 0)
        for h in highest
            if(count > h)
                if(highest.size == 3)
                    highest.delete(h)
                end
                highest.push(count)
                break
            end
        end
        count = 0
    else
        count += line.to_i
    end
end

puts "Highest: #{highest[0]}"
puts "Total: #{highest[0] + highest[1] + highest[2]}"
