# -*- encoding : utf-8 -*-
# User.new!(name:"Administrador", email:"admin@admin.com",password:"admin", password_confirmation:"admin", username: "Administrador", privileges:"admin")
# User.new!(name:"Operador",email:"operador@operador.com",password:"operador", password_confirmation:"operador", username: "Operador", privileges:"operador")
# User.new!(name:"Capturista",email:"capturista@capturista.com",password:"capturista", password_confirmation:"capturista", username: "Capturista", privileges:"capturista")
# User.new!(name:"Gerente",email:"gerente@gerente.com",password:"gerente", password_confirmation:"gerente", username: "Gerente", privileges:"gerente")
# User.new!(name:"Ajustador",email:"ajustador@ajustador.com",password:"ajustador", password_confirmation:"ajustador", username: "Ajustador", privileges:"ajustador")
@user = User.create(name:"trabajador", email: "trabajador@trabajador.com", password: "trabajador", password_confirmation: "trabajador", username: "trabajador", privileges: "empleado", code:"holi")
	
for i in 1900...2500
  Generation.create(year:i)
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
    Brand.create(name: 'Mitsubishi', acronym:'MT')

  for i in 0...brands.length
    Brand.create(name: brands[i], acronym:acronyms[i])
  end

types = [['Hatchback','3/5'],['Hatchback','3'],['Hatchback','5'],['Sedan','2'],['Sedan','4'],['Sedan','2/4'],['SUV'],['Minivan'],['Sedan/Hatchback','4/5'],['Sedan/Hatchback','3/4/5'],['Pick Up','2'],['Pick Up','4'],['Pick Up','2/4'],['Crossover'],['Van']]
types.each { |type|
  if type.count == 2
  CarType.new(name: type.first,doors: type.last)
  elsif
  CarType.new(name: type.first)
  end
}


@brand = Brand.find(2)
#@brand.save!
#modelacronym
@macronym= ModelAcronym.new(initials: "A4", model: "A4")
@macronym.brand = @brand
@macronym.save!
#generation
@generation = Generation.new(year: 2015)
@generation.save!
#car type
@car = CarType.create(name: "Sedan", doors: "4")
#generic car
@genericc = GenericCar.new(first_generation_year: 2010, last_generation_year: 2015, number_of_generation: "2", years: "2", gen_continues: FALSE)
@genericc.model_acronym = @macronym
@genericc.car_type=@car
@genericc.save!

#genericCar GEneration
#@genericcarG = GenericCarGeneration.new()
@genericc.generations<<@generation
@genericc.save!
#@genericc.generations<<@genericcarG

#generic car image NO
#@genericCarImage= GenericCarImage.new(image_file_name: "audi_prueba.jpg", image_content_type: "jpg", image_file_size: 31,image_updated_at:"1990-1-12 04:05:06")
#@genericCarImage.generic_car=@genericc
#@genericCarImage.save!

#genericFamily
@genericFamilyFather = GenericFamily.new(name: "GenericFamDad", description: "generic family Padre", code: "codepadre", father_id: nil, active:0, entrance_price_cents: 20, entrance_price_currency: "string", departure_price_cents: 2, departure_price_currency: "departure_price_currency")
@genericFamilySon = GenericFamily.create(name: "GenericFamSon", description: "generic family de Hijo", code: "codehijo", active:0, entrance_price_cents: 10, entrance_price_currency: "entrance_price_currency", departure_price_cents: 10, departure_price_currency: "departure_price_currency_3")
@genericFamilyFather.father=@genericFamilySon
@genericFamilyFather.save!


#moldspare NO
#@moldspare = MoldSpare.new(name: "moldspare", comment: "comentario del mold", mold_type: "mold_type", code: "code")
#moldComponent NO
#@moldComponent= MoldComponent.new(name: "moldComponent")
#@moldspare<<@moldComponent

#familylikelihood
#@familylikelihood = FamilyLikelihood.new( years: "2")
#@genericc<<@familylikelihood
#@genericFamilySon<<@familylikelihood

#TypeLikelihood
#@TypeLikelihood= TypeLikelihood.new( active: 0, years: "2")
#@car<<@TypeLikelihood
#@genericFamilySon<<@TypeLikelihood

#SpareLikelihood
#@SpareLikelihood= SpareLikelihood.new()
#@GenericSpare<<@SpareLikelihood
#@genericFamilySon<<@SpareLikelihood

#GenericSpare
@GenericSpare = GenericSpare.create(brand: "Audi_spares", type_of_spare: "tipo spare", name: "Manija", region: "China", description: "Refaccion tal", code: "code")
@genericc.generic_families<<@genericFamilyFather
@car.generic_families<<@genericFamilyFather
@GenericSpare.generic_families<<@genericFamilyFather
@genericc.save!
@car.save!
@GenericSpare.save!

#GenericSpareImage NO
#@GenericSpareImage =GenericSpareImage.new(generic_spare_id: "string")

#genericFitable NO

#Warehouse
@Warehouse=Warehouse.create( branch: "branch", location: "somewhere", geolocation: "19.0364239,-98.2211362", code: "code")

#Prevaluation
@Prevaluation = Prevaluation.create(number: "3", policy: "policy...", subsection: "subsect", expedition_date: "2014-11-08", valuation_date: "2015-01-08", deductible_value: 100.00, commercial_value: 200.00, requires_crane: 1, collection_status: 1, special_conditions: "special conditions", third_insured: 0, agent_name: "Ronny G", comment: "comentario adad")

#stockcar
@stock = StockCar.new(color: "rojo", door_number: 4, serie: "1200", motor: "vskqwwwsa1233", license_plates: "PYB3139", inventory_description: "auto sedan", special_equipment: "n/a", economic_number: "2000", status: "alive", code: "code")
@genericc.stock_cars<<@stock
@Warehouse.stock_cars<<@stock
@stock.prevaluation=@Prevaluation
@genericc.save!
@Warehouse.save!
@stock.save!


#StockCarImage NO
#prevaluationimage NO
#Valuation NO

#Insured
@Insured=Insured.new( third: TRUE, name: "Qualitas", telephone: 5409900, email: "insure@syrat.com")
@Insured.prevaluation=@Prevaluation
@Insured.save!

#Order
@Order = Order.new(entrance_date: "2015-04-08")
@Order.warehouse=@Warehouse
@Order.save!

#supplier
#HEAD
@SupplierType = SupplierType.create(name: "Desmontado Original")#Taller Automotriz
@Original = SupplierType.create(name: "Original")#agencia
@Taiwan = SupplierType.create(name: "Taiwan")#Radec


 #Supplier taller automotriz
@Supplier = Supplier.new( name: "Taller Automotriz")
 @Supplier.supplier_type=@SupplierType
 @Order.suppliers<<@Supplier
 @Supplier.save!
 @Order.save!

 @Agencia = Supplier.new( name: "Agencia")
 @Agencia.supplier_type=@Original
 @Order.suppliers<<@Agencia
 @Agencia.save!
 @Order.save!

 @Radec = Supplier.new( name: "Radec")
 @Radec.supplier_type=@Taiwan
 @Order.suppliers<<@Radec
 @Radec.save!
 @Order.save!

 #supplier_codes
 @supplier_codes = SupplierCode.create(generic_family_id:@genericFamilyFather.id,supplier_id:@Supplier.id,code:"#{@genericFamilyFather.id}#{@Supplier.id}#{'asdas'}" )
 @supplier_codes = SupplierCode.create(generic_family_id:@genericFamilyFather.id,supplier_id:@Agencia.id,code:"#{@genericFamilyFather.id}#{@Agencia.id}#{'asdas'}" )
 @supplier_codes = SupplierCode.create(generic_family_id:@genericFamilyFather.id,supplier_id:@Radec.id,code:"#{@genericFamilyFather.id}#{@Radec.id}#{'asdas'}" )



#OrderSupplier
@OrderSupplier = OrderSupplier.create()

#Supply
@Supply= Supply.new(name: "Supply", minimum_qty: 1, cost: 200, description: "description supply", weight: 20, brand: "Brand", quantity: 10, size: "20", code: "code")
@Supply.supplier=@Supplier
@Supply.save!

#StockFamily
@StockFamily = StockFamily.new( quantity: 10, color: "rojo", car_order_id:@genericc.id)
@StockFamily.supplier=@Supplier
@StockFamily.order=@Order
#@StockFamily.subsection=@Subsection
@StockFamily.stock_car=@stock
@StockFamily.generic_family=@genericFamilySon
#@StockFamily.car_order = @genericc
@StockFamily.save!

#FamilyHistory
@FamilyHistory= FamilyHistory.new( description: "descripcion lalal")
@FamilyHistory.stock_family=@StockFamily
@FamilyHistory.save!

#StockFamilyImage NO

#StockSpare
@StockSpare= StockSpare.new(status: "status", description: "description text", code: "asdads", color: "rojo", supplier_code: "codes")
@StockSpare.stock_family=@StockFamily
#@StockSpare.subsection=@Subsection
@StockSpare.warehouse=@Warehouse
@StockSpare.stock_car=@stock
@StockSpare.generic_spare=@GenericSpare
@StockSpare.save!

#SpareHistory
@SpareHistory= SpareHistory.new( description: "description SpareHistory")
@SpareHistory.stock_spare=@StockSpare
@SpareHistory.save!

#StockSpareImage NO

# </TESTING>
