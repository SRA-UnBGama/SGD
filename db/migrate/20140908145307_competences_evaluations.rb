class CompetencesEvaluations < ActiveRecord::Migration
  def change
  	create_table :competences_evaluations, :id => false do |t|
  		t.integer :competence_id
  		t.integer :evaluation_id
  	end
  end
end
