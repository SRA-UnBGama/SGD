class RemoveRegistryUserFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :registry_user, :string
  end
end
