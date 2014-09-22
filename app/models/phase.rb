class Phase < ActiveRecord::Base
belongs_to :evaluation_period
after_initialize :default_values
	attr_accessor :phase_name , :phase_description

		validates_presence_of :start_date_phase, :end_date_phase
		 validate :dates_are_valid, :minimum_period_phase


  def dates_are_valid
    if self.end_date_phase.present? && self.start_date_phase.present?

	    if end_date_phase < start_date_phase
	    	errors.add(:end_date_phase, "A data final deve ser após a data de início do intervalo.")
	    end
	else
			#Nothing to do
	end	
  end

  def minimum_period_phase

	if end_date_phase < (start_date_phase+14.days)
		errors.add(:end_date_phase, "Período deve ser superior à 15 dias")
	else
		#Nothing to do
	end
  end

 	private
	def default_values
		self.start_date_phase ||= "01/01/2014"
		self.end_date_phase ||= "02/02/2014"
	end
end
