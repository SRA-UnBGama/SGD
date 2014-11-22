class EvaluationPeriodsController < ApplicationController
  before_action :set_evaluation_period, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  check_authorization
  # GET /evaluation_periods
  # GET /evaluation_periods.json
  def index
    @evaluation_periods = EvaluationPeriod.all
  end

  # GET /evaluation_periods/1
  # GET /evaluation_periods/1.json
  def show
    define_status_phases(@evaluation_period.phases)
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

    respond_to do |format|
      if @evaluation_period.save

        format.html { redirect_to evaluation_period_path(@evaluation_period), notice: 'Evaluation period was successfully created.' }
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

    def define_status_phases(phases)

      phases.each do |phase|
        if (Date.today > phase.start_date_phase) && (Date.today > phase.end_date_phase)
          phase.update_attributes(:status_phase => "Encerrado")
        elsif (Date.today > phase.start_date_phase) && (Date.today < phase.end_date_phase)
          phase.update_attributes(:status_phase => "Em Andamento")
        else
          phase.update_attributes(:status_phase => "Aguardando")
        end
      end
    end

end
