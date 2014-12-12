json.array!(@mold_spares) do |mold_spare|
  json.extract! mold_spare, :id, :name, :comment, :comment2, :type
  json.url mold_spare_url(mold_spare, format: :json)
end
