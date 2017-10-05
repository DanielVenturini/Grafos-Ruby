require_relative 'Vertice'

class Aresta

	private
	attr_accessor :peso, :verticeAdjacente

	public
		def initialize verticeAdjacente, peso
			@verticeAdjacente = verticeAdjacente
			@peso = peso
		end

	def getPeso
		peso
	end

	def setPeso peso
		@peso = peso
	end

	def getVerticeAdjacente
		verticeAdjacente
	end

	def setVerticeAdjacente verticeAdjacente
		@verticeAdjacente = verticeAdjacente
	end
end