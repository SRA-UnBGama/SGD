class CreatePhases < ActiveRecord::Migration
  def change
    create_table :phases do |t|
      t.string :start_date_phase, :default => '12/04/2014'
      t.string :end_date_phase, :default => '12/05/2014'
      t.string :status_phase
      t.references :evaluation_period
    end
    	add_index :phases, :evaluation_period_id

  end
end
