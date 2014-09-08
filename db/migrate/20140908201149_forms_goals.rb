class FormsGoals < ActiveRecord::Migration
  def change
  	create_table :forms_goals, :id => false do |t|
  		t.integer :form_id
  		t.integer :goal_id
  	end
  end
end
