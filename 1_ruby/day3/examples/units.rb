class Numeric
  def inches
    print "[inches = #{self}] "
    self
  end

  def feet
    feet_to_inches = 12.inches
    print "[feet = #{self} * #{feet_to_inches}] "
    self * feet_to_inches
  end

  def yards
    yards_to_feet = 3.feet
    print "[yards = #{self} * #{yards_to_feet}] "
    self * yards_to_feet
  end

  def miles
    miles_to_feet = 5280.feet
    print "[miles = #{self} * #{miles_to_feet}] "
    self * miles_to_feet
  end

  def back
    self * -1
  end

  def forward
    self
  end
end

puts 7.inches
puts 7.feet
puts 7.yards
puts 7.miles

puts 10.miles.back
puts 2.feet.forward