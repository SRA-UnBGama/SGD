class Goal < EvaluationItem
	resourcify
	validates_presence_of :name, :deadline, :description

	validate :deadline_greater_than_today

	def deadline_greater_than_today
	  today = Date.current
	  deadline = self.deadline

	  if deadline != nil && Date.today >= deadline 
		errors.add(:deadline, "O prazo deve ser após a data de hoje.")
	  else
			#Nothing to do
	  end
	end
end