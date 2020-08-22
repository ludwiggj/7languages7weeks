filename='../news.txt'

File.open(filename, 'rb') do |file|
  file.each do |line|
    puts "#{file.lineno} => wc [" + line.split.size.to_s + "] => #{line}"
  end
  file.rewind
  puts "Lines [" + file.lines.count.to_s + "]"
  file.rewind
  puts "Word Count [" + file.lines.inject(0){|wc, line| wc + line.split.size}.to_s + "]"
end