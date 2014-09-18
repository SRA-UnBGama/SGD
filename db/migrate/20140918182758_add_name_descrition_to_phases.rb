class AddNameDescritionToPhases < ActiveRecord::Migration
  def change
    add_column :phases, :phase_name, :string
    add_column :phases, :phase_description, :text
  end
end
