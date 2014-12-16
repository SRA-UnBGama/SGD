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
    @evaluation = set_auto_evaluation

    respond_to do |format|
      if @evaluation.update( auto_evaluation_params )
        format.html { redirect_to auto_evaluations_path, notice: 'Competence was successfully updated.' }
      else
        format.html { render home_path }
      end
    end
	end

  private
    def set_auto_evaluation
      @evaluation = Evaluation.find(params[:id])
    end

    def auto_evaluation_params
      params.require( :evaluation ).permit()
    end
end
