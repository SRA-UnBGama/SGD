class EvaluationPeriod < ActiveRecord::Base
	resourcify
	has_many :phases

	validates_presence_of :start_date_evaluation, :end_date_evaluation
	validate :dates_are_valid, :minimum_period, :not_overlap_evaluation_period

	def initialize( *params )super( *params )
		self.phases << create_phases
 	end

 	def EvaluationPeriod.verify_status_phases
 		periods = EvaluationPeriod.all

		if !periods.nil?
			periods.each do |period|
				period.define_status_phases
			end
		else
			# Nothing To Do
		end
 	end

 	def EvaluationPeriod.verify_status_evaluation_period
 		periods =EvaluationPeriod.all

 		if !periods.nil?
 			periods.each do |period|
 				period.define_status_evaluation_period
 			end
 		else
 			# Nothing To Do
 		end
 	end

 	def define_status_phases
 		today = Date.today
 		start_phase = phase.start_date_phase
 		end_phase = phase.end_date_phase

		self.phases.each do |phase|
	        if (today > start_phase) && (today > end_phase)
				phase.update_attributes(:status_phase => "Encerrado")
			elsif (today > start_phase) && (today < end_phase)
				phase.update_attributes(:status_phase => "Em Andamento")
	        else
				phase.update_attributes(:status_phase => "Aguardando")
			end
      	end
    end

    def define_status_evaluation_period
    	today = Date.today
    	start_period = self.start_date_evaluation
    	end_period = self.end_date_evaluation

    	if( ( today > start_period ) and ( today > end_period ) )
    		self.update_attributes( :status_evaluation_period => "Encerrado" )
    	elsif( ( start_period < today ) and ( today < end_period ) )
    		self.update_attributes( :status_evaluation_period => "Em Andamento" )
    	else
    		# Nothing To Do
    	end
    end

  ########## VALIDATIONS ##########
	def dates_are_valid
		if self.end_date_evaluation.present? && self.start_date_evaluation.present?
			if end_date_evaluation < start_date_evaluation
				errors.add(:end_date_evaluation, "A data final deve ser após a data de início do 
					intervalo.")
			else
				# Nothing To Do
			end
		else
			# Nothing To Do
		end
	end

	def minimum_period
		if self.end_date_evaluation.present? && self.start_date_evaluation.present?

			if end_date_evaluation < (start_date_evaluation + 59.days)

				errors.add(:end_date_evaluation, "Período deve ser superior a 60 dias")
			else
				# Nothing to do
			end
		end
  	end

  	def not_overlap_evaluation_period
		evaluation_periods = EvaluationPeriod.all

		begin_evaluation = self.start_date_evaluation

		if !evaluation_periods.nil?
			evaluation_periods.each do |evaluation_period|
				begin_current_evaluation = evaluation_period.start_date_evaluation
				end_current_evaluation = evaluation_period.end_date_evaluation

	  			unless begin_evaluation.between?( begin_evaluation, end_current_evaluation )
	  				# Nothing To Do
	  			else
	  				errors.add( :start_date_evaluation, "O novo Período de avaliação não deve sobrepor 
	  					um Período de avaliação já existente." )
	  			end
	  		end
	  	else
	  		# Nothing To Do
	  	end
  	end

  	private

  		########## CREATION OF PHASES ##########
	  	def create_phases()
	       planing = Phase.new
	       monitoring = Phase.new
	       development_plan = Phase.new
	       formalization = Phase.new

	       phases = []

	       phases = initialize_phases(planing, monitoring, formalization, development_plan)

	       define_name_description( phases )

	       phases
		end

		def initialize_phases( planning, monitoring, development_plan, formalization )
			id_evaluation_period = EvaluationPeriod.count

			phases = []

			phases << planning
			phases << monitoring
			phases << development_plan
			phases << formalization

			phases.each do |phase|
				phase.evaluation_period_id = id_evaluation_period
			end

			phases
		end

	    PLANNING = 1
	    MONITORING = 2
	    FORMALIZATION = 3
	    DEVELOPMENT_PLAN = 4

		def define_name_description(phases)
			position = PLANNING

			phases.each do |phase|
				case position
					when PLANNING
						phase.update_attributes(:phase_name => "Planejamento",
				     		:phase_description => "Definição das metas da equipe e orientação quanto ao 
				     		funcionamento do sistema, quanto às competências esperadas")

					when MONITORING
				    	phase.update_attributes(:phase_name => "Acompanhamento",
				     		:phase_description => "Análise e orientação sobre a expressão de competências 
				     		e o alcance das metas")

					when FORMALIZATION
						phase.update_attributes(:phase_name => "Formalização",
				    		:phase_description => "Formalização da avaliação de desempenho e retomada 
				    		dos registros do ano para embasamento da tomada de decisão")   

					when DEVELOPMENT_PLAN
						phase.update_attributes(:phase_name => "Plano de Desenvolvimento",
				     		:phase_description => "Discussão sobre as soluções de aprendizagem mais 
				     		adequadas à situação do servidor")
				end

				position+=1
			end
		end
end
