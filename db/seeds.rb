# # User.create!(name:"Administrador", email:"admin@admin.com",password:"admin", password_confirmation:"admin", username: "Administrador", privileges:"admin")
# # User.create!(name:"Operador",email:"operador@operador.com",password:"operador", password_confirmation:"operador", username: "Operador", privileges:"operador")
# # User.create!(name:"Capturista",email:"capturista@capturista.com",password:"capturista", password_confirmation:"capturista", username: "Capturista", privileges:"capturista")
# # User.create!(name:"Gerente",email:"gerente@gerente.com",password:"gerente", password_confirmation:"gerente", username: "Gerente", privileges:"gerente")
# User.create!(name:"Ajustador",email:"ajustador@ajustador.com",password:"ajustador", password_confirmation:"ajustador", username: "Ajustador", privileges:"ajustador")
#

# for i in 1900...2500
#   Generation.create!(year:i)
# end
# brands = [
#   "Acura",
#   "Alfa Romeo",
#   "Audi",
#   "Bentley",
#   "BMW",
#   "Cadillac",
#   "Chevrolet",
#   "Chrysler",
#   "Dodge",
#   "Ferrari",
#   "Fiat",
#   "Ford",
#   "GMC",
#   "Honda",
#   "Hyundai",
#   "Infinity",
#   "Isuzu",
#   "Jaguar",
#   "Jeep",
#   "Kia",
#   "Lamborghini",
#   "Land Rover",
#   "Lexus",
#   "Lincoln",
#   "Maserati",
#   "Mastretta",
#   "Mazda",
#   "Mercedes Benz",
#   "Mini",
#   "Mitsubishi",
#   "Nissan",
#   "Peugeot",
#   "Pontiac",
#   "Porsche",
#   "Renault",
#   "Rolls Royce",
#   "Saab",
#   "Seat",
#   "Smart",
#   "Subaru",
#   "Suzuki",
#   "Toyota",
#   "Volkswagen",
#   "Volvo"
#   ]
#
#   acronyms = [
#     "AC",
#     "AR",
#     "AU",
#     "BE",
#     "BM",
#     "CA",
#     "CV",
#     "CH",
#     "DD",
#     "FE",
#     "FT",
#     "FR",
#     "GM",
#     "HN",
#     "HY",
#     "IN",
#     "IZ",
#     "JG",
#     "JE",
#     "KI",
#     "LA",
#     "LR",
#     "LX",
#     "LN",
#     "MA",
#     "MT",
#     "MZ",
#     "MB",
#     "MN",
#     "MT",
#     "NI",
#     "PU",
#     "PN",
#     "PS",
#     "RE",
#     "RR",
#     "SA",
#     "SE",
#     "SM",
#     "SU",
#     "SZ",
#     "TY",
#     "VW",
#     "VL"
#   ]
#
#   for i in 0...brands.length
#     Brand.create(name: brands[i], acronym:acronyms[i])
#   end
# types = [['Hatchback','3/5'],['Hatchback','3'],['Hatchback','5'],['Sedan','2'],['Sedan','4'],['Sedan','2/4'],['SUV'],['Minivan'],['Sedan/Hatchback','4/5'],['Sedan/Hatchback','3/4/5'],['Pick Up','2'],['Pick Up','4'],['Pick Up','2/4'],['Crossover'],['Van']]
# types.each { |type|
#   if type.count == 2
#   CarType.create(name: type.first,doors: type.last)
#   elsif
#   CarType.create(name: type.first)
#   end
# }
#
# # Model Acronym
# @model = ModelAcronym.new(initials:'CO', model: 'COROLLA')
# @model.brand = Brand.first
# @model.save!
# # Generic Car
# @genericCar = GenericCar.new(first_generation_year: 2001, last_generation_year: 2003, number_of_generation: '1er', years: '2001-2003', gen_continues: false)
# @genericCar.car_type = CarType.first
# @genericCar.model_acronym = ModelAcronym.first
# @genericCar.save!
#
# # Generic Family Mold with spares
# @generic_family_mold = GenericFamily.new(name: 'Puerta Derecha Molde', code: 'FA', mold:true)
# @generic_family_mold.generic_spares << GenericSpare.create(name: "Manija",code:"A0")
# @generic_family_mold.generic_spares << GenericSpare.create(name: "Manivela",code:"A1")
# @generic_family_mold.save!
#
# @genericCar.car_type.generic_families << @generic_family_mold
# @genericCar.save!
#
# #Generic family, non mold, with spares
# @generic_family = GenericFamily.new(name: 'Puerta Izquierda No Molde', code: 'FA', mold:false)
# # @generic_family.father = @generic_family_mold
# @generic_family.generic_spares << GenericSpare.create(name: "Vidrio",code:"A0")
# @generic_family.generic_spares << GenericSpare.create(name: "Port",code:"A1")
# @generic_family.save!


#TypeLikelihood.dedupe
#GenericFamily.copy_families_to_generic_cars


# Type of Suppliers
# SupplierType.create(name: "Desmontado Original") 
# SupplierType.create(name: "Original") 
# SupplierType.create(name: "Taiwan") 

#TypeLikelihood.all.destroy_all

FamilyLikelihood.all.destroy_all

