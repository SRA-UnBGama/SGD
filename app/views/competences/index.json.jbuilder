json.array!(@competences) do |competence|
  json.extract! competence, :id, :name, :description_competence, :value_competence
  json.url competence_url(competence, format: :json)
end
