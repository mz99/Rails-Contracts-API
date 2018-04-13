Rails Contracts API
This project was made to create simple api endpoints for a simple contract management api app. The project is a sample org that can create users, and manage contracts for each user.  


Installation
Make sure you have ruby version 2.3.1 installed on your system.

Clone the repository:

    git clone https://github.com/mz99/Rails-Contracts-API
Install dependencies

cd Rails-Contracts-API
    bundle install
Run database migrations

    bin/rake db:create
    bin/rake db:migrate

Test
The tests are created with RSpec, grouped into:
Model specs
Request specs

You can run all of the tests with in your Rails-Contracts-API folder:
bin/rspec

Or selectively:
bin/rspec spec/models
bin/rspec spec/requests


Usage
Start the app with:
bin/rails server

API Endpoints
POST   /api/v1/auth                                  Create JWT token
POST   /api/v1/users/:user_id/contracts              Creates new contract for associated user
GET    /api/v1/users/:user_id/contracts/:id          Shows specified contract for associated user
DELETE /api/v1/users/:user_id/contracts/:id          Deletes the specified contract for associated user
POST   /api/v1/users                                 Creates a user

User
Create a user by sending a post request with parameters email:, password to endpoint:
/api/v1/users

Authentication
Once a user has been created, attain a JWT token by sending a post request to :
/api/v1/auth
