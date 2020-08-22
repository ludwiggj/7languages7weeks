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

def display_node(node, level)
  print "[" + node.node_name + "," + level.to_s + "] "
end

def visit_tree(tree)
  print "Visit tree => "
  tree.visit_all (0) {|node, level| display_node(node, level)}
  puts
end

def visit_node(tree)
  print "Visit node => "
  tree.visit(0) { |node,arg| display_node(node, arg) }
  puts
end

tree1 = Tree.new("Ruby", [Tree.new("Reia"), Tree.new("MacReady")])

visit_tree(tree1)
visit_node(tree1)

tree2 = Tree.new("Emerald")

visit_tree(tree2)
visit_node(tree2)

treeC = Tree.new("C")
treeB = Tree.new("B", [treeC])
treeA = Tree.new("A", [treeB])

visit_tree(treeA)
visit_node(treeA)

forest = [tree1, tree2, treeC, treeB, treeA]
forest.each {|tree| visit_tree(tree)}