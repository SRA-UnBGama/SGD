class AddIsConfirmToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :is_confirm, :boolean
  end
end
