class DropEvaluationsGoals < ActiveRecord::Migration
  def change
  	drop_table :evaluations_goals
  end
end
