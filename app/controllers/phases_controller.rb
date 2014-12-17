class PhasesController < ApplicationController
  before_action :set_phase, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  check_authorization

  # TODO: ascertain the real need for this method.
  #
  # def index
  #   @phases = Phase.all
  # end


  # GET /phases/1/edit
  def edit
  end


  def update
    respond_to do |format|
      if @phase.update(phase_params)
        format.html { redirect_to @phase.evaluation_period, notice: 'Fase atualizada com sucesso.' }
        #format.json { render :show, status: :ok, location: @phase }
      else
        format.html { render :edit }
        format.json { render json: @phase.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phase
      @phase = Phase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def phase_params
      params.require(:phase).permit(:start_date_phase, :end_date_phase, :status_phase, :phase_name, :phase_description)
    end
end
