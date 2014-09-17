class AddEvaluationPeriodIdToPhases < ActiveRecord::Migration
  def change
    add_column :phases, :evaluation_period_id, :integer
  end
end
