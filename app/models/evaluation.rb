class Evaluation < ActiveRecord::Base
	has_and_belongs_to_many :user
	has_many :evaluation_items
	has_many :learning_solutions
end
