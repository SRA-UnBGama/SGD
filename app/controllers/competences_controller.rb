class CompetencesController < ApplicationController
  before_action :set_competence, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  check_authorization
  # GET /competences
  # GET /competences.json
  def index
    @competences = Competence.all
  end

  # GET /competences/new
  def new
    phase_is_planning = permission_about_phase("Planejamento")
    if phase_is_planning 
      @competence = Competence.new
    else
      flash[:error] = "Funcionalidade disponível apenas para a fase de Planejamento"
      redirect_to competences_path
    end
  end

  # GET /competences/1/edit
  def edit
    phase_is_planning = permission_about_phase("Planejamento")
    if phase_is_planning
      # Nothing To Do
    else
      flash[:error] = "Funcionalidade disponível apenas para a fase de Planejamento"
      redirect_to competences_path
    end
  end

  # POST /competences
  # POST /competences.json
  def create
    competences_actived = Competence.where(:is_active => true).count

    @competence = Competence.new(competence_params)
    @competence.is_active = false

    respond_to do |format|
      if true
        if @competence.save
          format.html { redirect_to competences_path, notice: 'Competência criada com sucesso.' }
        else
          format.html { render :new }
          format.json { render json: @competence.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to competences_path, notice: "Já existem 10 competências ativas. Desative alguma antes de cadastrar uma nova competência." }
      end
    end
  end

  # PATCH/PUT /competences/1
  # PATCH/PUT /competences/1.json
  def update
    respond_to do |format|
      if @competence.update(competence_params)
        format.html { redirect_to competences_path, notice: 'Competência atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @competence }
      else
        format.html { render :edit }
        format.json { render json: @competence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /competences/1
  # DELETE /competences/1.json
  def destroy
    phase_is_planning = permission_about_phase("Planejamento")
    if phase_is_planning 
      @competence.is_active ? @competence.is_active = false : @competence.is_active = true

      respond_to do |format|
        competences_actived = Competence.where(:is_active => true).count
        if !(competences_actived >= 10 && (@competence.is_active == true))
          @competence.save
          format.html { redirect_to competences_url, notice: 'Competência foi alterada com sucesso.' }
          format.json { head :no_content }
        else
          format.html { redirect_to competences_url, notice: 'Competência não alterada. Limite de Competência ativas foi Atingido.' }
          format.json { head :no_content }
        end
      end
    else
      flash[:error] = "Funcionalidade disponível apenas para a fase de Planejamento"
      redirect_to competences_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competence
      @competence = Competence.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def competence_params
      params.require(:competence).permit(:name, :category, :auto_evaluation_grade, :pairs_evaluation_grade, :leader_evaluation_grade, :is_active)
    end
  end
