# Mother House

### Drop existing database
`rake db:drop:all`

### Create the database
`rake db:create:all`

### Migrate to database tables
`rake db:migrate`

### Rollback from migrations
`rake db:rollback`
 * repeat command till all rollbacks are over,
 * if error pops on rollback for foreign keys, drop the relevent table
 * run 'rake db:rollback' calls again

### Run the database seeder to populate the database with initial records
`rake db:seed`

### Run the server
`rails server`
