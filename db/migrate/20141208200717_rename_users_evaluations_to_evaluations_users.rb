class RenameUsersEvaluationsToEvaluationsUsers < ActiveRecord::Migration
  def change
  	rename_table :users_evaluations, :evaluations_users
  end
end
