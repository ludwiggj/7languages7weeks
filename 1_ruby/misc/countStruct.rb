RFN = Struct.new :value do
  def <=>(o)
    o.value <=> value
  end
  def succ
    self.class.new(value - 1)
  end
end

print (RFN.new(5)..RFN.new(1)).to_a
puts
print (RFN.new(5)..RFN.new(1)).to_a.reverse