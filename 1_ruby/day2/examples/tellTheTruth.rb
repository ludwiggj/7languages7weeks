def tellTheTruth(options={})
  if options[:profession] == :lawyer
    puts 'you\'re a lawyer!'
  else
    puts true
  end
 end
 
 tellTheTruth(:profession => :lawyer)
 puts :profession
 puts :lawyer
 puts profession
 puts lawyer