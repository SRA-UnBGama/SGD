class AutoEvaluationsController < ApplicationController

def index
    @evaluation = Evaluation.create
    @competences_fundamental = @evaluation.evaluation_items.where(:type => "Competence",:category => "Fundamental")
    @competences_gerencial = @evaluation.evaluation_items.where(:category => "Gerencial", :type => "Competence")

  end

  def show
    @evaluation = @evaluation.evaluation_items.where(:type => "Competence",:category => "Fundamental").find(params[:id])
  end


  def edit
  end


	def update
	respond_to do |format|
      if @competence.update(params[:id])
        format.html { redirect_to auto_evaluation_path, notice: 'Competence was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
	end	
end
