
#SYRAT#

## specs for install:##

### Install Ruby version '2.0.0' and Rails '4.x.x'###

###Railroady.###

### development default server###
###H3 passenger on local server###
### heroku unicorn ###
### PostgresSQL for DB (postgresapp better) ###
	* postgres gem
	#### Run: ####
	export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin



 * development BD: syrat_development
 * production BD: syrat_production_live
 * config it:
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


##for installation:##
####run:####
rake db:migrate

###for creating and filling the database.###
###on the root of the repo to test it###
####run:####
rails s 

###on navigator:###
localhost:3000


## MODEL: ##

* https://github.com/preston/railroady
* already on the gem file.

####run:####
rake diagram:all

####diagrams are generated on doc/####

* model is based on 
		* GenericFamily
		* StockFamily
		* GenericSpare
		* StockSpare
		* GenericCar
		* Warehouse

### GenericFamily: ###
#### Generic car part that fits a Generic Car. ####

### StockFamily ###
#### Generic Family part, once it arrives to warehouse or it is install in a car. (It's on stock) ####

### GenericSpare ###
#### Small car parts, that belong to a GenericFamily ####

### StockSpare ###
#### GenericSpare once it enters to a warehouse or it is install in a car. (It's on stock) ####


## ROUTES: ##
	
	routes: config/routes.rb
	Root 
	Controller session action new
	GET / 












