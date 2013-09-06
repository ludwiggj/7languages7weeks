def display_line_match(matchRegex, line, lineNumber)
  if matchRegex.nil? || (!matchRegex.nil? && (line =~ matchRegex))
    puts "#{lineNumber} => wc [" + line.split.size.to_s + "] => #{line}"
  end
end

class IO
  def each_with_line_count
    each {|line| yield line, lineno}
  end
end

def processFile(filename, &block)
  File.open(filename, 'rb') do |file|
    file.each_with_line_count do |line, lineNumber|
      block.call(line, lineNumber)
	end
  end
end

filename='news.txt'
targetPhrase = /US/

# First display all of file
puts "The whole file..."
puts
processFile(filename) {|line, lineNumber| display_line_match(nil, line, lineNumber)}
# Now just the lines that match the target phrase
puts
puts "Now just the lines that match the target phrase #{targetPhrase.to_s}"
puts
processFile(filename) {|line, lineNumber| display_line_match(targetPhrase, line, lineNumber)}