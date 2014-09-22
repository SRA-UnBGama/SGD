class EvaluationPeriodsController < ApplicationController
  before_action :set_evaluation_period, only: [:show, :edit, :update, :destroy]

  # GET /evaluation_periods
  # GET /evaluation_periods.json
  def index
    @evaluation_periods = EvaluationPeriod.all
  end

  # GET /evaluation_periods/1
  # GET /evaluation_periods/1.json
  def show
  end

  # GET /evaluation_periods/new
  def new
    @evaluation_period = EvaluationPeriod.new

  end

  # GET /evaluation_periods/1/edit
  def edit
  end

  # POST /evaluation_periods
  # POST /evaluation_periods.json
  def create
    @evaluation_period = EvaluationPeriod.new(evaluation_period_params)
    @phases = create_phases
    @evaluation_period.phases << @phases


    respond_to do |format|
      if @evaluation_period.save
        define_name_description(@evaluation_period.phases)
        define_default_period_to_phases(@evaluation_period.phases)

        format.html { redirect_to phases_path, notice: 'Evaluation period was successfully created.' }
        format.json { render :show, status: :created, location: @evaluation_period }
      else
        format.html { render :new }
        format.json { render json: @evaluation_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evaluation_periods/1
  # PATCH/PUT /evaluation_periods/1.json
  def update
    respond_to do |format|
      if @evaluation_period.update(evaluation_period_params)
        format.html { redirect_to @evaluation_period, notice: 'Evaluation period was successfully updated.' }
        format.json { render :show, status: :ok, location: @evaluation_period }
      else
        format.html { render :edit }
        format.json { render json: @evaluation_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluation_periods/1
  # DELETE /evaluation_periods/1.json
  def destroy
    @evaluation_period.phases.destroy_all
    @evaluation_period.destroy

    respond_to do |format|
      format.html { redirect_to evaluation_periods_url, notice: 'Evaluation period was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evaluation_period
      @evaluation_period = EvaluationPeriod.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evaluation_period_params
      params.require(:evaluation_period).permit(:start_date_evaluation, :end_date_evaluation)
    end

    def evaluation_params_phases 
      params.require(:phases).permit(:start_date_evaluation , :end_date_evaluation )
    end

    def initialize_phases (planning, monitoring , development_plan, formalization )
      @planning = planning
      @monitoring = monitoring
      @formalization = formalization
      @development_plan = development_plan
      
      phases = []
      phases << @planning
      phases << @monitoring
      phases << @formalization
      phases << @development_plan
      phases
    
    end

    def create_phases()
       planing = Phase.new
       monitoring = Phase.new
       development_plan = Phase.new
       formalization = Phase.new
       initialize_phases(planing, monitoring, formalization, development_plan)

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
             phase.update_attributes(:phase_name => "Planejamento", :phase_description => "Definição das metas da equipe e orientação quanto ao funcionamento do sistema, quanto às competências esperadas")
          when MONITORING
             phase.update_attributes(:phase_name => "Acompanhamento", :phase_description => "Análise e orientação sobre a expressão de competências e o alcance das metas")

          when FORMALIZATION
            phase.update_attributes(:phase_name => "Formalização", :phase_description => "Formalização da avaliação de desempenho e retomada dos registros do ano para embasamento da tomada de decisão")   

          when DEVELOPMENT_PLAN
             phase.update_attributes(:phase_name => "Plano de desenvolvimento", :phase_description => "Discussão sobre as soluções de aprendizagem mais adequadas à situação do servidor")    
          end
           position+=1
      end

    end

    def define_default_period_to_phases(phases)

      position = PLANNING

      start_date_period = phases.first.evaluation_period.start_date_evaluation
      start_date_period_final = phases.first.evaluation_period.start_date_evaluation
      end_date_period = phases.first.evaluation_period.end_date_evaluation

      phases.each do |phase|

        start_date_period_final+=14.days

        case position
          when PLANNING
             phase.update_attributes(:start_date_phase => start_date_period, :end_date_phase => start_date_period_final)

          when MONITORING
             phase.update_attributes(:start_date_phase => start_date_period, :end_date_phase => start_date_period_final)

          when FORMALIZATION
            phase.update_attributes(:start_date_phase => start_date_period, :end_date_phase => start_date_period_final)

          when DEVELOPMENT_PLAN
             phase.update_attributes(:start_date_phase => start_date_period, :end_date_phase => end_date_period )
          end
           position+=1
           start_date_period+=15.days
           start_date_period_final+=14.days
      end
    end

end
