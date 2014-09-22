class ChangeEndDateEvaluationTypeInEvaluationPeriods < ActiveRecord::Migration
  def change
  	change_column :evaluation_periods, :end_date_evaluation, :date
  end
end
