class Phase < ActiveRecord::Base
belongs_to :evaluation_period

		validates_presence_of :start_date_phase, :end_date_phase
		 validate :dates_are_valid


  def dates_are_valid
    if self.end_date_phase.present? && self.start_date_phase.present?

		start_date_phase= DateTime.strptime(self.start_date_phase, "%d/%m/%Y")
		end_date_phase = DateTime.strptime("#{self.end_date_phase} 23:59:59", "%d/%m/%Y %H:%M:%S")

	    if end_date_phase < start_date_phase
	    	errors.add(:end_date_phase, "A data final deve ser após a data de início do intervalo.")
	    end
		else
			
		end	
  	end

end
