json.array!(@competences) do |competence|
  json.extract! competence, :id, :name_competence, :description_competence, :value_competence
  json.url competence_url(competence, format: :json)
end
