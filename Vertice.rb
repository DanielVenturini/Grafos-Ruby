class Vertice

	attr_accessor :id, :cor

		def initialize(id)
			@id = id
			@cor = "B"
		end

	def getId
		id
	end

	def setId(id)
		@id = id
	end

	def getCor
		cor
	end

	def setCor(cor)
		@cor = cor
	end

end