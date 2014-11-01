class EvaluationItem < ActiveRecord::Base
	validates_presence_of :name, :category
end
