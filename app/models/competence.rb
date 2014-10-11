class Competence < ActiveRecord::Base
	has_and_belongs_to_many :forms
	validates_presence_of :name_competence
#	validates_presence_of :type_competence
#	validates_uniqueness_of :type_competence
	validates_uniqueness_of :name_competence
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
