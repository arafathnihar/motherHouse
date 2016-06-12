# Mother House

# drop existing database
rake db:drop:all

# create the database
rake db:create:all

# migrate to database tables
rake db:migrate

# rollback from migrations
rake db:rollback
/* 
 * repeat command till all rollbacks are over,
 * if error pops on rollback for foreign keys, drop the relevent table
 * run 'rake db:rollback' calls again 
 */

# run the database seeder to populate the database with initial records
rake db:seed

# run the server
rails server
