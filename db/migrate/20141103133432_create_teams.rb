class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :leader
      t.string :members
      t.string :workplace

      t.timestamps
    end
  end
end
