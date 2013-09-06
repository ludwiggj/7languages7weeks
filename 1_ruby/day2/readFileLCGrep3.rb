filename='news.txt'        

def display_line(line, lineNumber)
  puts "#{lineNumber} => wc [" + line.split.size.to_s + "] => #{line}"
end

def display_line_match(matchRegex, line, lineNumber)
  if line =~ matchRegex
    display_line(line, lineNumber)
  end
end

class IO
  def each_with_line_count
    each {|line| yield line, lineno}
  end
end

targetPhrase = /recovery/

File.open(filename, 'rb') do |file|
  file.each_with_line_count do |line, lineNumber|
    #display_line(line, lineNumber)
	display_line_match(targetPhrase, line, lineNumber)
  end
end