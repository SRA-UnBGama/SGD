class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	validates_presence_of :name_user, :fub_registry, :siape_registry, :admission_date, :cost_center
	

	has_many :evaluations
	has_many :forms , :through => :evaluations



end
