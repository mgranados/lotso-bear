json.array!(@shelves) do |shelf|
  json.extract! shelf, :id, :aisle, :row, :level, :number
  json.url shelf_url(shelf, format: :json)
end
