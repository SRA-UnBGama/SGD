class RemoveEvaluatorUserFromEvaluation < ActiveRecord::Migration
  def change
    remove_column :evaluations, :evaluator_user, :string
  end
end
