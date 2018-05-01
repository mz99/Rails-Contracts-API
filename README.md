# Rails Contracts API
This project was made to create api endpoints for a simple contract management api app. The project is a sample org that can create users, and manage contracts for each user.  

![alt text](https://github.com/mz99/Rails-Contracts-API/blob/master/erd.jpg "ERD")


### Installation
Make sure you have ruby version 2.3.1 installed on your system.

Clone the repository:

    git clone https://github.com/mz99/Rails-Contracts-API

Install dependencies

cd Rails-Contracts-API

    bundle install

Run database migrations

    bin/rake db:create
    bin/rake db:migrate

### Test
The tests are created with RSpec, grouped into:
1. Model specs
2. Request specs

You can run all of the tests with in your Rails-Contracts-API folder:

    bin/rspec

Or selectively:

    bin/rspec spec/models
    bin/rspec spec/requests


### Usage
Start the app with:

    bin/rails server

### API Endpoints
    POST   /api/v1/auth                                  Create JWT token
    POST   /api/v1/users/:user_id/contracts              Creates new contract for associated user
    GET    /api/v1/users/:user_id/contracts/:id          Shows specified contract for associated user
    DELETE /api/v1/users/:user_id/contracts/:id          Deletes the specified contract for associated user
    POST   /api/v1/users                                 Creates a user

### User
Create a user by sending a post request with parameters to:

    POST /api/v1/users  
    email = 'test@test.com'
    password = '123456'

### Authentication
Once a user has been created, attain a JWT token by sending a post request to :

    POST /api/v1/auth
    email = 'test@test.com'
    password = '123456'

### Contract management
Once a JWT is given, place the JWT token in the request headers and then send a post request to:

    POST   /api/v1/users/:user_id/contracts
    contract[:vendor] = 'Lebara'
    contract[:starts_on] = '20/12/2018'     'DD/MM/YYYY' format
    contract[:ends_on] = '20/06/2019'       'DD/MM/YYYY' format
    contract[:price] = '35'
