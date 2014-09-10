class CreateEvaluationPeriods < ActiveRecord::Migration
  def change
    create_table :evaluation_periods do |t|
      t.string :start_date_evaluation
      t.string :end_date_evaluation

      t.timestamps
    end
  end
end
