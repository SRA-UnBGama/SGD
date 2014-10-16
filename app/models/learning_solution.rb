class LearningSolution < ActiveRecord::Base
	validates_presence_of :description, :category
	#validates_uniqueness_of :description
end
