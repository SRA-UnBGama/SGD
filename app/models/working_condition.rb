class WorkingCondition < ActiveRecord::Base
	has_and_belongs_to_many :forms
	validates_presence_of :name_working_condition
	validates_uniqueness_of :name_working_condition
	validate :max_number_of_working_conditions

	def max_number_of_working_conditions
		max = 10

		if(WorkingCondition.where(:is_active_working_condition => true).count >= max && self.is_active_working_condition = false)
			errors.add( :name_competence,"O número de condições de trabalho deve ser menor que 10.")
		else
			#nothing to do!
		end

	end
end
