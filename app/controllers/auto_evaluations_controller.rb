class AutoEvaluationsController < ApplicationController
  before_action :set_auto_evaluation, only: [:show, :edit, :update, :destroy]

  # GET /auto_evaluations
  # GET /auto_evaluations.json
  def index
    @auto_evaluations = AutoEvaluation.all
  end

  # GET /auto_evaluations/1
  # GET /auto_evaluations/1.json
  def show
  end

  # GET /auto_evaluations/new
  def new
    @auto_evaluation = AutoEvaluation.new

  end

  # GET /auto_evaluations/1/edit
  def edit
  end

  # POST /auto_evaluations
  # POST /auto_evaluations.json
  def create
    @auto_evaluation = AutoEvaluation.new(auto_evaluation_params)
    @auto_evaluation.competences = Competence.all
    respond_to do |format|
      if @auto_evaluation.save
        format.html { redirect_to @auto_evaluation, notice: 'Auto evaluation was successfully created.' }
        format.json { render :show, status: :created, location: @auto_evaluation }
      else
        format.html { render :new }
        format.json { render json: @auto_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auto_evaluations/1
  # PATCH/PUT /auto_evaluations/1.json
  def update
    respond_to do |format|
      if @auto_evaluation.update(auto_evaluation_params)
        format.html { redirect_to @auto_evaluation, notice: 'Auto evaluation was successfully updated.' }
        format.json { render :show, status: :ok, location: @auto_evaluation }
      else
        format.html { render :edit }
        format.json { render json: @auto_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auto_evaluations/1
  # DELETE /auto_evaluations/1.json
  def destroy
    @auto_evaluation.destroy
    respond_to do |format|
      format.html { redirect_to auto_evaluations_url, notice: 'Auto evaluation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auto_evaluation
      @auto_evaluation = AutoEvaluation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auto_evaluation_params
      params.require(:auto_evaluation).permit(:grade_evaluation)
    end
end
