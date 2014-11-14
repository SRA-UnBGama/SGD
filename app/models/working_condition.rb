class WorkingCondition < EvaluationItem
	resourcify
	validates_presence_of :name
	validates_uniqueness_of :name
	validate :max_number_of_working_conditions

	def max_number_of_working_conditions
		max = 10

		if(WorkingCondition.where(:is_active => true).count >= max && self.is_active = false)
			errors.add( :name,"O número de condições de trabalho deve ser menor que 10.")
		else
			#nothing to do!
		end

	end
end
