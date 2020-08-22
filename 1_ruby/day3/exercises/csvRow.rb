class CsvRow
  def method_missing name, *args
    puts "Hi"
	@row_hash[name.to_s]
  end

  attr_accessor :row_hash

  def initialize(row_hash)
      @row_hash = row_hash
  end
end

c = CsvRow.new({"one" => "two"})
puts c.one