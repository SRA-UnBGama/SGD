class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  check_authorization
  # GET /goals
  # GET /goals.json
  def index
    @goals = Goal.all
  end

  # GET /goals/1
  # GET /goals/1.json
  def show
    @goal = Goal.find(params[:id])
  end

  # GET /goals/new
  def new
    phase_is_planning = permission_about_phase("Planejamento")
    if phase_is_planning
      @goal = Goal.new
    else
      flash[:error] = "Funcionalidade disponível apenas para a fase de Planejamento"
      redirect_to goals_path
    end
  end

  # GET /goals/1/edit
  def edit
    phase_is_planning = permission_about_phase("Planejamento")
    if phase_is_planning or true
      # Nothing To Do
    else
      flash[:error] = "Funcionalidade disponível apenas para a fase de Planejamento"
      redirect_to goals_path
    end
  end

  # POST /goals
  # POST /goals.json
  def create
    @goal = Goal.new(goal_params)

    respond_to do |format|
      if @goal.save 
        format.html { redirect_to @goal, notice: 'Meta criada com sucesso.' }
        format.json { render :show, status: :created, location: @goal }
      else
        format.html { render :new }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goals/1
  # PATCH/PUT /goals/1.json
  def update
    respond_to do |format|
      if @goal.update(goal_params)
        format.html { redirect_to @goal, notice: 'Meta atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @goal }
      else
        format.html { render :edit }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @goal.destroy
    respond_to do |format|
      format.html { redirect_to goals_url, notice: 'Meta deletada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_params
      params.require(:goal).permit(:name, :deadline, :description, :auto_evaluation_grade, :pairs_evaluation_grade, :leader_evaluation_grade, :is_active)
    end
end
