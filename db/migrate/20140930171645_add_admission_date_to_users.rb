class AddAdmissionDateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admission_date, :date
  end
end
