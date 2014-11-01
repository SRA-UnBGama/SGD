class RemoveDetailsFromCompetences < ActiveRecord::Migration
  def change
    remove_column :competences, :name_competence, :string
    remove_column :competences, :type_competence, :string
    remove_column :competences, :is_active_competence, :boolean
    remove_column :competences, :value_auto_evaluation, :integer
    remove_column :competences, :auto_evaluation_id
  end
end
