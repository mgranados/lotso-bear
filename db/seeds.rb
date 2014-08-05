# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create!(name:'admin',username:'admin',password:'admin',email:'admin@admin.com', privileges:'admin',password_confirmation:'admin')

operador = User.create!(name:'operador',username:'operador',password:'operador',email:'operador@operador.com', privileges:'operador',password_confirmation:'operador')

capturista = User.create!(name:'capturista',username:'capturista',password:'capturista',email:'capturista@capturista.com', privileges:'capturista',password_confirmation:'capturista')

gerente = User.create!(name:'gerente',username:'gerente',password:'gerente',email:'gerente@gerente.com', privileges:'gerente',password_confirmation:'gerente')

ajustador = User.create!(name:'ajustador',username:'ajustador',password:'ajustador',email:'ajustador@ajustador.com', privileges:'ajustador',password_confirmation:'ajustador')
