require_relative 'Vertice'

class Grafo

		def initialize isGrafo
			@grafo = Hash.new
			@isGrafo = isGrafo
			@tempo = 1
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

	def addVertice vertice
		vertice = Vertice.new vertice
		grafo[vertice] = []
		vertice
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

	def profundidadeR key
		@tempo = @tempo+1
		key.setTempo tempo
		key.setCor "C"

		grafo[key].each do |vertice|
			profundidadeR vertice if vertice.getCor == "B"
		end

		key.setTempo tempo
		key.setCor "P"
		@tempo = @tempo+1
	end

	def larguraR key
		lista = []
		lista << key

		while !lista.empty?

			key = lista.delete_at(0)
			key.setCor "P"

			grafo[key].each do |vertice|
				next if vertice.getCor != "B"
				vertice.setCor "C"
				vertice.setLargura key.getLargura+1
				lista << vertice
			end
		end
	end

public

	def addAresta key, mapped
		v = get key
		vv = get mapped

		if v == nil
			v = addVertice key
		end
		if vv == nil
			vv = addVertice mapped
		end

		if isGrafo == false
			grafo[v] << vv
			return
		end

		grafo[v] << vv
		grafo[vv] << v
	end

	def printg
		if grafo.size == 0
			puts "Grafo nao possui valores."
			return
		end

		grafo.each do |key, mapped|
			print "#{key.getId} => "
			mapped.each{|map| print "#{map.getId} "}
			puts ""
		end
	end

	def profundidade toReset, toPrint	#se o 'toReset' for true, então será resetado a cor e o tempo de cada vertice
		grafo.each do |key, mapped|
			profundidadeR key if key.getCor == "B"
		end

		printTempo if toPrint == true
		resetVertice if toReset == true
		@tempo = 0
	end

	def largura key, toReset, toPrint
		if isGrafo == false
			puts "Impossivel realizar a busca em largura em Digrafo."
			return
		end

		key = get key
		return if key == nil

		larguraR key

		printLargura if toPrint == true
		resetVertice if toReset == true
	end
end

grafo = Grafo.new true
grafo.addAresta "u", "v"
grafo.addAresta "v", "y"
grafo.addAresta "u", "x"
grafo.addAresta "y", "x"
grafo.addAresta "x", "v"
grafo.addAresta "w", "y"
grafo.addAresta "w", "z"
grafo.addAresta "z", "z"

#grafo.printg
#grafo.profundidade true, false
grafo.largura "v", true, true