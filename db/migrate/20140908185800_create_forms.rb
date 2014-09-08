class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.datetime :date
    end
  end
end
