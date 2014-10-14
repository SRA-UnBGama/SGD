json.array!(@learning_solutions) do |learning_solution|
  json.extract! learning_solution, :id, :description, :category
  json.url learning_solution_url(learning_solution, format: :json)
end
