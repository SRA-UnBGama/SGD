class FormsWorkingConditions < ActiveRecord::Migration
  def change
  	create_table :forms_working_conditions, :id => false do |t|
  		t.integer :form_id
  		t.integer :working_condition_id
  	end
  end
end
