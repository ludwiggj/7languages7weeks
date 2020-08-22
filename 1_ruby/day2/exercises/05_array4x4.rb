puts "The long way..."

a = [2, 4, 8, 16, 3, 9, 27, 81, 4, 16, 64, 256, 5, 25, 125, 725]
b = []
a.each do |item|
    if b.size == 0
      b << []
      puts "b.size == 0 #{b}"
    end
    if b[-1].size == 4
      b << []
      puts "b[-1].size == 4 #{b}"
    end
    b[-1] << item
    puts "Fall through; b[-1] << item #{b}"
end
p b
b.each{|c| puts c.join(",")}

puts "Now the easy way!"
a.each_slice(4) {|slice| p slice}

# There is a difference between p and puts...
# See http://stackoverflow.com/questions/1255324/p-vs-puts-in-ruby
