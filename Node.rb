class Node

	private
	attr_accessor :left, :right, :value

	public
	def initialize value
		@value = value
		left = nil
		right = nil
	end

	def setLeft left
		@left = left
	end

	def getLeft
		left
	end

	def setRight right
		@right = right
	end

	def getRight
		right
	end

	def setValue value
		@value = value
	end

	def getValue
		value
	end

end