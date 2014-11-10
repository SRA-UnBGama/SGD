class AutoEvaluationsController < ApplicationController

def index
  #Competencias
    @evaluation = Evaluation.create
    @competences_fundamental = @evaluation.evaluation_items.where(:type => "Competence",:category => "Fundamental")
    @competences_gerencial = @evaluation.evaluation_items.where(:category => "Gerencial", :type => "Competence")
  #Metas
    @goals = @evaluation.evaluation_items.where(:type => "Goal")
  #COndições de Trabalho
    @workingCondition = @evaluation.evaluation_items.where(:type => "WorkingCondition")
    
  end

  def edit
  end


	def update
	respond_to do |format|
      if @evaluation.update(params[:id])
        format.html { redirect_to auto_evaluations_path, notice: 'Competence was successfully updated.' }
      else
        format.html { render home_path }
      end
    end
	end	
end
