# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User.create!(name:"Administrador", email:"admin@admin.com",password:"admin", password_confirmation:"admin", username: "Administrador", privileges:"admin")
# User.create!(name:"Operador",email:"operador@operador.com",password:"operador", password_confirmation:"operador", username: "Operador", privileges:"operador")
# User.create!(name:"Capturista",email:"capturista@capturista.com",password:"capturista", password_confirmation:"capturista", username: "Capturista", privileges:"capturista")
# User.create!(name:"Gerente",email:"gerente@gerente.com",password:"gerente", password_confirmation:"gerente", username: "Gerente", privileges:"gerente")
# User.create!(name:"Ajustador",email:"ajustador@ajustador.com",password:"ajustador", password_confirmation:"ajustador", username: "Ajustador", privileges:"ajustador")

for i in 0...10
  GenericFamily.create!(id: "levom#{i}", code: "LE#{i}")
end

for i in 1900...2500
  Generation.create!(year:i)
end
brands = [
  "Acura",
  "Alfa Romeo",
  "Audi",
  "Bentley",
  "BMW",
  "Cadillac",
  "Chevrolet",
  "Chrysler",
  "Dodge",
  "Ferrari",
  "Fiat",
  "Ford",
  "GMC",
  "Honda",
  "Hyundai",
  "Infinity",
  "Isuzu",
  "Jaguar",
  "Jeep",
  "Kia",
  "Lamborghini",
  "Land Rover",
  "Lexus",
  "Lincoln",
  "Maserati",
  "Mastretta",
  "Mazda",
  "Mercedes Benz",
  "Mini",
  "Mitsubishi",
  "Nissan",
  "Peugeot",
  "Pontiac",
  "Porsche",
  "Renault",
  "Rolls Royce",
  "Saab",
  "Seat",
  "Smart",
  "Subaru",
  "Suzuki",
  "Toyota",
  "Volkswagen",
  "Volvo"
  ]

  acronyms = [
    "AC",
    "AR",
    "AU",
    "BE",
    "BM",
    "CA",
    "CV",
    "CH",
    "DD",
    "FE",
    "FT",
    "FR",
    "GM",
    "HN",
    "HY",
    "IN",
    "IZ",
    "JG",
    "JE",
    "KI",
    "LA",
    "LR",
    "LX",
    "LN",
    "MA",
    "MT",
    "MZ",
    "MB",
    "MN",
    "MT",
    "NI",
    "PU",
    "PN",
    "PS",
    "RE",
    "RR",
    "SA",
    "SE",
    "SM",
    "SU",
    "SZ",
    "TY",
    "VW",
    "VL"
  ]
types = [['Hashback','3/5'],['Hashback','3'],['Hashback','5'],['Sedan','2'],['Sedan','4'],['Sedan','2/4'],['SUV'],['Minivan'],['Sedan/Hashback','4/5'],['Sedan/Hashback','3/4/5'],['Pick Up','2'],['Pick Up','4'],['Pick Up','2/4'],['Crossover'],['Van']]
types.each { |type|
  if type.count == 2
  CarType.create(name: type.first,doors: type.last)
  elsif
  CarType.create(name: type.first)
  end
}


for i in 0...brands.length
  Brand.create(name: brands[i], acronym:acronyms[i])
end
