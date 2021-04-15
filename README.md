# Level
  * There are plenty of sites to host all types of art, from music to photos or anything else you want to share, there’s less supply of apps and resources to connect you one on one with other individuals who share your drive and passion.  Level helps you more easily connect with local people through our location based searches who share your passion and drive for your creative endeavors. Level concentrates as much of your work as you want from other hosting services to help ensure the connections you make are fruitful and grounded in common interest prior to taking the jump and meeting a co-collaborator in person.
Get connected. Make Art. Level the playing field.

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


## Method Highlights/Tests

### Search for an items by prices
  * Trying out public_send, this particular method send the values to the method inside the model.

  <img src="https://user-images.githubusercontent.com/46826902/114095050-38203900-987a-11eb-8c5e-281b5857c62f.png" width="75%" height="50%">

  * Utilizing scope (class method), and the naming convention, the public_send able to pass the params value into the correct method.

  <img src="https://user-images.githubusercontent.com/46826902/114096172-98fc4100-987b-11eb-8d43-e32c8829bb2d.png" width="75%" height="50%">

### Testing this Method
  * Testing items by prices
     - Happy Path

     <img src="https://user-images.githubusercontent.com/46826902/114103746-e631e000-9886-11eb-962f-09fad3cc34fa.png" width="75%" height="50%">\

     <img src="https://user-images.githubusercontent.com/46826902/114104388-001ff280-9888-11eb-9eab-19249010ee5f.png" width="75%" height="50%">

     - Sad Path

     <img src="https://user-images.githubusercontent.com/46826902/114103855-12e5f780-9887-11eb-9b59-ebf451a4cb41.png" width="75%" height="50%">

     <img src="https://user-images.githubusercontent.com/46826902/114104458-1f1e8480-9888-11eb-9510-1107cc82540b.png" width="75%" height="50%">

     - Edge Case

     <img src="https://user-images.githubusercontent.com/46826902/114105566-39596200-988a-11eb-896e-0e966b9fe9e3.png" width="75%" height="50%">



## Running the tests

In order to run all tests and see coverage run:

  ```
  bundle exec rspec
  ```

## API End Points
  To access the API end points, type in rails server then copy and paste the end points into the browser with the values.

  * All Merchants    - http://localhost:3000/api/v1/merchants then add ?per_page=<number_per_page>&page=<page_number>
  * One Merchant     - http://localhost:3000/api/v1/merchants/{{merchant_id}}
  * Find Merchants   - http://localhost:3000/api/v1/merchants/find?name={{name}}
  * Find_all Merc.   - http://localhost:3000/api/v1/merchants/find_all?name={{name}}
  * Merchant's Items - http://localhost:3000/api/v1/merchants/{{merchant_id}}/items
  * Merc most_items  - http://localhost:3000/api/v1/merchants/most_items?quantity={{quantity}}
  * Merc revenue     - http://localhost:3000/api/v1/revenue/merchants?quantity={{quantity}}

  * Items            - http://localhost:3000/api/v1/items then add ?per_page=<number_per_page>&page=<page_number>
  * One Item         - http://localhost:3000/api/v1/items/{{item_id}}
  * Create Item      - Post 'http://localhost:3000/api/v1/items'
  * Update Item      - Patch 'http://localhost:3000/api/v1/items'
  * Delete Item      - Delete 'http://localhost:3000/api/v1/items/{{item_id}}'
  * Item's Merchant  - http://localhost:3000/api/v1/items/{{item_id}}/merchant
  * Find Items name  - http://localhost:3000/api/v1/items/find?name={{name}}
  * Find Items Price - http://localhost:3000/api/v1/items/find?min_price={{min_price}}
                       http://localhost:3000/api/v1/items/find?max_price={{max_price}}
                       http://localhost:3000/api/v1/items/find?max_price={{max_price}}&&min_price={{min_price}}
  * Revenue          - http://localhost:3000/api/v1/revenue?start={{start_date}}&end={{end_date}}
  * Single Merc Rev  - http://localhost:3000/api/v1/revenue/merchants/{{merchant_id}}

## Built With

  - Ruby/Rails
  - HTML

## License

  - Me and me only

## Acknowledgments

  - My 2011 BE cohorts that helped me out a lot.
