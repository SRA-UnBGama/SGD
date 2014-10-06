class CompetencesController < ApplicationController
  before_action :set_competence, only: [:show, :edit, :update, :destroy]

  # GET /competences
  # GET /competences.json
  def index
    @competences = Competence.all
    @forms = Form.all
  end

  # GET /competences/1
  # GET /competences/1.json
  def show
  end

  # GET /competences/new
  def new
    @competence = Competence.new
  end

  # GET /competences/1/edit
  def edit
  end

  # POST /competences
  # POST /competences.json
  def create
    @competence = Competence.new(competence_params)

    respond_to do |format|
      if @competence.save
        format.html { redirect_to @competence, notice: 'Competence was successfully created.' }
        format.json { render :show, status: :created, location: @competence }
      else
        format.html { render :new }
        format.json { render json: @competence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /competences/1
  # PATCH/PUT /competences/1.json
  def update
    respond_to do |format|
      if @competence.update(competence_params)
        format.html { redirect_to @competence, notice: 'Competence was successfully updated.' }
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
    @competence.destroy
    respond_to do |format|
      format.html { redirect_to competences_url, notice: 'Competence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competence
      @competence = Competence.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def competence_params
      params.require(:competence).permit(:name_competence, :type_competence, :form_ids => [])
    end
end
