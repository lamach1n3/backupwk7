# Rocket Elevators Information System <img src="https://rocketmax.xyz/assets/RE/re_logo.png" align="right" alt="Rocket Elevators logo by Maxime Auger" width="100" height="">



Application for website of the Company of Rocket Elevators
1. In this weeks requirement we were task with elevating our static site and turn it into a web application on MVC (Model - View - Controller) Ruby on Rails Application
      - hjgjghj
      - hgfvhv

2. Running a rails server throught linux using Ubuntu
3. Setting Database with Mysql and Postgresql ( even thought we didnt use it this week(Postgresql)) 
4. Creating Database in Mysql and linking it to the Applicationog 
5. Setting a Back office to the site and added
      - Login In page
      - Admin page
      - Employees in Admin section
      - Users in Admin section
      - Quotes in Admin section
      - Charts in Admin section
      - Diagrams in Admin section

6. Using the Database with Rails
7. Accessing the admin section
8. Routes.rb
9. URL for our site
10. Gem used
11. Deployement


## URL

<https://rocketmax.xyz/>

## Gems used <img src="https://w7.pngwing.com/pngs/96/713/png-transparent-ruby-on-rails-programming-language-rubygems-php-ruby-gem-angle-heart-logo.png" align="right" alt="Rocket Elevators logo by Maxime Auger" width="70" height="">
* gem 'devise'
      https://github.com/heartcombo/devise

* gem 'rails-admin'
      https://github.com/sferik/rails_admin/

* gem 'faker'
      https://github.com/faker-ruby/faker

* gem 'rubocop'
      https://github.com/rubocop-hq/rubocop

* gem 'sprockets-rails'
      https://github.com/rails/sprockets-rails/

* gem 'hirb'
      http://tagaholic.me/hirb/doc/index.html

      to use open  
            -open rails console in terminal
            -run : Hirb.enable ( everytime you open the console)

* gem 'cancancan'
      https://github.com/CanCanCommunity/cancancan/
* 
* 
* 

### pour la creation des tables dans mysql avec model
rails g model TableName
pour Quotes Employees Users

### pour les seeds

## Infos development:
### After pull:
```
bundle install
rails db:drop
rails db:create
rails db:migrate
rails db:seed ( if you want to populate your database )
```
📚 Instructions to acces to the admin panel:

To log as Admin:

```sh
1. Navigation bar : Member
2. Login
3. Username: mathieu.houde@codeboxx.biz
   password: 123456
4. Member : Admin Panel
```

## :memo: Routes

- homepage: <b>/</b>
- residential page: <b>/residential</b>
- commercial page: <b>/commercial</b>
- form page: <b>/form</b>
- thank you page: <b>/thank-you</b>
- Admin panel: <b>/admin</b>

```sh
rake routes
```
![](routes.png)





















# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# Rocket_Elevators_Information_System
