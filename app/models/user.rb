class User < ActiveRecord::Base
  rolify
  after_create :default_role, :alocate_team
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


	validates_presence_of :name_user, :fub_registry, :siape_registry, :admission_date, :cost_center
	validates_uniqueness_of :name_user, :fub_registry, :siape_registry

	has_and_belongs_to_many :evaluations
	belongs_to :team


	def self.search(search, search_option)
		if search and search_option
			if search_option == "name"
				where('name_user LIKE ?', "%#{search}%")
			elsif search_option == "fub_registry"
				where('fub_registry LIKE ?', "%#{search}%")
			end
		else
			all
		end
	end


  	def alocate_team
  		arrayusuario = Array.new()
  		arrayusuario = [self]
  		team = Team.find_by_workplace(self.cost_center)
  		if !team
  			team = Team.create(workplace: self.cost_center)
  			team.users << arrayusuario
  		else
  			team.users << arrayusuario
  		end
  		team.save
  	end

	def email_required?
  		false
	end

	def email_changed?
  		false
	end
	private
	def default_role
	    self.roles << Role.find_by_name("external_user")
	    self.save
  	end

end
