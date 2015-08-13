json.array!(@generic_families) do |generic_family|
  json.extract! generic_family, :id
  json.url generic_family_url(generic_family, format: :json)
end
