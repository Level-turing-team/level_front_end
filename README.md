# Level

![Level](https://imgur.com/kXAkuci.png)

 * There are plenty of sites to showcase any type of art that you the artist want to showcase, LEVEL is more focused on generating collaboration and human interaction between artists themselves to further their art.  LEVEL was made with the idea of connecting artists to artists, you can showcase some of your work and view curated galleries of other artist's work so the community can have a feel for each other's work and how/why you'd want to collaborate with each other.  LEVEL concentrates just as much on what work you want to showcase as much as it does connecting you to other artists so that as a community you can grow with other artists together.  
 * Get connected. Make Art. Level the playing field.

## Table of Contents

  - [Getting Started](#getting-started)
  - [Runing the tests](#running-the-tests)
  - [Method Highlights/Tests](#method-highlights/tests)
  - [Running the tests](#running-the-tests)
  - [API End Points](#api-end-points)
  - [License](#license)
  - [Acknowledgments](#acknowledgments)

  https://github.com/orgs/Level-turing-team/people





  


### Why LEVEL? Why did we bother to make this app?

 As artists ourselves we are frankly sick and tired of the commercialization of other apps that artists almost have no choice in using.  We want to build a community of artists for artists.  For this reason you will NEVER be able to see who is "following" you, only who you are "following".  Wait, why is following in quotes. Well because even though it works like a follow on other apps (not like a two-way friend) we have changed the terminology to "Circle".  When you add someone to your Cirlce you will see all of their posts in your feed but unless they also add you to their Circle they will not see your posts in their feed.  
 


## How to use LEVEL

#### insert image of log in with google to log in page


 
 Visit [LEVEL Homepage](https://arcane-scrubland-46989.herokuapp.com/)
 Use your Google account to log in.
 
![Registration Page](https://imgur.com/4u2cyex.png)
 
  * To fully access LEVEL and use the application as intended we do require all users to upload a profile photo of your choosing, a user name for yourself, the zip code you are located in, and a brief artist bio.  

  * The reason for this is LEVEL is inteded to be a place to generate real world collaboration between artists and we feel this information is the baseline required to start fostering those connections.
 
 ![Dashboard](https://imgur.com/ysAzuhN.png)
 
 * After you have completed the necessary registration steps you will be redirected to your dashboard for the application.  You will see the profile photo and user name you selected for yourself during registration.  
 
 * From your user dasbhoard you will see a section for creating a post.  A post is intended to share some sort of info.  How you are feeling, a show you are going to or hosting, an invitation to collaborate, etc.  A post has options to add a link or a photo but they are optional.
 
 * There will also be a section that is your feed where you see posts from other artists in your Circle.
 
 * The final section we have currently available will be an area that displays all members currently in your Circle.  Click the link associated with their username to be taken to their profile.
 
![Profile](https://imgur.com/UEmoSf1.png)

 * Any profile you visit will have that user's profile photo and user name.  Underneath that you will see how far away their zipcode is from you and a button to add them to your Cirlce.
 
 * There will also be sections for that artist's bio, the main photo for a gallery they have uploaded with a link to that full gallery, and a section for their posts.
 
  ![Gallery](https://imgur.com/0IWSzZr.png)
 
 * After navigating to the gallery page from the artist's profile page you will see all the photos from that gallery.  There will also be a section above with that gallery's name and info regarding that gallery.  
 
 * To the side you will see the main photo for other galleries from that artist as well as links to view all the photos in that gallery.
 
 ![Discover](https://imgur.com/iGSPX6O.png)

 * The discover page is how you find other artist's to add to your Circle and collab with.  You can search by name, location or tag but can only search by one of those three at a time. Examples of tag being "musician", "painter", "photographer", etc.  
 
 * Also utilize the artists near me section to find artists in your area to collaborate with by searching.
 
 
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



## Built With

  - [Ruby on Rails](https://rubyonrails.org/)
  - [HTML](https://www.w3schools.com/html/html_intro.asp)
  - [Bootstrap](https://getbootstrap.com)


## Links To Other Repos
  - [Backend](https://github.com/Level-turing-team/level_backend)
  - [Zip Code Micro Service](https://github.com/Level-turing-team/level-zipcode-microservice)


## Acknowledgments

  - My 2011 BE cohorts that helped all of us out a lot.


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

