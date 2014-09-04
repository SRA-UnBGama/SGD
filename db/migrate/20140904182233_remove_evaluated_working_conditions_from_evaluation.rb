class RemoveEvaluatedWorkingConditionsFromEvaluation < ActiveRecord::Migration
  def change
    remove_column :evaluations, :evaluated_working_conditions, :string
  end
end
