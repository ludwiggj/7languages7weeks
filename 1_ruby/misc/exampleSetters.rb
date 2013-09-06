class Example
	attr_writer :symboll
	attr_writer "stringg"
	attr_reader :symboll, "stringg"
	attr_accessor :groovy
	
	def initialize(symboll, stringg, groovy)  
     @symboll = symboll  
     @stringg = stringg  
     @groovy = groovy
    end  

	def show_symboll
		puts @symboll
	end

	def show_stringg
		puts @stringg
	end
	
	def show_groovy
		puts @groovy
	end
end

example = Example.new(nil, nil, nil)
puts '[' + example.symboll().nil?.to_s + ']'
puts '[' + example.stringg().nil?.to_s + ']'
puts '[' + example.groovy().nil?.to_s + ']'
example.symboll="ITS A SYMBOL"
example.stringg="ITS A STRING"
example.groovy="ITS GROOVY"

puts example.symboll
puts example.stringg
puts example.groovy

example.show_symboll
example.show_stringg
example.show_groovy

anotherExample = Example.new(1, 2, 3)
puts '[' + anotherExample.symboll().nil?.to_s + ']'
puts '[' + anotherExample.stringg().nil?.to_s + ']'
puts '[' + anotherExample.groovy().nil?.to_s + ']'
anotherExample.show_symboll
anotherExample.show_stringg
anotherExample.show_groovy