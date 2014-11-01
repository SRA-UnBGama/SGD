class EvaluationItemsController < ApplicationController
  before_action :set_evaluation_item, only: [:show, :edit, :update, :destroy]

  def create
    @evaluation_item = EvaluationItem.new(evaluation_item_params)
    @evaluation_item.save
    respond_with(@evaluation_item)
  end

  private
    def set_evaluation_item
      @evaluation_item = EvaluationItem.find(params[:id])
    end

    def evaluation_item_params
      params.require(:evaluation_item).permit(:name, :description, :category, :deadline, :auto_evaluation_grade, :pairs_evaluation_grade, :leader_evaluation_grade, :is_active)
    end
end
