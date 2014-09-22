class ChangeEndDatePhaseTypeInPhases < ActiveRecord::Migration
  def change
  	change_column :phases, :end_date_phase, :date
  end
end
