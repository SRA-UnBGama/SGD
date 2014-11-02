class AddEvaluationItemToEvaluation < ActiveRecord::Migration
  def change
  	add_reference :evaluation_items, :evaluation, index: true
  end
end
