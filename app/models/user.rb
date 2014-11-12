class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	validates_presence_of :name_user, :fub_registry, :siape_registry, :admission_date, :cost_center


	has_and_belongs_to_many :evaluations
	 belongs_to :team

	def email_required?
  		false
	end

	def email_changed?
  		false
	end



end
