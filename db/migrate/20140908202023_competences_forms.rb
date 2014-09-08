class CompetencesForms < ActiveRecord::Migration
  def change
  	  create_table :competences_forms, :id => false do |t|
  		t.integer :competence_id
  		t.integer :form_id
  	end
  end
end
