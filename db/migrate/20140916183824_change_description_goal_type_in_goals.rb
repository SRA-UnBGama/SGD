class ChangeDescriptionGoalTypeInGoals < ActiveRecord::Migration
  def change
  	change_column :goals, :description_goal, :text
  end
end
