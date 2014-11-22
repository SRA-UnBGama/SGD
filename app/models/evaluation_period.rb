class EvaluationPeriod < ActiveRecord::Base
	resourcify
	has_many :phases

	validates_presence_of :start_date_evaluation, :end_date_evaluation
	validate :dates_are_valid, :minimum_period

	def initialize( *params )super( *params )
		self.phases << create_phases
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

				errors.add(:end_date_evaluation, "Período deve ser superior à 60 dias")
			else
				# Nothing to do
			end
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
