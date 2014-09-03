class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :name_goal
      t.string :description_goal
      t.string :value_goal

      t.timestamps
    end
  end
end
