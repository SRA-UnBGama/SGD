class Evaluation < ActiveRecord::Base
	belongs_to :user
	has_many :evaluation_items
	has_many :learning_solutions
end
