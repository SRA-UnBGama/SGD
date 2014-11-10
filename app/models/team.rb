class Team < ActiveRecord::Base
  has_many :users

  def initialize_team
    self.users = search_by_workplace
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
