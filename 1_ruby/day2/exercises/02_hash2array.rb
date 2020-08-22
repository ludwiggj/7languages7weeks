class TrafficState
  attr_accessor :colour, :meaning
  def initialize(colour, meaning)
    @colour = colour
	@meaning = meaning
  end

  def show()
    puts "[" + colour + " => " + meaning + "]"
  end
end

trafficLights={"red" => "stop", "amber" => "pause", "green" => "go"}

#ts = TrafficState.new("blue", "malfunction")
#puts ts.colour + " " + ts.meaning

puts "hash2array..."
trafficArray = []
trafficLights.each_pair {|key,value| trafficArray.push(TrafficState.new(key, value))}
puts "Traffic light states [" + trafficArray.size.to_s + "]"
trafficArray.each {|stage| stage.show}

puts "Now the quick way!"
trafficArray = trafficLights.to_a
puts "Traffic light states [" + trafficArray.size.to_s + "]"
puts trafficArray