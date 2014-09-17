class Goal < ActiveRecord::Base
	has_and_belongs_to_many :forms

	validates_presence_of :name_goal, :deadline_goal, :description_goal
end
