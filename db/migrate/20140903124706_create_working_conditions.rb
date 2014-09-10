class CreateWorkingConditions < ActiveRecord::Migration
  def change
    create_table :working_conditions do |t|
      t.string :name_working_condition
      t.string :description_working_condition
      t.string :value_working_condition

      t.timestamps
    end
  end
end
