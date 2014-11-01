class CreateEvaluationItems < ActiveRecord::Migration
  def change
    create_table :evaluation_items do |t|
      t.string :name
      t.text :description
      t.string :category
      t.datetime :deadline
      t.integer :auto_evaluation_grade
      t.integer :pairs_evaluation_grade
      t.integer :leader_evaluation_grade
      t.boolean :is_active

      t.timestamps
    end
  end
end
