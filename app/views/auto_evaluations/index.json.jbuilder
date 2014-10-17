json.array!(@auto_evaluations) do |auto_evaluation|
  json.extract! auto_evaluation, :id, :grade_evaluation
  json.url auto_evaluation_url(auto_evaluation, format: :json)
end
