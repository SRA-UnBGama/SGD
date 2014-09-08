class Evaluation < ActiveRecord::Base
	has_and_belongs_to_many :competences
	has_and_belongs_to_many :goals
end
