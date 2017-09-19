require_relative 'Vertice'

class Grafo

	attr_accessor :grafo

		def initialize()
			@grafo = Hash.new()
		end

	def get(id)
		if grafo.size == 0
			return nil
		end

		keys = grafo.keys
		keys.each{ |key|
			if key.getId == id
				return key
			else
				next
			end
		}
		
		return nil
	end

	def adiciona(key, mapped)
		vertice = get(key)
		if vertice == nil
			vertice = Vertice.new(key)
			grafo[vertice] = []
			grafo[vertice] << mapped
		else
			grafo[vertice] << mapped
		end
	end

	def print
		if grafo.size == 0
			puts "Grafo nao possui valores."
			return
		end

		grafo.each{|key, mapped| puts "#{key.getId} => #{mapped}"}
	end

end

grafo = Grafo.new
grafo.adiciona(2, 'DOIS')
grafo.adiciona(3, 'TRES')
grafo.adiciona(4, 'QUATRO')
grafo.adiciona(5, 'CINCO')
grafo.adiciona(2, 'TRES')
grafo.adiciona(6, 'SEIS')

grafo.print