# Level
  * There are plenty of sites to host all types of art, from music to photos or anything else you want to share, there’s less supply of apps and resources to connect you one on one with other individuals who share your drive and passion.  Level helps you more easily connect with local people through our location based searches who share your passion and drive for your creative endeavors. Level concentrates as much of your work as you want from other hosting services to help ensure the connections you make are fruitful and grounded in common interest prior to taking the jump and meeting a co-collaborator in person.
Get connected. Make Art. Level the playing field.

 * There are plenty of sites to showcase any type of art that you the artist want to showcase, LEVEL is more focused on generating collaboration and human interaction between artists themselves to further their art.  LEVEL was made with the idea of connecting artists to artists, you can showcase some of your work and view curated galleries of other artist's work so the community can have a feel for each other's work and how/why you'd want to collaborate with each other.  LEVEL concentrates just as much on what work you want to showcase as much as it does connecting you to other artists so that as a community you can grow with other artists together.  Get connected. Make Art. Level the playing field.

  https://github.com/orgs/Level-turing-team/people

## Authors

- **Kyle Schulz**   

  * <img src="https://user-images.githubusercontent.com/46826902/114424033-fb538b00-9b74-11eb-884d-429d4ad4132d.png">https://github.com/kylejschulz
  * <img src="https://user-images.githubusercontent.com/46826902/114425392-43bf7880-9b76-11eb-811a-d3255ced4b3b.png">

- **Andrew Johnston**   

  * <img src="https://user-images.githubusercontent.com/46826902/114424033-fb538b00-9b74-11eb-884d-429d4ad4132d.png">https://github.com/avjohnston
  * <img src="https://user-images.githubusercontent.com/46826902/114425392-43bf7880-9b76-11eb-811a-d3255ced4b3b.png">

- **Joseph Budina**    

  * <img src="https://user-images.githubusercontent.com/46826902/114424033-fb538b00-9b74-11eb-884d-429d4ad4132d.png">https://github.com/josephbudina
  * <img src="https://user-images.githubusercontent.com/46826902/114425392-43bf7880-9b76-11eb-811a-d3255ced4b3b.png">

- **Ben Fulton**     

  * <img src="https://user-images.githubusercontent.com/46826902/114424033-fb538b00-9b74-11eb-884d-429d4ad4132d.png">https://github.com/b-enji-cmd
  * <img src="https://user-images.githubusercontent.com/46826902/114425392-43bf7880-9b76-11eb-811a-d3255ced4b3b.png">

- **Jake Volpe**    

  * <img src="https://user-images.githubusercontent.com/46826902/114424033-fb538b00-9b74-11eb-884d-429d4ad4132d.png">https://github.com/javolpe
  * <img src="https://user-images.githubusercontent.com/46826902/114425392-43bf7880-9b76-11eb-811a-d3255ced4b3b.png">

- **Jesus Quezada-Guillen**

  * <img src="https://user-images.githubusercontent.com/46826902/114424033-fb538b00-9b74-11eb-884d-429d4ad4132d.png">https://github.com/jequeza
  * <img src="https://user-images.githubusercontent.com/46826902/114425392-43bf7880-9b76-11eb-811a-d3255ced4b3b.png">

- **Kris Litman**     

  * <img src="https://user-images.githubusercontent.com/46826902/114424033-fb538b00-9b74-11eb-884d-429d4ad4132d.png">https://github.com/krislitman
  * <img src="https://user-images.githubusercontent.com/46826902/114425392-43bf7880-9b76-11eb-811a-d3255ced4b3b.png">

- **Khoa Nguyen**   

  * <img src="https://user-images.githubusercontent.com/46826902/114424033-fb538b00-9b74-11eb-884d-429d4ad4132d.png"> - https://github.com/Omegaeye
  * <img src="https://user-images.githubusercontent.com/46826902/114425392-43bf7880-9b76-11eb-811a-d3255ced4b3b.png">

## Table of Contents

  - [Getting Started](#getting-started)
  - [Runing the tests](#running-the-tests)
  - [Method Highlights/Tests](#method-highlights/tests)
  - [Running the tests](#running-the-tests)
  - [API End Points](#api-end-points)
  - [License](#license)
  - [Acknowledgments](#acknowledgments)

## Getting Started

### GemFile/Dependency

  ```
  gem 'fast_jsonapi'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'launchy'
  gem 'pry'
  gem 'simplecov'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'orderly'
  gem 'factory_bot_rails'
  gem 'faker'
  ```
  
### How LEVEL is set up

 Level is hosted on Heroku between three different repositories of code.  A frontend built with a Rails Application utilizting bootstrap.  A backend built with an API only Rails applicaton.  And a micro service using the Sinatra framework.  You the user will only have to interact with the frontend to access the app fully like you would any other app.  LEVEL is currently set up to be focused on photographers but we aim to open the platform up to many other mediums (reffered to as "Tags") in the future. LEVEL will allow you to upload and display your work but the focus should be on a curated selection rather than your whole cataloge so as to more narrowly focus on the pieces, themes, or motifs you want to focus on.


## How to use LEVEL

 As stated above LEVEL is a hosted webservice so you will need an internet connection to access the application.  To be as openly accessible as possible and provide and adequate level of security, logging in and log in related security is handled through Google OAuth.  You will need a google account to access this service and your LEVEL account will be linked to that Google account.  
  <insert image of log in with google to log in page>

### Prerequisites

What things you need to install the software and how to install them

* rails
```sh
gem install rails --version 5.2.4.3
```

### Installing

    1. Clone Repo
    2. Install gem packages: `bundle install`
    3. Setup the database: `rails db:create`
    4. Migrate and Seed the database: `rails db:setup`


### Khoa/Joseph Notes
 * The from omniauth method living inside the user model is consuming the information from google authentication and creating that user(see method for details)
   * This info covers first name, last name, and email, but it doesn't cover the usename and zip attributes
   * the way we have this set up is if the user has not registered yet they will be redirected to a registeration form asking for those details and that will route the user to the user update method
 * In order for you to have access to the google auth info you will need to run `bundle exec figaro install` and then will need to add the client id and secret from the link provided below
https://console.cloud.google.com/apis/credentials/oauthclient/200802976231-hm6uqid00ehcbavj9l8s1nqna55rg40i.apps.googleusercontent.com?project=level-local-3000

 * testing omniauth is interesting and you will need to look at the methods provided in rails helper in order to mock the google auth/ ian posted more info on this after we completed testing so feel free to update if needed. This is the link he provided in code help
https://gist.github.com/iandouglas/a9942814d016f2090b9f27dde848b565

 * Our plan to edit user info from the settings page is to use the dashboard edit html page and that should route the user info to the user update action/ A SECOND UPDATE METHOD SHOULDN'T NEED TO BE CREATED FOR THIS 
 * bootstrap and j query has not been implemted so feel free to style if interested. We have not added much in terms of style
 * The travis ci yml is setup in a way that seems to still push to heroku if all tests pass however it says otherwise. We changed the branch name from travis to main which broke travis, so we changed it back. It needs to be fixed.
 * For any more clarification hit us up
## Built With

  - Ruby/Rails
  - HTML

## License

  - Me and me only

## Acknowledgments

  - My 2011 BE cohorts that helped all of us out a lot.
