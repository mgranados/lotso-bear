json.array!(@brands) do |brand|
  json.extract! brand, :id, :name, :acronym
  json.url brand_url(brand, format: :json)
end
