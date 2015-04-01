class Team < ActiveRecord::Base
  resourcify
  has_many :users
  serialize :members, Array
  belongs_to :master_team, :class_name => "Team"
  has_many :child_teams, :class_name => "Team", :foreign_key => "child_teams_id"

  def initialize_team
    #quando eu criar um time eu to dizendo que os usuarios desse time tem que ser
    # os usuarios encontrados pelo nome do worplace
    # Nao quero que duplique o time que duplique o time
    #self.users = search_by_workplace
  end
  
  def search_by_workplace
    place = self.workplace
    members = User.where("cost_center = ? ", place)

    members
  end

  def show_status
    self.is_confirm ? "Confirmado" : "Não Confirmado"
  end

  def list_name_members
  	members = []
  	members = self.users

  	name_members = []

  	members.each do |member|
  		name_members << member.name_user
  	end

  	name_members.sort
  end
end
