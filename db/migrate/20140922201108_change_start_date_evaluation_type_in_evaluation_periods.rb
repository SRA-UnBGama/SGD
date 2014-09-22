class ChangeStartDateEvaluationTypeInEvaluationPeriods < ActiveRecord::Migration
  def change
  	change_column :evaluation_periods, :start_date_evaluation, :date
  end
end
