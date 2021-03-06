class LearningSolutionsController < ApplicationController
  before_action :set_learning_solution, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  check_authorization
  # GET /learning_solutions
  # GET /learning_solutions.json
  def index
    @learning_solutions = LearningSolution.all
  end

  # GET /learning_solutions/1
  # GET /learning_solutions/1.json
  def show
  end

  # GET /learning_solutions/new
  def new
    phase_is_planning = permission_about_phase("Planejamento")
    if phase_is_planning 
      @learning_solution = LearningSolution.new
    else
      flash[:error] = "Funcionalidade disponível apenas para a fase de Planejamento"
      redirect_to learning_solutions_path
    end
  end

  # GET /learning_solutions/1/edit
  def edit
    phase_is_planning = permission_about_phase("Planejamento")
    if phase_is_planning
      # Nothing To Do
    else
      flash[:error] = "Funcionalidade disponível apenas para a fase de Planejamento"
      redirect_to learning_solutions_path
    end
  end

  # POST /learning_solutions
  # POST /learning_solutions.json
  def create
    @learning_solution = LearningSolution.new(learning_solution_params)
    @learning_solution.is_active_learning_solution = true;

    respond_to do |format|
      if @learning_solution.save
        format.html { redirect_to learning_solutions_path, notice: 'Solução de aprendizado criada com sucesso.' }
        format.json { render :index, status: :created, location: @learning_solution }
      else
        format.html { render :new }
        format.json { render json: @learning_solution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /learning_solutions/1
  # PATCH/PUT /learning_solutions/1.json
  def update
    respond_to do |format|
      if @learning_solution.update(learning_solution_params)
        format.html { redirect_to learning_solutions_path, notice: 'Solução de aprendizado atualizada com sucesso.' }
        format.json { render :index, status: :ok, location: @learning_solution }
      else
        format.html { render :edit }
        format.json { render json: @learning_solution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /learning_solutions/1
  # DELETE /learning_solutions/1.json
  def destroy
    phase_is_planning = permission_about_phase("Planejamento")
    if phase_is_planning
      @learning_solution.is_active_learning_solution ? @learning_solution.is_active_learning_solution = false : @learning_solution.is_active_learning_solution = true
      respond_to do |format|
        @learning_solution.save
        format.html { redirect_to learning_solutions_url, notice: 'Solução de aprendizado excluida com sucesso.' }
        format.json { head :no_content }
      end
    else
      flash[:error] = "Funcionalidade disponível apenas para a fase de Planejamento"
      redirect_to learning_solutions_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_learning_solution
      @learning_solution = LearningSolution.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def learning_solution_params
      params.require(:learning_solution).permit(:description, :category, :evaluation_ids => [])
    end
end
