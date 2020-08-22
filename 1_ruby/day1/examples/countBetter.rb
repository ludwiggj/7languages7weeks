(1..10).each do |i|
  puts "This is line #{i}"
end

(11..20).to_a.reverse.each {|i| puts "This is line #{i}"}
(21..30).reverse_each {|i| puts "This is line #{i}"}