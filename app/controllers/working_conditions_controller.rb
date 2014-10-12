# -*- e
class WorkingConditionsController < ApplicationController
  before_action :set_working_condition, only: [:show, :edit, :update, :destroy]

  # GET /working_conditions
  # GET /working_conditions.json
  def index
    @working_conditions = WorkingCondition.all
    @forms = Form.all
  end

  # GET /working_conditions/new
  def new
    @working_condition = WorkingCondition.new
    @working_conditions = WorkingCondition.all
  end

  # GET /working_conditions/1/edit
  def edit
  end

  # POST /working_conditions
  # POST /working_conditions.json
  def create

    workings_conditions_actived = WorkingCondition.where(:is_active_condition => true).count
    @working_condition = WorkingCondition.new(working_condition_params)
    @working_condition.is_active_condition = true

    respond_to do |format|
      if workings_conditions_actived < 10
        if @working_condition.save
         format.html { redirect_to working_conditions_path, notice: 'Working condition was successfully created.' }
        else
          format.html { render :new }
          format.json { render json: @working_condition.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to working_conditions_path, notice: "Já existem 10 condições de trabalho ativas. Desative alguma antes de cadastrar uma nova condição de trabalho." }
      end
    end
  end

  # PATCH/PUT /working_conditions/1
  # PATCH/PUT /working_conditions/1.json
  def update
    respond_to do |format|
      if @working_condition.update(working_condition_params)
        format.html { redirect_to working_conditions_path, notice: 'Working condition was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @working_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /working_conditions/1
  # DELETE /working_conditions/1.json
  def destroy
    @working_condition.is_active_condition ? @working_condition.is_active_condition = false : @working_condition.is_active_condition = true

    respond_to do |format|
      workings_conditions_actived = WorkingCondition.where(:is_active_condition => true).count
      if !(workings_conditions_actived >= 10 && (@working_condition.is_active_condition == true))
        @working_condition.save
        format.html { redirect_to working_conditions_url, notice: 'Condição de Trabalho alterada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { redirect_to working_conditions_url, notice: 'Condição de Trabalho não alterada. Limite de Condições de Trabalho ativas foi Atingido.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_working_condition
      @working_condition = WorkingCondition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def working_condition_params
      params.require(:working_condition).permit(:name_working_condition, :is_active_condition, :form_ids => [])
    end
end
