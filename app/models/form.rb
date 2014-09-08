class Form < ActiveRecord::Base
	has_and_belongs_to_many :working_conditions
	has_and_belongs_to_many :goals
	has_and_belongs_to_many :competences
end
