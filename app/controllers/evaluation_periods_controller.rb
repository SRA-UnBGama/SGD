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

    def initialize_phases (planning, evaluation , development_plan, formalization )
      @planning = planning
      @evaluation = evaluation
      @development_plan = development_plan
      @formalization = formalization
      phases = []
      phases << @planning
      phases << @evaluation
      phases << @development_plan
      phases << @formalization
      phases
    
    end

    def create_phases()
       planing = Phase.new
       evaluation = Phase.new
       development_plan = Phase.new
       formalization = Phase.new
       initialize_phases(planing, evaluation, development_plan, formalization)

    end

    def define_name_description( phases)
      position = 1
      
      phases.each do |phase|
        case position
          when 1
             phase.update_columns(phase_name: "Planejamento", phase_description: "Planejamento descrição")
          when 2
             phase.update_columns(phase_name: "Acompanhamento", phase_description: " descrição")
          when 3
             phase.update_columns(phase_name: "Avaliação", phase_description: "Acompanhamento descrição")    
          when 4
            phase.update_columns(phase_name: "formalização", phase_description: "Acompanhamento descrição")   
           end
           position+=1
      end

    end
end
