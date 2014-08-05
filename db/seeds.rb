# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name:"Administrador", email:"admin@admin.com",password:"admin", password_confirmation:"admin", username: "Administrador", privileges:"admin")
User.create!(name:"Operador",email:"operador@operador.com",password:"operador", password_confirmation:"operador", username: "Operador", privileges:"operador")
User.create!(name:"Capturista",email:"capturista@capturista.com",password:"capturista", password_confirmation:"capturista", username: "Capturista", privileges:"capturista")
User.create!(name:"Gerente",email:"gerente@gerente.com",password:"gerente", password_confirmation:"gerente", username: "Gerente", privileges:"gerente")
User.create!(name:"Ajustador",email:"ajustador@ajustador.com",password:"ajustador", password_confirmation:"ajustador", username: "Ajustador", privileges:"ajustador")
