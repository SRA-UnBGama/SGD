class DropAutoEvaluation < ActiveRecord::Migration
  def change
  	drop_table :auto_evaluations
  end
end
