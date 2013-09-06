a = [2, 4, 8, 16, 3, 9, 27, 81, 4, 16, 64, 256, 5, 25, 125, 725]
b = []
a.each do |item|
    b << [] if b.size == 0
    b << [] if b[-1].size == 4
    b[-1] << item
end
p b
b.each{|c| puts c.join(",")}

p "Now the easy way!"
a.each_slice(4) {|slice| p slice}