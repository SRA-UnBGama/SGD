class AddFubRegistryToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fub_registry, :string
  end
end
