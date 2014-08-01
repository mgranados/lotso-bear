require 'faker'

branches = ['Reforma 1201','Petrolera 2021','Centro 1293','Camino Real']
locations = ['Puebla', 'Tampico', 'Morelos', 'Monterrey']

FactoryGirl.define do
  factory :warehouse do |f|
    f.branch {branches[rand(branches.length)]}
    f.location {locations[rand(locations.length)]}
    f.geoLocation{rand(99).to_s+","+rand(99).to_s}
  end
end
