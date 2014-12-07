class Competence < EvaluationItem
	resourcify
	validates_presence_of :name
	validate :max_number_of_competence

	def max_number_of_competence
		max = 10

		if(Competence.where(:is_active => true).count >= max && self.is_active == true)
			errors.add( :name,"O número de competências deve ser menor que 10.")
		else
			#nothing to do!
		end

	end
end
