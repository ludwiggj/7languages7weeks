def meth_captures(arg, &block)
  block.call( arg, 0 ) + block.call( arg.reverse , 1 )
end

meth_captures('pony') do |word, num|
  puts "in callback! word = #{word.inspect}, num = #{num.inspect}"
  puts "in callback! word = #{word}, num = #{num}"
  word + num.to_s
end
