class WorkingConditionsController < ApplicationController
  before_action :set_working_condition, only: [:show, :edit, :update, :destroy]

  # GET /working_conditions
  # GET /working_conditions.json
  def index
    @working_conditions = WorkingCondition.all
    @forms = Form.all
  end

  # GET /working_conditions/1
  # GET /working_conditions/1.json
  def show
  end

  # GET /working_conditions/new
  def new
    @working_condition = WorkingCondition.new
  end

  # GET /working_conditions/1/edit
  def edit
  end

  # POST /working_conditions
  # POST /working_conditions.json
  def create
    @working_condition = WorkingCondition.new(working_condition_params)

    respond_to do |format|
      if @working_condition.save
        format.html { redirect_to @working_condition, notice: 'Working condition was successfully created.' }
        format.json { render :show, status: :created, location: @working_condition }
      else
        format.html { render :new }
        format.json { render json: @working_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /working_conditions/1
  # PATCH/PUT /working_conditions/1.json
  def update
    respond_to do |format|
      if @working_condition.update(working_condition_params)
        format.html { redirect_to @working_condition, notice: 'Working condition was successfully updated.' }
        format.json { render :show, status: :ok, location: @working_condition }
      else
        format.html { render :edit }
        format.json { render json: @working_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /working_conditions/1
  # DELETE /working_conditions/1.json
  def destroy
    @working_condition.destroy
    respond_to do |format|
      format.html { redirect_to working_conditions_url, notice: 'Working condition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_working_condition
      @working_condition = WorkingCondition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def working_condition_params
      params.require(:working_condition).permit(:name_working_condition, :description_working_condition, :value_working_condition, :form_ids => [])
    end
end
