class AddSiapeRegistryToUsers < ActiveRecord::Migration
  def change
    add_column :users, :siape_registry, :string
  end
end
