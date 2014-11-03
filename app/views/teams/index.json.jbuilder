json.array!(@teams) do |team|
  json.extract! team, :id, :leader, :members, :workplace
  json.url team_url(team, format: :json)
end
