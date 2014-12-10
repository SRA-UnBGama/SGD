class Phase < ActiveRecord::Base
  resourcify
  belongs_to :evaluation_period
  validate :dates_are_valid, :minimum_period_phase, :verify_inside_period, :not_overlap_phases


  def dates_are_valid
    if self.end_date_phase.present? && self.start_date_phase.present?

	    if end_date_phase < start_date_phase
	    	errors.add(:end_date_phase, "A data final deve ser após a data de início do intervalo.")
	    end
	else
			# Nothing To Do
	end
  end

  def minimum_period_phase

  	if self.end_date_phase.present? && self.start_date_phase.present?
		if end_date_phase < (start_date_phase+14.days)
			errors.add(:end_date_phase, "Período deve ser superior à 15 dias")
		else
			# Nothing To Do
		end
	else
		# Nothing To Do
	end
  end

  	def verify_inside_period
		if self.evaluation_period
			period = self.evaluation_period

			if ((self.start_date_phase >= period.start_date_evaluation) and
				(self.end_date_phase <= period.end_date_evaluation))

				# Nothing To Do
			else
				errors.add(:start_date_phase, "A fase deve estar contida no período de avaliação.")
			end
 		else
 			# Nothing To Do
 		end
	end

  PLANNING = 1
  MONITORING = 2
  FORMALIZATION = 3
  DEVELOPMENT_PLAN = 4

  	def not_overlap_phases

	  	if !self.evaluation_period.nil?
		  	phases = self.evaluation_period.phases
		  	name_phase = self.phase_name

		  	if name_phase == "Planejamento"
		  		position = PLANNING
		  	elsif name_phase == "Acompanhamento"
		  		position = MONITORING
			elsif name_phase == "Formalização"
		  		position = FORMALIZATION
		  	elsif name_phase == "Plano de Desenvolvimento"
		  		position = DEVELOPMENT_PLAN
		  	else
		  		# Nothing To Do
		  	end

		  	case position
			  	when PLANNING
			  		if self.end_date_phase <= phases.second.start_date_phase
			  			# Nothing To Do
			  		else
			  			errors.add(:end_date_phase, 
			  				"O período da fase de Planejamento não deve sobrepor o período da fase de Acompanhamento.")
			  		end

			  	when MONITORING
			  		if( self.start_date_phase >= phases.first.end_date_phase and
			  			self.end_date_phase <= phases.third.start_date_phase )

			  			# Nothing To Do
			  		else
			  			errors.add(:end_date_phase, 
			  				"O período da fase de Acompanhamento não deve sobrepor o período da fase de Planejamento ou de Formalização.")
			  		end

				when FORMALIZATION
					if( self.start_date_phase >= phases.second.end_date_phase and
			  			self.end_date_phase <= phases.fourth.start_date_phase )

			  			# Nothing To Do
			  		else
			  			errors.add(:end_date_phase,
			  				"O período da fase de Formalização não deve sobrepor o período da fase de Acompanhamento ou de Plano de Desenvolvimento.")
			  		end
				when DEVELOPMENT_PLAN
					if( self.start_date_phase >= phases.third.end_date_phase )

			  			# Nothing To Do
			  		else
			  			errors.add(:end_date_phase,
			  				"O período da fase de Plano de Desenvolvimento não deve sobrepor o período da fase de Formalização.")
			  		end
			  	else
			  		#Nothing to do
			end
		else
			# Nothing To Do
		end
  	end
end
