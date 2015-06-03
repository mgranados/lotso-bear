json.array!(@warehouses) do |warehouse|
  json.extract! warehouse, :id
  json.url warehouse_url(warehouse, format: :json)
end
