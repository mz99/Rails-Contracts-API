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

Built With
Ruby on Rails - The web framework used
Maven - Dependency Management
ROME - Used to generate RSS Feeds
Contributing
Please read CONTRIBUTING.md for details on our code of conduct, and the process for submitting pull requests to us.

Versioning
We use SemVer for versioning. For the versions available, see the tags on this repository.

Authors
Billie Thompson - Initial work - PurpleBooth
See also the list of contributors who participated in this project.

License
This project is licensed under the MIT License - see the LICENSE.md file for details

Acknowledgments
Hat tip to anyone who's code was used
Inspiration
etc
