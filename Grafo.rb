require_relative 'Vertice'

class Grafo

		def initialize isGrafo
			@grafo = Hash.new
			@isGrafo = isGrafo
		end

	private
	attr_accessor :grafo, :isGrafo

	def get id
		if grafo.size == 0
			return nil
		end

		keys = grafo.keys
		keys.each do |key|
			if key.getId == id
				return key
			end
		end

		return nil
	end

	def addVertice vertice
		vertice = Vertice.new vertice
		grafo[vertice] = []
		vertice
	end

	def profundidade vertice

	end

	public
	def fullkey
		array = []
		grafo.each do |key, mapped| array << key end
		array
	end


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

	def profundidade

	end

end

grafo = Grafo.new false
grafo.addAresta 2, 1
grafo.addAresta 3, 2
grafo.addAresta 4, 3
grafo.addAresta 5, 1
grafo.addAresta 2, 5
grafo.addAresta 6, 1

grafo.printg
puts "\n"