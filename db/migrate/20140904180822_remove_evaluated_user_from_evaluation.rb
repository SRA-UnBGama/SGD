class RemoveEvaluatedUserFromEvaluation < ActiveRecord::Migration
  def change
    remove_column :evaluations, :evaluated_user, :string
  end
end
