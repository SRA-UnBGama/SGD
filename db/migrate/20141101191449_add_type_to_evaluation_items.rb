class AddTypeToEvaluationItems < ActiveRecord::Migration
  def change
    add_column :evaluation_items, :type, :string
  end
end
