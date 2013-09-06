class Tree
  attr_accessor :children, :node_name
  
  def initialize(name, children=[])
    @children = children
	@node_name = name
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
   print "[" + name + "," + level.to_s + "] "
 end
 
 def doTheTree(tree)
   print "Visit tree => "
   tree.visit_all(0) {|node,arg| display_node(node.node_name, arg)}
   puts
 end
 
 tree1 = Tree.new("Ruby", [Tree.new("Reia"), Tree.new("MacReady")])
 
 tree2 = Tree.new("Emerald")
 
 treeC = Tree.new("C")
 treeB = Tree.new("B", [treeC])
 treeA = Tree.new("A", [treeB])
 
 tree1.visit_all(1) do |node,arg| display_node(node.node_name, arg) end
 puts
 tree2.visit_all 1 do |node,arg| display_node(node.node_name, arg) end
 puts
 treeA.visit_all(1) do |node,arg| display_node(node.node_name, arg) end
 puts
 tree1.visit(0) {|node,arg| display_node(node.node_name, arg)}
 puts
 tree2.visit(0) {|node,arg| display_node(node.node_name, arg)}
 puts
 treeA.visit(0) {|node,arg| display_node(node.node_name, arg)}
 puts
 
 forest = [tree1, tree2, treeC, treeB, treeA]
 forest.each {|tree| doTheTree(tree)}