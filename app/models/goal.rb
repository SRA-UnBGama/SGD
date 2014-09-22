class Goal < ActiveRecord::Base
	has_and_belongs_to_many :forms

	validates_presence_of :name_goal, :deadline_goal, :description_goal

	validate :deadline_greater_than_today

	def deadline_greater_than_today
	  today = Date.current
	  deadline = self.deadline_goal

	  if deadline != nil && Date.today >= deadline 
		errors.add(:deadline_goal, "O prazo deve ser após a data de hoje.")
	  else
			#Nothing to do
	  end
	end
end