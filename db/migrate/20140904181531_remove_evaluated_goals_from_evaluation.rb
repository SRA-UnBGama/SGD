class RemoveEvaluatedGoalsFromEvaluation < ActiveRecord::Migration
  def change
    remove_column :evaluations, :evaluated_goals, :string
  end
end
