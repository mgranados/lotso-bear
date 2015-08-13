json.array!(@type_likelihoods) do |type_likelihood|
  json.extract! type_likelihood, :id
  json.url type_likelihood_url(type_likelihood, format: :json)
end
