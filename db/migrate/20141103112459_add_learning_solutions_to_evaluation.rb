class AddLearningSolutionsToEvaluation < ActiveRecord::Migration
  def change
  	add_reference :learning_solutions, :evaluation, index: true
  end
end
