class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	validates_presence_of :name_user, :fub_registry, :siape_registry, :admission_date, :cost_center


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

	def email_required?
  		false
	end

	def email_changed?
  		false
	end



end
