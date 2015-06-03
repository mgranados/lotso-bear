json.array!(@sections) do |section|
  json.extract! section, :id, :code, :warehouse_id, :name
  json.url section_url(section, format: :json)
end
