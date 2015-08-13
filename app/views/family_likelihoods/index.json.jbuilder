json.array!(@family_likelihoods) do |family_likelihood|
  json.extract! family_likelihood, :id
  json.url family_likelihood_url(family_likelihood, format: :json)
end
