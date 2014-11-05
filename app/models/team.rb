class Team < ActiveRecord::Base
  has_many :users
  
  def search_by_workplace()
    place = self.workplace
    members = User.where("cost_center = ? ", place)

    members
  end

  def initialize_team
    self.users = search_by_workplace
  end
end
