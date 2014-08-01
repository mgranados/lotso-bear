require 'faker'

carRegions = ['Mecanica','Externa','Interna']
brands = ['3M','Accurite','KD','Lisle','Akebono','MANN','Meritor']

FactoryGirl.define do
  factory :spare_part do |f|
    f.name {Faker::Company.name}
    f.description "Pickled direct trade asymmetrical, authentic whatever flexitarian skateboard VHS. Church-key flexitarian ethical, actually photo booth quinoa chia selvage synth leggings ethnic Tonx."
    f.carRegion {carRegions[rand(carRegions.length)]}
    f.parent 1
    f.brand {brands[rand(brands.length)]}
    f.spareCode {Faker::Business.credit_card_number}
  end
end
