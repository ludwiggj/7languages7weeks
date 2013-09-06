class Roman
  def self.method_missing name, *args
    roman = name.to_s
	roman.gsub!("IV", "IIII")
	roman.gsub!("IX", "VIIII")
	roman.gsub!("XL", "XXXX")
	roman.gsub!("XC", "LXXXX")
	roman.gsub!("IC", "LXXXXVIIII")
	
	(roman.count("I") +
	 roman.count("V") * 5 +
	 roman.count("X") * 10 +
	 roman.count("L") * 50 +
	 roman.count("C") * 100)
  end
end

puts Roman.XC
puts Roman.X
puts Roman.IX
puts Roman.XXXXII
puts Roman.IC