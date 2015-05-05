json.array!(@orders) do |order|
  json.extract! order, :id, :entance_date, :warehouse_id
  json.url order_url(order, format: :json)
end
