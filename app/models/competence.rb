class Competence < EvaluationItem
	resourcify
	validates_presence_of :name
	validate :max_number_of_competence

	def max_number_of_competence
		maximum_active_competence = 10
		all_active_competences = Competence.where(:is_active => true)
		number_active_competence = all_active_competences.where.not( id: self.id ).count

		if(number_active_competence >= maximum_active_competence && self.is_active == true)
			errors.add( :name, "O número de competências ativas deve ser menor que 10.")
		else
			# Nothing To Do
		end

	end
end
