def call_block(&block)
  block.call
end

def pass_block(&block)
  call_block(&block)
end

pass_block {print "Hi"}
call_block {puts " there!"}
pass_block {(1..5).each {|i| print i.to_s + " "}}