filename='news.txt'
f = File.open(filename, 'r')
contents = f.read
puts contents
f.close