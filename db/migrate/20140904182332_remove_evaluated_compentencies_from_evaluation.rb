class RemoveEvaluatedCompentenciesFromEvaluation < ActiveRecord::Migration
  def change
    remove_column :evaluations, :evaluated_compentencies, :string
  end
end
