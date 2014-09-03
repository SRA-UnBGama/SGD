class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.string :evaluated_user
      t.string :evaluator_user
      t.string :evaluated_compentencies
      t.string :evaluated_goals
      t.string :evaluated_working_conditions
      t.string :evaluation_date
      t.string :observations_evaluated

      t.timestamps
    end
  end
end
