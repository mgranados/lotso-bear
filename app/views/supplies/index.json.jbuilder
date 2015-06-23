json.array!(@supplies) do |supply|
  json.extract! supply, :id, :name, :minimum_qty, :cost, :description
  json.url supply_url(supply, format: :json)
end
