class AddTeamToTeam < ActiveRecord::Migration
  def change
  	add_reference :teams, :child_teams, index: true
  end
end
