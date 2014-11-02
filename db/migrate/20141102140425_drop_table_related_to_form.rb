class DropTableRelatedToForm < ActiveRecord::Migration
  def change
  	drop_table :forms
  	drop_table :forms_goals
  	drop_table :forms_working_conditions

  	remove_column :evaluations, :form_id
  end
end
