class RemoveDescriptionWorkingConditionFromWorkingConditions < ActiveRecord::Migration
  def change
  	remove_column :working_conditions, :description_working_condition, :string
  end
end
