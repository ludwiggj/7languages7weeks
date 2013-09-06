#!/usr/bin/ruby

class Tree
        attr_accessor :children, :node_name

        def initialize (h={})
                @node_name = h.keys.first
                @children = []
                h[@node_name].each {|node,value|
				  @children.push Tree.new({node=>value})
				}
        end

        def visit_all(arg, &block)
          visit(arg, &block)
	      children.each {|c| c.visit_all(arg.to_i + 1, &block)}
        end
  
        def visit(arg, &block)
          block.call(self, arg)
        end
end # class

def display_node(name, level)
  (level*3).times {print " "}
  puts "[" + name + "] "
end

tree1 = Tree.new({'grandad' => {'dad' => {'child1' => {}, 'child2' => {}}, 'uncle' => {'child3' => {}, 'child4' => {}}}})

tree1.visit_all(0) {|node,arg| display_node(node.node_name, arg)}