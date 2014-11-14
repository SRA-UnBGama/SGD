class LearningSolution < ActiveRecord::Base
	resourcify
	belongs_to :evaluation

	validates_presence_of :description, :category
end
