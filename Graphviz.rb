class Graphviz

	def initialize filename
		plot filename
	end

	def plot filename
		Kernel.system ("gvedit " + filename)
	end

end