class AddCostCenterToUsers < ActiveRecord::Migration
  def change
    add_column :users, :cost_center, :string
  end
end
