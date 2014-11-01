json.array!(@goals) do |goal|
  json.extract! goal, :id, :name, :description, :value_goal
  json.url goal_url(goal, format: :json)
end
