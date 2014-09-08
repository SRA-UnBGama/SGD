class EvaluationsGoals < ActiveRecord::Migration
  def change
  	create_table :evaluations_goals, :id => false do |t|
  		t.integer :evaluation_id
  		t.integer :goal_id
  	end
  end
end
