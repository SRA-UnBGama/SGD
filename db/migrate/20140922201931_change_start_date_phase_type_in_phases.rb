class ChangeStartDatePhaseTypeInPhases < ActiveRecord::Migration
  def change
  	change_column :phases, :start_date_phase, :date
  end
end
