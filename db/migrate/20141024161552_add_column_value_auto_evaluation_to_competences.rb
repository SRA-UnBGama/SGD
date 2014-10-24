class AddColumnValueAutoEvaluationToCompetences < ActiveRecord::Migration
  def change
    add_column :competences, :value_auto_evaluation, :int
  end
end
