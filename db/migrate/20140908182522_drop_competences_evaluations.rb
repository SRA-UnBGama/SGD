class DropCompetencesEvaluations < ActiveRecord::Migration
  def change
  	drop_table :competences_evaluations
  end
end
