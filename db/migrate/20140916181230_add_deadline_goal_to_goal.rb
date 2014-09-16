class AddDeadlineGoalToGoal < ActiveRecord::Migration
  def change
    add_column :goals, :deadline_goal, :date
  end
end
