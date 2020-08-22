max = 15
target = rand(max)
puts "Target = #{target}"
low = (0..target-1)
while true
  print "Guess > "
  guess = gets.to_i
  if guess < 0
    then puts "#{guess} is negative!"
  else
    case guess
      when target then print "Got it!"; break
      when low then puts "#{guess} is too low"
      else puts "#{guess} is too high"
    end
  end
end