class EvaluationPeriod < ActiveRecord::Base
	resourcify
	has_many :phases

	validates_presence_of :start_date_evaluation, :end_date_evaluation
	validate :dates_are_valid, :minimum_period, :not_overlap_evaluation_period,
	:not_withdraw_phase_of_scope

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
		periods = EvaluationPeriod.all

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

 		self.phases.each do |phase|
 			start_phase = phase.start_date_phase
 			end_phase = phase.end_date_phase

 			if (today > start_phase) && (today > end_phase)
 				phase.update_attributes(:status_phase => "Encerrado")
 			elsif (today >= start_phase) && (today < end_phase)
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
 			self.update_attributes(:status_evaluation_period=>"Encerrado")
 		elsif( ( start_period < today ) and ( today < end_period ) )
 			self.update_attributes(:status_evaluation_period=>"Em Andamento")
 		else
 			self.update_attributes(:status_evaluation_period=>"Aguardando")
 		end
 	end

  PLANNING = 1
  MONITORING = 2
  FORMALIZATION = 3
  DEVELOPMENT_PLAN = 4

  def define_default_period_to_phases
      position = PLANNING

      start_date_period = self.start_date_evaluation
      end_date_period = self.end_date_evaluation
      phases = self.phases

      phases.each do |phase|
        case position
          when PLANNING
            phase.start_date_phase = start_date_period
            phase.end_date_phase = (end_date_period - 46.day)

          when MONITORING
            phase.start_date_phase = (end_date_period - 45.day)
            phase.end_date_phase = (end_date_period - 31.day)

          when FORMALIZATION
            phase.start_date_phase = (end_date_period - 30.day)
            phase.end_date_phase = (end_date_period - 16.day)

          when DEVELOPMENT_PLAN
            phase.start_date_phase = (end_date_period - 15.day)
            phase.end_date_phase = end_date_period
        end

        phase.save
        position += 1
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

		begin_period = self.start_date_evaluation
		end_period = self.end_date_evaluation

		if !evaluation_periods.empty?

			evaluation_periods.each do |evaluation_period|
				begin_current_period = evaluation_period.start_date_evaluation
				end_current_period = evaluation_period.end_date_evaluation

				if self.id == evaluation_period.id
	  				# Nothing To Do
        elsif !((begin_current_period.between?(begin_period, end_period)) or
          (end_current_period.between?(begin_period, end_period)) or
          ((begin_current_period <= begin_period) and (end_current_period >= end_period)))
	  			# Nothing To Do
        else
         errors.add( :start_date_evaluation, "O novo Período de avaliação não deve sobrepor um Período de avaliação já existente." )
        end
      end
    else
      # Nothing To Do
    end
  end

  def not_withdraw_phase_of_scope
    end_period = self.end_date_evaluation
    start_period = self.start_date_evaluation

    end_last_phase = self.phases.last.end_date_phase

    if end_period >= (start_period + 59.days)
      self.define_default_period_to_phases
    else
      errors.add( :end_date_evaluation, "A mudança de datas retira uma das fases da abrangência do período avaliativo" )
    end
  end

  private

  ########## CREATION OF PHASES ##########
  def create_phases
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

  def EvaluationPeriod.get_current_name_phase
    period_in_progress = EvaluationPeriod.where(:status_evaluation_period => "Em Andamento")
    if period_in_progress.count == 1
      phase = Phase.find_by_status_phase("Em Andamento").phase_name
    else
      phase = "Não há fase em andamento no momento."
    end

    phase
  end

  def define_name_description( phases )
    position = PLANNING

    phases.each do |phase|
      case position
      when PLANNING
        phase.update_attributes(:phase_name => "Planejamento",
          :phase_description => "Definição das metas da equipe e orientação quanto ao funcionamento do sistema, quanto às competências esperadas")

      when MONITORING
        phase.update_attributes(:phase_name => "Acompanhamento",
          :phase_description => "Análise e orientação sobre a expressão de competências e o alcance das metas")

      when FORMALIZATION
        phase.update_attributes(:phase_name => "Formalização",
          :phase_description => "Formalização da avaliação de desempenho e retomada dos registros do ano para embasamento da tomada de decisão")

      when DEVELOPMENT_PLAN
        phase.update_attributes(:phase_name => "Plano de Desenvolvimento", :phase_description => "Discussão sobre as soluções de aprendizagem mais adequadas à situação do servidor")
      end
        position += 1
    end
  end
end
