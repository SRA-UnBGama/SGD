class AddIsActiveUserToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :is_active_user, :boolean
  end
end
