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
  
    def each
      @result.each do |row|
	    columnValueHash = {}
		row.each_with_index{|value,index| columnValueHash[@headers[index]]=value}
	    yield CsvRow.new columnValueHash
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

class CsvRow
  attr_accessor :row_hash
  
  def method_missing(name)
    @row_hash[name.to_s]
  end

  def initialize(row_hash)
    @row_hash = row_hash
  end
end

class RubyCSVExercise
  include ActsAsCsv
  acts_as_csv
end

csv = RubyCSVExercise.new
puts "Column one"
csv.each {|row| puts row.one}
puts "Column two"
csv.each {|row| puts row.two}