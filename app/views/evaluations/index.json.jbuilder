json.array!(@evaluations) do |evaluation|
  json.extract! evaluation, :id, :evaluated_user, :evaluator_user, :evaluated_compentencies, :evaluated_goals, :evaluated_working_conditions, :evaluation_date, :observations_evaluated
  json.url evaluation_url(evaluation, format: :json)
end
