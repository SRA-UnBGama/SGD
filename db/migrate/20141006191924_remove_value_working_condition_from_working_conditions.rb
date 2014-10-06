class RemoveValueWorkingConditionFromWorkingConditions < ActiveRecord::Migration
  def change
  	remove_column :working_conditions, :value_working_condition, :string
  end
end
