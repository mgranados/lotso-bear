json.array!(@suppliers) do |supplier|
  json.extract! supplier, :name, :id, :supplier_type_id
end
