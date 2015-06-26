json.array!(@stock_cars) do |stock_car|
  json.extract! stock_car, :id
  json.url stock_car_url(stock_car, format: :json)
end
