filename='news.txt'
lines = []
File.open(filename, 'rb') do |file|
  file.each_line do |line|
    lines << line
  end
end

lines.each_with_index {|line,line_no| puts "#{line_no+1} => wc [" + line.split.size.to_s + "] => #{line}"}

wc = lines.inject(0){|wc, line| wc + line.split.size}
noLines = lines.size
puts "Lines [" + noLines.to_s + "]"
puts "Word Count [" + wc.to_s + "]"
puts "Avg Line Size = " + (wc/noLines).to_s