module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def acts_as_csv
	  include InstanceMethods
	end
  end
  
  module InstanceMethods

    # My version  
#   def each
#      @result.each do |row|
#	    columnValueHash = CsvRow.new
#		row.each_with_index{|value,index| columnValueHash[@headers[index]]=value}
#	    yield columnValueHash
#	  end
#   end
	
	# An alternative version
	def each(&block)
      @result.each do |row|
	    columnValueHash = CsvRow.new
		row.each_with_index{|value,index| columnValueHash[@headers[index]]=value}
        block.call columnValueHash
      end
    end
	
    def read
      file = File.new(self.class.to_s.downcase + '.txt')
	  @headers = file.gets.chomp.split(',')
	
	  file.each do |row|
	    @result << row.chomp.split(',')
	  end
    end
  
    def headers
      @headers.class
    end
  
    def csv_contents
      @result
    end
  
    def initialize
      @result = []
	  read
    end
  end
end

class CsvRow < Hash
  def method_missing(name)
    return self[name.to_s]
  end
end

class RubyCSVExercise
  include ActsAsCsv
  acts_as_csv
end

csv = RubyCSVExercise.new

csv.each {|row| puts row.one}
csv.each {|row| puts row.two}
csv.each {|row| puts row.absentColumn}