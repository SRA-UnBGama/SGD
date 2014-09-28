class AddStatusToPhases < ActiveRecord::Migration
  def change
  	add_column :phases, :status, :string
  end
end
