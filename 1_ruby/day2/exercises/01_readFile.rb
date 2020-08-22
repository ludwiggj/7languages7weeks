filename='news.txt'
contents = File.open(filename, 'r') { |file| file.read }
puts contents