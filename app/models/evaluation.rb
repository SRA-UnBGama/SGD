class Evaluation < ActiveRecord::Base
	resourcify
	has_and_belongs_to_many :user
	has_many :evaluation_items
	has_many :learning_solutions
	accepts_nested_attributes_for :evaluation_items

	# Por meio desse construtor podemos fazer a composição!
	# TODO: Retirar esse comentário e fazer um melhor...
	def initialize(*params)super(*params)
		self.evaluation_items << initialize_evaluation_items
	end

	private
		def initialize_evaluation_items()
	      evaluation_items = EvaluationItem.all

	      id_evaluation = Evaluation.count

	      evaluation_items.each do |item|
	        item.evaluation_id = id_evaluation
	      end

	      evaluation_items
	    end
end
