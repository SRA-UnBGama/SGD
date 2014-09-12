class CreatePhases < ActiveRecord::Migration
  def change
    create_table :phases do |t|
      t.string :start_date_phase
      t.string :end_date_phase
      t.string :status_phase
      t.references :evaluation_period, index: true
      t.timestamps
    end
  end
end
