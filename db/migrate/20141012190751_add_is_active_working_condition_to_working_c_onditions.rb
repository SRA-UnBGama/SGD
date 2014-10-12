class AddIsActiveWorkingConditionToWorkingCOnditions < ActiveRecord::Migration
  def change
    add_column :working_conditions, :is_active_working_condition, :boolean
  end
end
