puts 'String replacement'
s = "String"
s[1]='p'
puts s
"hello".gsub(/([aeiou])/, '<\1>')

puts '1. Print "Hello World"'
puts 'Hello world'

puts '2. "Hello, Ruby". Find index of "Ruby"'
ind = "Hello, Ruby".index('Ruby')
puts "#{ind}"

puts '3. Print name 10 times'
x = 0
while x < 10
  x = x + 1
  puts 'Graeme'
end

puts '4. Count sentences'
x = 0
while x < 10
  x = x + 1
  puts "This is sentenct #{x}"
end