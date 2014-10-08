class WorkingCondition < ActiveRecord::Base
	has_and_belongs_to_many :forms
	validates_presence_of :name_working_condition
	validates_uniqueness_of :name_working_condition
end
