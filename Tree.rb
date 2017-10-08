require_relative 'Node'

class Tree

		def initialize root
			@root = root
			@size = 0
		end

	private
	attr_accessor :root, :size

	def insertR root, node
		return Node.new node if root.nil?

		if node >= root.getValue
			root.setRight insertR root.getRight, node
		else
			root.setLeft insertR root.getLeft, node
		end

		root
	end

	def printTR node
		return if node.nil?

		print "#{node.getValue} "
		printTR node.getLeft
		printTR node.getRight
	end

	public
	def getRoot
		root
	end

	def insert node
		@root = insertR @root, node
	end

	def printT
		puts "Printando arvore."
		printTR root
	end

end

tree = Tree.new nil

tree.insert 8
tree.insert 3
tree.insert 1
tree.insert 6
tree.insert 7
tree.insert 4
tree.insert 10
tree.insert 14
tree.insert 13

tree.printT