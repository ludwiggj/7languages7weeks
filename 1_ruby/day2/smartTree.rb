class Tree
  attr_accessor :children, :node_name
  
  def initialize(h={})
    h.each_pair do |k,v|
      @node_name = k
	  @children = []
	  v.each_pair do |k1,v1|
		childHash = {}
		childHash[k1] = v1 
	    @children.push Tree.new(childHash)
	  end
	  #puts "Node name [" + @node_name.to_s + "]"
      #print "Children "
	  #p @children
    end	  
  end
  
  def visit_all(arg, &block)
    visit(arg, &block)
	children.each {|c| c.visit_all(arg.to_i + 1, &block)}
  end
  
  def visit(arg, &block)
    block.call(self, arg)
  end
 end
 
def display_node(name, level)
  (level*3).times {print " "}
  puts "[" + name + "] "
end
  
tree1 = Tree.new({'grandad' => {'dad' => {'child1' => {}, 'child2' => {}}, 'uncle' => {'child3' => {}, 'child4' => {}}}})
tree1.visit_all(0) do |node,arg|
  display_node(node.node_name, arg)
end