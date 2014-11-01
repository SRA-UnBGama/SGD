class RemoveDetailsFromGoals < ActiveRecord::Migration
  def change
    remove_column :goals, :name_goal, :string
    remove_column :goals, :description_goal, :text
    remove_column :goals, :deadline_goal, :date
    remove_column :goals, :value_goal, :string
  end
end
