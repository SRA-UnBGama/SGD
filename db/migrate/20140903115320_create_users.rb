class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name_user
      t.string :registry_user

      t.timestamps
    end
  end
end
