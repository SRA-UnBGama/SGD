class Phase < ActiveRecord::Base
  resourcify
  belongs_to :evaluation_period
  validate :dates_are_valid, :minimum_period_phase


  def dates_are_valid
    if self.end_date_phase.present? && self.start_date_phase.present?

	    if end_date_phase < start_date_phase
	    	errors.add(:end_date_phase, "A data final deve ser após a data de início do intervalo.")
	    	logger.debug "erro na date"
	    end
	else
			#Nothing to do
	end
  end

  def minimum_period_phase

  	if self.end_date_phase.present? && self.start_date_phase.present?
		if end_date_phase < (start_date_phase+14.days)
			errors.add(:end_date_phase, "Período deve ser superior à 15 dias")
			logger.debug "erro na minimum"
		else
			#Nothing to do
		end
	else
		#nothing to do
	end
  end

  def not_overlap_phases
	  	phases = self.evaluation_period.phases

	if phases.first.start_date_phase.present?

		if phases.first.start_date_phase < self.evaluation_period.start_date_evaluation

			errors.add(:end_date_evaluation, "A fase de planejamento deve começar após o início do período de avaliação")
			logger.debug "erro na overlap"
		else
			#nothing to do
		end
	else
		#nothing to do
	end
  end
end