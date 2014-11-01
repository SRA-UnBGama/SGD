class Competence < ActiveRecord::Base
	validate :max_number_of_competence

	def max_number_of_competence
		max = 10

		if(Competence.where(:is_active_competence => true).count >= max && self.is_active_competence = false)
			errors.add( :name_competence,"O número de competências deve ser menor que 10.")
		else
			#nothing to do!
		end

	end
end
