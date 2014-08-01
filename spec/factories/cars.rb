require 'faker'

carTypes = ['Sport','Luxury','Commercial','Small','Large','Medium','Hybrid']
models = ['Coupe', 'Mercedes-Benz SLK-Class', 'MINI Cooper', 'AUDI SQ5', 'BMW 3 Series Sedan', 'Jeep Wrangler', 'Ford Mustang']

FactoryGirl.define do
  factory :car do |f|
    f.idBrand 1
    f.carType {carTypes[rand(carTypes.length)]}
    f.year{1900+rand(114)}
    f.generation {
      gen=rand(11)+3
      gen<9? ("0"+gen.to_s) : gen
    }
    f.model{models[rand(models.length)]}
  end
end
