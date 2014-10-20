class DropEvaluationsUsers < ActiveRecord::Migration
  def change
  	drop_table :evaluations_users
  end
end
