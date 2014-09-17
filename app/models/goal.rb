class Goal < ActiveRecord::Base
	has_and_belongs_to_many :forms

	validates_presence_of :name_goal, :deadline_goal, :description_goal

	validate :deadline_greater_than_today

	def deadline_greater_than_today
	  today = Date.today.to_formatted_s(:db)
	  deadline = self.deadline_goal.to_formatted_s(:db)

	  if deadline < today
		errors.add(:deadline_goal, "O prazo deve ser após a data de hoje.")
	  else
			#Nothing to do
	  end
	end
end