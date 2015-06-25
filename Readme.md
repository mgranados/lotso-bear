
#H1 SYRAT

#H2 specs for install:

#H3 Install Ruby version '2.0.0' and Rails '4.x.x'

#H3Railroady.

#H3 development default server
#H3 passenger on local server
#H3 heroku unicorn
#H3 PostgresSQL for DB (postgresapp better)
	···postgres gem
	···run ```export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin



development BD: syrat_development
production BD: syrat_production_live
 ···config it:
 			create on config/database.yml
 			development:
			 adapter: postgresql
			 database: syrat_development
			 pool: 5
			 timeout: 5000
			 username: YOUR_POSTGRES_USERNAME
			 password: YOUR_POSTGRES_PASSWORD

			# Warning: The database defined as "test" will be erased and
			# re-generated from your development database when you run "rake".
			# Do not set this db to the same as development or production.
			test:
			 adapter: postgresql
			 database: syrat_test
			 pool: 5
			 timeout: 5000
			 username: YOUR_POSTGRES_USERNAME
			 password: YOUR_POSTGRES_PASSWORD


for installation:
run: rake db:migrate

for creating and filling the database.

on the root of the repo to test it
run: rails s 

on navigator:
localhost:3000


#H2 MODEL:

https://github.com/preston/railroady
···already on the gem file.

run: rake diagram:all

diagrams are generated on doc/

model is based on 
		···GenericFamily
		···StockFamily
		···GenericSpare
		···StockSpare
		···GenericCar
		···Warehouse

#H3 GenericFamily:
	Generic car part that fits a Generic Car.

#H3 StockFamily
	Generic Family part, once it arrives to warehouse or it is install in a car. (It's on stock)

#H3 GenericSpare
	Small car parts, that belong to a GenericFamily

#H3 StockSpare
	GenericSpare once it enters to a warehouse or it is install in a car. (It's on stock)


#H2 ROUTES:
	
	routes: config/routes.rb

	Root 
	Controller session action new
	GET / 












