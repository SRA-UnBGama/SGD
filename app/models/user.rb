class User < ActiveRecord::Base
	has_and_belongs_to_many :evaluations

	validates_presence_of :name_user, :fub_registry, :siape_registry, :admission_date, :cost_center
end
