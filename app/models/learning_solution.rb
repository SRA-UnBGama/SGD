class LearningSolution < ActiveRecord::Base
	belongs_to :evaluation

	validates_presence_of :description, :category
end
