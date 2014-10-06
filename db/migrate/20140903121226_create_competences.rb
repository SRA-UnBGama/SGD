class CreateCompetences < ActiveRecord::Migration
  def change
    create_table :competences do |t|
      t.string :name_competence
      t.string :type_competence
      
      t.timestamps
    end
  end
end
