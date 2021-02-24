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


def customer_create(company_name, cpy_contact_full_name, cpy_contact_phone, cpy_contact_email, cpy_description, tech_authority_service_full_name,
  tech_authority_service_phone, tech_manager_service_email)
  @user = user_create(cpy_contact_email, 123456, 123456, false)
  @customer = Customer.create({
  company_name: company_name, 
  cpy_contact_full_name: cpy_contact_full_name, 
  cpy_contact_phone: cpy_contact_phone, 
  cpy_contact_email: cpy_contact_email, 
  cpy_description: cpy_description, 
  tech_authority_service_full_name: tech_authority_service_full_name, 
  tech_authority_service_phone: tech_authority_service_phone, 
  tech_manager_service_email: tech_manager_service_email, 
  user: @user})
  @customer.save!

  rand(1..3).times do 
    building_create(
      cpy_contact_full_name,
      cpy_contact_email,
      cpy_contact_phone,
      tech_authority_service_full_name,
      tech_manager_service_email, 
      tech_authority_service_phone,
      @customer)
  end
end 


def building_create(adm_contact_full_name, adm_contact_email, adm_contact_phone, tech_contact_full_name, tech_contact_email, tech_contact_phone, customer)
  @building = Building.new({
  adm_contact_full_name: adm_contact_full_name, 
  adm_contact_email: adm_contact_email, 
  adm_contact_phone: adm_contact_phone, 
  tech_contact_full_name: tech_contact_full_name, 
  tech_contact_email: tech_contact_email, 
  tech_contact_phone: tech_contact_phone, 
  customer: customer, 
  address: address_create( # Not randomized yet
    "A", 
    "B", 
    "C", 
    "123", 
    "456", 
    "D", 
    "123132", 
    "Canada", 
    "yoyo")})
  @building.save!

  battery_create(@building)
  building_detail_create(@building)
end


def address_create(type_address, status, entity, number_street, suite_apt, city, postal_code, country, notes)
  @address = Address.new({
    type_address: type_address, status: status, entity: entity, number_street: number_street, suite_apt: suite_apt, city: city,
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

  rand(1..6).times do
    column_create(@battery)
  end
end


def column_create(battery)
  @column = Column.new({battery: battery})
  @column.save!

  rand(2..4).times do
    elevator_create(@column)
  end
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

10.times do 
  customer_create(
    Faker::Company.name,
    Faker::Name.name,
    Faker::PhoneNumber.cell_phone,
    Faker::Internet.email,
    "Description",
    Faker::Name.name,
    Faker::PhoneNumber.cell_phone,
    Faker::Internet.email
  )  
end


13.times do
  user_create(Faker::Internet.email, 111111, 111111, false)
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