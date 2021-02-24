require 'faker'


def user_create(email, password, password_confirmation, admin)
  @user = User.new({email: email, password: password, password_confirmation: password_confirmation, admin: admin})
  @user.save!
  return @user
end

def employee_create(first_name, last_name, function, phone, email)
  @user = user_create(email, 123456, 123456, true)
  @employee = Employee.create({first_name: first_name, last_name: last_name, function: function, phone: phone, email: email, user: @user})
  @employee.save!
end

def customer_create(company_name, cpy_contact_email, tech_manager_service_email)
  @user = user_create(cpy_contact_email, 123456, 123456, false)
  @customer = Customer.create({company_name: company_name, cpy_contact_email: cpy_contact_email, 
  tech_manager_service_email: tech_manager_service_email, user: @user})
  @customer.save!

  building_create(tech_manager_service_email, @customer)
end 

def building_create(tech_contact_email, customer)
  @building = Building.new({tech_contact_email: tech_contact_email, customer: customer, address: address_create("A", "B", "C", "123", "456", "D", "123132", "Canada", "yoyo")})
  @building.save!

  battery_create(@building)
  building_detail_create(@building)
end

def address_create(type_adress, status, entity, number_street, suite_apt, city, postal_code, country, notes)
  @address = Address.new({type_adress: type_adress, status: status, entity: entity, number_street: number_street, suite_apt: suite_apt, city: city,
   postal_code:postal_code, country: country, notes: notes})
  @address.save!
  return @address
end

def building_detail_create(building)
  @building_detail = BuildingDetail.new({building: building})
  @building_detail.save!
end

def battery_create(building)
  @battery = Battery.new({building: building})
  @battery.save!

  column_create(@battery)
end

def column_create(battery)
  @column = Column.new({battery: battery})
  @column.save!

  elevator_create(@column)
end

def elevator_create(column)
  @elevator = Elevator.new({column: column})
  @elevator.save!
end

employee_create("Nicolas", "Genest", "CEO", 'roc-kets', "nicolas.genest@codeboxx.biz")
employee_create("Nadya", "Fortier", "Director", "roc-kets", "nadya.fortier@codeboxx.biz")
employee_create("Martin", "chantal", "Director Assistant", "roc-kets", "martin.chantal@codeboxx.biz")
employee_create("Mathieu", "Houde", "Captain", "roc-kets", "mathieu.houde@codeboxx.biz")
employee_create("David", "Boutin", "Engineer", "roc-kets", "david.boutin@codeboxx.biz")
employee_create("Mathieu", "Lortie", "Engineer", "roc-kets", "mathieu.lortiet@codeboxx.biz")
employee_create("Thomas", "Carrier", "Engineer", "roc-kets", "thomas.carriert@codeboxx.biz")
employee_create("Admin1", "Admin1", "Admin1", "roc-kets", "admin1@admin1.com")
employee_create("Admin", "Admin", "Admin", "roc-kets", "admin@admin.com")

customer_create("apple", "apple@apple.com", "tech@apple.com")

# To setup customers they must be entered manually by the site administrator

# Customer.create(company_name: "Apple", cpy_contact_email: "apple@apple.com", 
# tech_manager_service_email: "tech@apple.com")

# for each customer we also create a user

# Customer.all.each do |customer|
#   user = User.new({
#     email: customer.cpy_contact_email,
#     password: 123456,
#     password_confirmation: 123456})
#   customer.user = user
#   customer.save!
#  end 


#  Customer.all.each do |customer|
#   building = Building.new({
#     tech_contact_email: customer.tech_manager_service_email})
#   building.customer_id = customer
#   building.save!
#  end 


#  Building.all.each do |building|
#   building_details = BuildingDetail.new({
#     building_id: building})
#   building_details.save!
#  end 


#  Building.all.each do |building|
#   battery = Battery.new({
#     building_id: building})
#   battery.save!
#  end 


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

  #  Building.all.each do |building|
  #   address = Address.new({
  #     type_adress: "Building address",
  #     status: "Status",
  #     entity: "Building",
  #     number_street: Faker::Address.street_address,
  #     suite_apt: Faker::Address.secondary_address,
  #     city: Faker::Address.city,
  #     postal_code: Faker::Address.zip_code,
  #     country: Faker::Address.country,
  #   })
  #   building.address_id = address.number_street
  #   address.save!
  #  end 