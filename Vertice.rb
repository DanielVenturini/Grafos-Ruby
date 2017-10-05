class Vertice

	private
	attr_accessor :id, :cor, :tempo, :largura

	public
		def initialize id
			@id = id
			@cor = "B"
			@tempo = 0
			@largura = 0
		end

	def getId
		id
	end

	def setId id
		@id = id
	end

	def setTempo tempo
		@tempo = tempo
	end

	def getTempo
		tempo
	end

	def getCor
		cor
	end

	def setCor cor
		@cor = cor
	end

	def setLargura largura
		@largura = largura
	end

	def getLargura
		largura
	end

end