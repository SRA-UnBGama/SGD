class CreateUsersEvaluations < ActiveRecord::Migration
  def change
    create_table :users_evaluations do |t|
    	t.references :evaluation
    	t.references :user
    end
    add_index :users_evaluations, [:user_id, :evaluation_id]
    add_index :users_evaluations, :user_id
  end

def self.down
	drop_table :users_evaluations
	
end
end
