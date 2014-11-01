class RemoveDetailsFromWorkingCondition < ActiveRecord::Migration
  def change
    remove_column :working_conditions, :name_working_condition, :string
    remove_column :working_conditions, :is_active_condition, :boolean
    remove_column :working_conditions, :is_active_working_condition, :boolean
  end
end
