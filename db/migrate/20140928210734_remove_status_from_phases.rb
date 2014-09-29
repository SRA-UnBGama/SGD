class RemoveStatusFromPhases < ActiveRecord::Migration
  def change
  	remove_column :phases, :status, :string
  end
end
