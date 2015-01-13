json.array!(@model_acronyms) do |model_acronym|
  json.extract! model_acronym, :id, :brand_id, :acronym
  json.url model_acronym_url(model_acronym, format: :json)
end
