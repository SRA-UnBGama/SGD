class CreateCompetences < ActiveRecord::Migration
  def change
    create_table :competences do |t|
      t.string :name_competence
      t.string :description_competence
      t.string :value_competence

      t.timestamps
    end
  end
end
