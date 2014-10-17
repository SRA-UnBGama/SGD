class CreateCompetences < ActiveRecord::Migration
  def change
    create_table :competences do |t|
      t.string :name_competence
      t.string :type_competence
      t.references :auto_evaluation
      
      t.timestamps
    end

    	add_index :competences,:auto_evaluation_id
  end
end
