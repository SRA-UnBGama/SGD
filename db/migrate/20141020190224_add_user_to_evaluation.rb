class AddUserToEvaluation < ActiveRecord::Migration
  def change
    add_reference :evaluations, :user, index: true
  end
end
