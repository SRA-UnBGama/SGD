class AddIsActiveCompetenceToCompetences < ActiveRecord::Migration
  def change
  	add_column :competences, :is_active_competence, :boolean
  end
end
