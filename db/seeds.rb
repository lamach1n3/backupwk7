
require 'faker'


# To setup employees they must be enter manually by the site administrator 

Employee.create(first_name:"Nicolas", last_name:"genest", function:"CEO", phone:"roc-kets", email:"nicolas.genest@codeboxx.biz")
Employee.create(first_name:"Nadya", last_name:"Fortier", function:"Director", phone:"roc-kets", email:"nadya.fortier@codeboxx.biz" )
Employee.create(first_name:"Martin", last_name:"chantal", function:"Director Assistant", phone:"roc-kets", email:"martin.chantal@codeboxx.biz" )
Employee.create(first_name:"Mathieu", last_name:"Houde", function:"Captain", phone:"roc-kets", email:"mathieu.houde@codeboxx.biz" )
Employee.create(first_name:"David", last_name:"Boutin", function:"Engineer", phone:"roc-kets", email:"david.boutin@codeboxx.biz" )
Employee.create(first_name:"Mathieu", last_name:"Lortie", function:"Engineer", phone:"roc-kets", email:"mathieu.lortiet@codeboxx.biz" )
Employee.create(first_name:"Thomas", last_name:"Carrier", function:"Engineer", phone:"roc-kets", email:"thomas.carriert@codeboxx.biz" )
Employee.create(first_name:"Admin", last_name:"Admin", function:"Admin", phone:"roc-kets", email:"admin@admin.com" )
Employee.create(first_name:"Admin1", last_name:"Admin1", function:"Admin1", phone:"roc-kets", email:"admin1@admin1.com" )

# # for each employees we also create a user with acces to the admin panel 

Employee.all.each do |employee|
    user = User.new({
      email: employee.email,
      password: 123456,
      password_confirmation: 123456,
      admin: true})
    employee.user = user
    employee.save!
   end 

# # we are supplying the client with some generate data using faker
# # so on top of our 7 employees which are also clients we will add 13 new users who dont
# # have access to the admin section using faker
# # you can add a new user simply by going to the logging menu and hit sign up

13.times do
  User.create(
    email: Faker::Internet.email,
    password: 111111,
    password_confirmation: 111111
  )
end


# Quote.create(install_fees: Faker::Date.between(from: '2017-09-23', to: '2020-09-25'),
#             quotes_name: Faker::Name.name          
# )
# if you fill in the quotes form it will automatically  add it to the quotes form but we will
# also provide you with a sample using "faker"

50.times do
  
      pl = ["Standard", "Premium", "Excelium"]
      bt = ["Residential", "Commercial", "Corporate", "Hybrid"]
      dateCreationUpdate = Faker::Date.between(from: '2017-09-23', to: '2020-09-25')
  Quote.create(
              install_fees: Faker::Number.between(from: 500, to: 2000),
              total_price: Faker::Number.between(from: 50000, to: 200000),
              product_line: (pl.sample),
              number_of_apartments: Faker::Number.between(from: 50, to: 200),
              number_of_floors: Faker::Number.between(from: 10, to: 70),
              number_of_basements: Faker::Number.between(from: 1, to: 10),
              number_of_corporations: Faker::Number.between(from: 1, to: 100),
              elevator_amount: Faker::Number.between(from: 1, to: 100),
              quotes_name: Faker::Name.name,
              quotes_email: Faker::Internet.email,
              quotes_company_name: Faker::Company.name,
              building_type: (bt.sample),
              final_price: Faker::Number.between(from: 50000, to: 800000),
              number_of_companies: Faker::Number.between(from: 1, to: 5),
              number_of_parking: Faker::Number.between(from: 50, to: 200),
              maximum_occupancy: Faker::Number.between(from: 50, to: 200),
              business_hours: Faker::Number.between(from: 0, to: 24),
              number_of_elevators: Faker::Number.between(from: 1, to: 15),
              unit_price: Faker::Number.between(from: 11000, to: 15000),
              # updated_at: dateCreationUpdate,
              # created_at:dateCreationUpdate
      )
  end

  # creating addresses for each user using faker?

  # User.all.each do |user|
  #   address = Address.new({
  #     type_adress: "User's address",
  #     status: "Status",
  #     entity: "User",                      
  #     number_street: Faker::Address.street_address,
  #     suite_apt: Faker::Address.secondary_address,
  #     city: Faker::Address.city,
  #     postal_code: Faker::Address.zip_code,
  #     country: Faker::Address.country,
  #   })
  #   address.save!
  #  end 

  # creating addresses for each building using faker

   Building.all.each do |building|
    address = Address.new({
      type_adress: "Building address",
      status: "Status",
      entity: "Building",
      number_street: Faker::Address.street_address,
      suite_apt: Faker::Address.secondary_address,
      city: Faker::Address.city,
      postal_code: Faker::Address.zip_code,
      country: Faker::Address.country,

      building.address_id = address.number_street
    })
    address.save!
   end 