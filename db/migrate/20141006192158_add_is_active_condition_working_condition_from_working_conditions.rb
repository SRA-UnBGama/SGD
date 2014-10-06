class AddIsActiveConditionWorkingConditionFromWorkingConditions < ActiveRecord::Migration
  def change
  	add_column :working_conditions, :is_active_condition, :boolean
  end
end
