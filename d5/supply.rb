input = File.new("input.txt", "r")
# input = File.new("test.txt", "r")
data = input.read
input.close

crates = [[],[],[],[],[],[],[],[],[]]
data.each_line do |line|
    line.chomp!
    if(line.include? "1")
        break
    end
    index = 0
    it = 1
    while it < line.length
        if(line[it] != " ")
            crates[index].unshift(line[it])
        end
        it += 4
        index += 1
    end
end

def move_crates(first, second, third, crates)
    times, from, to, index = 0, 0, 0, 0
    times = first.to_i
    from = second.to_i-1
    to = third.to_i-1
    for i in 0..times-1
        if(crates[from].length > 0)
            index = crates[from].length() - 1
        else
            index = i
        end
        # puts "moving index #{index} #{crates[from][index]} from #{from} to #{to}"
        crates[to].push(crates[from][index])
        crates[from].delete_at(index)
    end
end

def move_crates_9001(first, second, third, crates)
    times, from, to, index = 0, 0, 0, 0
    times = first.to_i
    from = second.to_i-1
    to = third.to_i-1

    if times == 1
        if(crates[from].length > 0)
            index = crates[from].length() - 1
        else
            index = i
        end
        crates[to].push(crates[from][index])
        crates[from].delete_at(index)
    else
        i = times
        while i > 0
            index = crates[from].length() - i

            # puts "moving index #{index} #{crates[from][index]} from #{from} to #{to}"
            crates[to].push(crates[from][index])
            crates[from].delete_at(index)
            i -= 1
        end
    end
end

first, second, third = nil, nil, nil
data.each_line do |line|
    line.chomp!
    if(line.include? "move")
        first = line[/\d+/]
        line = line.sub(first, "")
        second = line[/\d+/]
        third = line[/\d+$/]
        # move_crates(first, second, third, crates)
        move_crates_9001(first, second, third, crates)
    end
end

tops = ""
crates.each do |crate|
    if(crate.length > 0)
        tops += crate[crate.length-1]
    end
end
puts tops

# print index of crate and its contents
# crates.each do |crate|
#     print crates.index(crate)
#     print " "
#     print crate
#     puts
# end