require_relative 'Vertice'
require_relative 'Aresta'
#require_relative 'Tree'
require_relative 'Graphviz'

class Grafo

		def initialize isGrafo
			@grafo = Hash.new
			@isGrafo = isGrafo
			@tempo = 0
		end

	private
	attr_accessor :grafo, :tempo, :isGrafo #se o 'isGrafo' for false, então será criado um digrafo.

	def get id
		if grafo.size == 0
			return nil
		end

		keys = grafo.keys
		keys.each do |key|
			return key if key.getId == id
		end

		return nil
	end

	def fullkey
		array = []
		grafo.each do |key, mapped| array << key end
		array
	end

	def resetVertice
		grafo.each do |key, mapped|
			key.setCor "B"
			key.setTempo 0
			key.setLargura 0
		end
		tempo = 0
	end

	def printTempo
		grafo.each do |key, mapped|
			puts "#{key.getId} : #{key.getTempo}"
		end
	end

	def printLargura
		grafo.each do |key, mapped|
			puts "#{key.getId} : #{key.getLargura}"
		end
	end

	def profundidadeR key, isTopologicaArray	#se for chamado por uma ordenacao topologica, será diferente de nil
		@tempo = @tempo+1
		key.setTempo tempo
		key.setCor "C"

		grafo[key].each do |aresta|
			vertice = aresta.getVerticeAdjacente
			profundidadeR vertice, isTopologicaArray if vertice.getCor.eql? "B"
		end

		key.setCor "P"
		@tempo = @tempo+1
		key.setTempo tempo-key.getTempo
		isTopologicaArray << key unless isTopologicaArray.nil?	#tinha que ser adicionado ao inicio, mas na hora de printar é começado em -1
	end

	def larguraR key
		lista = []
		lista << key

		while !lista.empty?

			key = lista.delete_at(0)
			key.setCor "P"

			grafo[key].each do |aresta|
				vertice = aresta.getVerticeAdjacente

				next if vertice.getCor != "B"
				vertice.setCor "C"
				vertice.setLargura key.getLargura+1
				lista << vertice
			end
		end
	end

public

	def addVertice vertice
		vertice = Vertice.new vertice
		grafo[vertice] = []
		vertice
	end

	def addAresta key, mapped, peso
		v1 = get key
		v2 = get mapped

		if v1.nil?
			v1 = addVertice key
		end
		if v2.nil?
			v2 = addVertice mapped
		end

		grafo[v1] << (Aresta.new v2, peso)
		grafo[v2] << (Aresta.new v1, peso) if isGrafo.eql? true
	end

	def printg
		if grafo.size.eql? 0
			puts "Grafo nao possui valores."
			return
		end

		puts "Printando o Grafo"
		grafo.each do |key, mapped|
			print "#{key.getId} => "
			mapped.each{ |aresta| print "#{aresta.getVerticeAdjacente.getId} " }
			puts ""
		end
		puts ""
	end

	def profundidade toReset, toPrint	#se o 'toReset' for true, então será resetado a cor e o tempo de cada vertice
		grafo.each do |key, mapped|
			profundidadeR key, nil if key.getCor.eql? "B"	#passando nil, pois nao queremos um array para ordenacao topológica, apenas queremos a profundidade
		end

		printTempo if toPrint.eql? true
		resetVertice if toReset.eql? true
		@tempo = 0
	end

	def largura key, toReset, toPrint
		if isGrafo.eql? false
			puts "Impossivel realizar a busca em largura em Digrafo."
			return
		end

		key = get key
		return if key.nil?

		larguraR key

		printLargura if toPrint.eql? true
		resetVertice if toReset.eql? true
	end

	def ordenacaoTologica	#a ordenação varia de acordo com a inserção
		array = []
		grafo.each do |key, mapped|
			profundidadeR key, array if key.getCor == "B"
		end

		puts "Ordenação Topológica"
		for i in (1..array.size)
			print "#{array[-i].getId} "
		end
		puts ""
	end

	def toGraphviz
		return if grafo.size.eql? 0

		arq = File.new("arvore.dot", "w+")
		arq.puts "digraph BST {"
		arq.puts "node [fontname=\"Arial\"];"

		grafo.each do |key, mapped|
			mapped.each do |aresta|
				arq.puts "#{key.getId} -> #{aresta.getVerticeAdjacente.getId} [label=\"#{aresta.getPeso}\"];"
			end
		end

		arq.puts "}"
		arq.close

		Graphviz.new "arvore.dot"
	end

end

grafo = Grafo.new false					#false é para digrafo, e true para grafo

grafo.addAresta "a", "b", 4
grafo.addAresta "b", "c", 8
grafo.addAresta "c", "i", 2
grafo.addAresta "c", "f", 4
grafo.addAresta "c", "d", 7
grafo.addAresta "d", "e", 9
grafo.addAresta "f", "g", 2
grafo.addAresta "g", "h", 1

grafo.toGraphviz
#grafo.printg
#grafo.largura "meia", true, true		#(resetar vertice?, imprimir vertices?)
#grafo.profundidade true, true		#(resetar vertice?, imprimir vertices?)
#grafo.ordenacaoTologica