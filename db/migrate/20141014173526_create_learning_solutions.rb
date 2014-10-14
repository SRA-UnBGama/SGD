class CreateLearningSolutions < ActiveRecord::Migration
  def change
    create_table :learning_solutions do |t|
      t.string :description
      t.string :category

      t.timestamps
    end
  end
end
