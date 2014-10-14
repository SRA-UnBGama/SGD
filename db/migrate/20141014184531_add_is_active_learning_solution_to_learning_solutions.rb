class AddIsActiveLearningSolutionToLearningSolutions < ActiveRecord::Migration
  def change
  	add_column :learning_solutions, :is_active_learning_solution, :boolean
  end
end
