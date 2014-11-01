class EvaluationItemsController < ApplicationController
  before_action :set_evaluation_item, only: [:show, :edit, :update, :destroy]

  def index
    @evaluation_items = EvaluationItem.all
    respond_with(@evaluation_items)
  end

  def show
    respond_with(@evaluation_item)
  end

  def new
    @evaluation_item = EvaluationItem.new
    respond_with(@evaluation_item)
  end

  def edit
  end

  def create
    @evaluation_item = EvaluationItem.new(evaluation_item_params)
    @evaluation_item.save
    respond_with(@evaluation_item)
  end

  def update
    @evaluation_item.update(evaluation_item_params)
    respond_with(@evaluation_item)
  end

  def destroy
    @evaluation_item.destroy
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
