#!/usr/bin/ruby

class Tree
  attr_accessor :children, :node_name

  def initialize (h={})
    if self.class == Tree
      raise 'Doh! You are trying to instantiate a Tree!'
    end
  end

  def visit_all(arg, &block)
    visit(arg, &block)
	children.each {|c| c.visit_all(arg.to_i + 1, &block)}
  end

  def visit(arg, &block)
    block.call(self, arg)
  end

  def display_node(name, level)
    (level*3).times {print " "}
    puts "[" + name + "] "
  end

  def to_s
    visit_all(0) {|node,arg| display_node(node.node_name, arg)}
  end
end # class


# First version
class Tree1 < Tree
  def initialize(h={})
    h.each_pair do |k,v|
      puts "Pair k #{k} v #{v}"
      @node_name = k
	  @children = []
	  v.each_pair do |k1,v1|
	    puts "Pair k1 #{k1} v1 #{v1}"
	    childHash = {}
	    childHash[k1] = v1
	    @children.push Tree1.new(childHash)
	  end
    end
  end
end

# Second version
class Tree2 < Tree
  def initialize (h={})
    @node_name = h.keys.first
    puts "node_name #{@node_name}"
    @children = []
    h[@node_name].each {|node,value|
      puts "node #{node}, value #{value}"
  	  @children.push Tree2.new({node=>value})
  	}
  end
end

treeHash = {'grandad' => {'dad' => {'child1' => {}, 'child2' => {}}, 'uncle' => {'child3' => {}, 'child4' => {}}}}

puts "Tree1..."
puts Tree1.new(treeHash)

puts "Tree2..."
puts Tree2.new(treeHash)

puts Tree.new(treeHash)