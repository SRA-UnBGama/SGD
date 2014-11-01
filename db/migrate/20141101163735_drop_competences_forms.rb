class DropCompetencesForms < ActiveRecord::Migration
  def change
  		drop_table :competences_forms
  end
end
