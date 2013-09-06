a=[1,2,3,4,5]
a.inject(0) do |sum, i|
  puts "sum: #{sum} i: #{i} sum+i: #{sum+i}"
  sum+i
end