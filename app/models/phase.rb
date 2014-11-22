class Phase < ActiveRecord::Base
  resourcify
  belongs_to :evaluation_period
  validate :dates_are_valid, :minimum_period_phase, :verify_inside_period


  def dates_are_valid
    if self.end_date_phase.present? && self.start_date_phase.present?

	    if end_date_phase < start_date_phase
	    	errors.add(:end_date_phase, "A data final deve ser após a data de início do intervalo.")
	    	logger.debug "erro na date"
	    end
	else
			# Nothing To Do
	end
  end

  def minimum_period_phase

  	if self.end_date_phase.present? && self.start_date_phase.present?
		if end_date_phase < (start_date_phase+14.days)
			errors.add(:end_date_phase, "Período deve ser superior à 15 dias")
			logger.debug "erro na minimum"
		else
			# Nothing To Do
		end
	else
		# Nothing To Do
	end
  end

 def verify_inside_period
  	period = self.evaluation_period

  	if ((self.start_date_phase >= period.start_date_evaluation) and
  	 (self.end_date_phase <= period.end_date_evaluation))
  		# Nothing To Do
  	else
  		errors.add(:start_date_phase, "A fase deve estar contida no paríodo de avaliação.")
  	end
  end

  def not_overlap_phases
	phases = self.evaluation_period.phases

	if phases.first.start_date_phase.present?

		if phases.first.start_date_phase < self.evaluation_period.start_date_evaluation

			errors.add(:end_date_evaluation, "A fase de planejamento deve começar após o 
				início do período de avaliação")

		else
			# Nothing To Do
		end
	else
		# Nothing To Do
	end
  end
end