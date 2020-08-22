filename='../news.txt'

File.open(filename, 'rb') do |file|
  matches = file.select {|v| v =~ /Greece/}
  puts
  puts "There are #{matches.size} match(es)"
  puts
  matches.each_with_index {|match, index| puts "Match #{index+1} => #{match}"}
end