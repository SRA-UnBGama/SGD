class Competence < ActiveRecord::Base
	has_and_belongs_to_many :forms
	validates_presence_of :name_competence
#	validates_presence_of :type_competence
#	validates_uniqueness_of :type_competence
	validates_uniqueness_of :name_competence

end
