json.array!(@families) do |family|
  json.extract! family, :id, :generic_spare_id, :child_id, :create, :destroy
  json.url family_url(family, format: :json)
end
