class EvaluationPeriod < ActiveRecord::Base
	 has_many :phases
	 validates_presence_of :start_date_evaluation , :end_date_evaluation

	 validate :dates_are_valid, :minimum_period


  def dates_are_valid
    if self.end_date_evaluation.present? && self.start_date_evaluation.present?

		start_date_evaluation = DateTime.strptime(self.start_date_evaluation, "%d/%m/%Y")
		end_date_evaluation = DateTime.strptime("#{self.end_date_evaluation} 23:59:59", "%d/%m/%Y %H:%M:%S")

	    if end_date_evaluation < start_date_evaluation
	    	errors.add(:end_date_evaluation, "A data final deve ser após a data de início do intervalo.")
	    end
	else
	#nothing to do		
	end	
  end

  def minimum_period

  	start_date_evaluation= DateTime.strptime(self.start_date_evaluation, "%d/%m/%Y")
	end_date_evaluation= DateTime.strptime("#{self.end_date_evaluation} 23:59:59", "%d/%m/%Y %H:%M:%S")

	if end_date_evaluation < (start_date_evaluation + 59.days)
		errors.add(:end_date_evaluation, "Período deve ser superior à 60 dias")
	else
		#Nothing to do
	end
  end
  	
end
