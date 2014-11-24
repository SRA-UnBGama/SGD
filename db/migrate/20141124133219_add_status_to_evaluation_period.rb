class AddStatusToEvaluationPeriod < ActiveRecord::Migration
  def change
    add_column :evaluation_periods, :status_evaluation_period, :string
  end
end
