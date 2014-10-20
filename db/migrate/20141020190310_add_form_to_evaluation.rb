class AddFormToEvaluation < ActiveRecord::Migration
  def change
    add_reference :evaluations, :form, index: true
  end
end
