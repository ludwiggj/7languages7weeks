rainbow = ["red", "orange", "yellow", "green", "blue", "indigo", "violet"]
rainbowHash = {}

rainbow.each_with_index{|item,index| rainbowHash[index]=item}

rainbowHash.sort.map {|k,v| puts "#{k} => #{v}"}