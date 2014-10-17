class CreateAutoEvaluations < ActiveRecord::Migration
  def change
    create_table :auto_evaluations do |t|
      t.string :grade_evaluation
  end
  end
end
