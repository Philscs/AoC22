# input = File.new("test.txt", "r")
input = File.new("input.txt", "r")
data = input.read
input.close

def find_start(data)
    data.each_char.with_index do |char, index|
        if data[index..index+3].chars.uniq.length == 4
            puts index + 4
            break
        end
    end
end

def find_message(data)
    data.each_char.with_index do |char, index|
        if data[index..index+13].chars.uniq.length == 14
            puts index + 14
            break
        end
    end
end

data.each_line do |line|
    find_start(line)
    find_message(line)
end
