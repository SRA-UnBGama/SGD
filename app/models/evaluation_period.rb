class EvaluationPeriod < ActiveRecord::Base
	 validates_presence_of :start_date_evaluation , :end_date_evaluation

	 validate :dates_are_valid


  def dates_are_valid
    if self.end_date_evaluation.present? && self.start_date_evaluation.present?

		start_date_evaluation = DateTime.strptime(self.start_date_evaluation, "%d/%m/%Y")
		end_date_evaluation = DateTime.strptime("#{self.end_date_evaluation} 23:59:59", "%d/%m/%Y %H:%M:%S")

	    if end_date_evaluation < start_date_evaluation
	    	errors.add(:end_date_evaluation, "A data final deve ser após a data de início do intervalo.")
	    end
		else
			
		end	
  	end


end
