class Competence < EvaluationItem
	validates_presence_of :name, :category


	def max_number_of_competence
		max = 10

		if(Competence.where(:is_active => true).count >= max && self.is_active = false)
			errors.add( :name,"O número de competências deve ser menor que 10.")
		else
			#nothing to do!
		end

	end
end
