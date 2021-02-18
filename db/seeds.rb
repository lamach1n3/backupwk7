
require 'faker'



Employee.create(first_name:"Nicolas", last_name:"genest", function:"CEO", phone:"roc-kets", email:"nicolas.genest@codeboxx.biz" )
Employee.create(first_name:"Nadya", last_name:"Fortier", function:"Director", phone:"roc-kets", email:"nadya.fortier@codeboxx.biz" )
Employee.create(first_name:"Martin", last_name:"chantal", function:"Director Assistant", phone:"roc-kets", email:"martin.chantal@codeboxx.biz" )
Employee.create(first_name:"Mathieu", last_name:"Houde", function:"Captain", phone:"roc-kets", email:"mathieu.houde@codeboxx.biz" )
Employee.create(first_name:"David", last_name:"Boutin", function:"Engineer", phone:"roc-kets", email:"david.boutin@codeboxx.biz" )
Employee.create(first_name:"Mathieu", last_name:"Lortie", function:"Engineer", phone:"roc-kets", email:"mathieu.lortiet@codeboxx.biz" )
Employee.create(first_name:"Thomas", last_name:"Carrier", function:"Engineer", phone:"roc-kets", email:"thomas.carriert@codeboxx.biz" )


# def employee
    # nicolas = ['nicolas.genest@codeboxx.biz','nicolas','Genest','Nicolas','CEO']
    # nadya = ['nadya.fortier@codeboxx.biz','nadya1','Fortier','Nadya','Director']
    # martin = ['martin.chantal@codeboxx.biz','martin','Chantal','Martin','Director Assistant']
    # mathieuH = ['mathieu.houde@codeboxx.biz','mathieu','Houde','Mathieu','Captain']
    # david = ['david.boutin@codeboxx.biz','david1','Boutin','David','Engineer']
    # mathieuL = ['mathieu.lortie@codeboxx.biz','mathieu','Lortie','Mathieu','Engineer']
    # thomas = ['thomas.carrier@codeboxx.biz','thomas','Carrier','Thomas','Engineer']
    # 
    # list_ = [nicolas, nadya, martin, mathieuH, david, mathieuL, thomas]
    # 
    # for user in list_ do
        # user_ = User.new
        # user_.email = user[0]
        # user_.password = user[1]
        # user_.add_role :employee
        # employee = Employee.new
        # employee.last_name = user[2]
        # employee.first_name = user[3]
        # employee.function = user[4]
        # user_.employee = employee   
        # user_.save!
    # end


thomas = Employee.last
puts(thomas)
thomas.build_user({email: thomas.email, password: '123456', password_confirmation: '123456', employee_id:})
puts(thomas.user)
thomas.save
# puts("saved")
# puts(User.all)
# , employee_id: Employee.id
# thomas = Employee.last
# puts(thomas)
# thomas.build_user({email: thomas.email, password: '123456', password_confirmation: '123456', user_id: thomas.id})
# puts(thomas.user)
# thomas.save
# puts("saved")
# puts(User.all)




























# def employee
#     nicolas = ['nicolas.genest@codeboxx.biz','nicolas','Genest','Nicolas','CEO']
#     nadya = ['nadya.fortier@codeboxx.biz','nadya1','Fortier','Nadya','Director']
#     martin = ['martin.chantal@codeboxx.biz','martin','Chantal','Martin','Director Assistant']
#     mathieuH = ['mathieu.houde@codeboxx.biz','mathieu','Houde','Mathieu','Captain']
#     david = ['david.boutin@codeboxx.biz','david1','Boutin','David','Engineer']
#     mathieuL = ['mathieu.lortie@codeboxx.biz','mathieu','Lortie','Mathieu','Engineer']
#     thomas = ['thomas.carrier@codeboxx.biz','thomas','Carrier','Thomas','Engineer']
    
#     list_ = [nicolas, nadya, martin, mathieuH, david, mathieuL, thomas]
    
#     for user in list_ do
#         user_ = User.new
#         user_.email = user[0]
#         user_.password = user[1]
#         user_.user_id :employee
#         employee = Employee.new
#         employee.last_name = user[2]
#         employee.first_name = user[3]
#         employee.function = user[4]
#         user_.employee = employee   
#         user_.save!
#     end
# end


# how to generete random info from array
# puts "### Seeding Quotes ###"

#     pl = ["Standard", "Premium", "Excelium"]
# puts(pl.sample)
# puts(pl.sample)
# puts(pl.sample)
# puts(pl.sample)
# puts(pl.sample)
# puts(pl.sample)
# puts(pl.sample)
# puts(pl.sample)
# puts(pl.sample)
# puts(pl.sample)
# puts(pl.sample)
# puts(pl.sample)
# puts(pl.sample)
# puts(pl.sample)

100.times do
    # dateCreationUpdate = Faker::Date.between(from: '2017-09-23', to: '2020-09-25')
Quote.create(
            install_fees: Faker::Number.between(from: 500, to: 2000),
            total_price: Faker::Number.between(from: 50000, to: 200000),
            # product_line: Faker::Number.between(from: 1, to: 3),
            number_of_apartments: Faker::Number.between(from: 50, to: 200),
            number_of_floors: Faker::Number.between(from: 10, to: 70),
            number_of_basements: Faker::Number.between(from: 1, to: 10),
            number_of_companies: Faker::Number.between(from: 1, to: 5),
            number_of_parking: Faker::Number.between(from: 50, to: 200),
            maximum_occupancy: Faker::Number.between(from: 50, to: 200),
            business_hours: Faker::Number.between(from: 0, to: 24),
            number_of_elevators: Faker::Number.between(from: 1, to: 15),
            unit_price: Faker::Number.between(from: 11000, to: 15000),
            # priceElevator: Faker::Number.between(from: 100000, to: 200000),
            # updated_at: dateCreationUpdate,
            # created_at:dateCreationUpdate
    )
end
# Quote.create(install_fees:23, total_price:3434, number_of_apartments:3424, number_of_floors:2312, number_of_basements:67, number_of_companies:32423)


# product_line: Random.between(standard, Premium, Excelium ),


# puts "### Seeding Users ###"
# User.create!(email: 'nicolas.genest@codeboxx.biz', password: '123456', admin: true, employee_role: 0, user_role: 0)
# User.create!(email: 'nadya.fortier@codeboxx.biz', password: '123456', superadmin_role: 1, employee_role: 0, user_role: 0)
# User.create!(email: 'martin.chantal@codeboxx.biz', password: '123456', superadmin_role: 1, employee_role: 0, user_role: 0)
# User.create!(email: 'mathieu.houde@codeboxx.biz', password: '123456', superadmin_role: 1, employee_role: 0, user_role: 0)
# User.create!(email: 'david.boutin@codeboxx.biz', password: '123456', superadmin_role: 0, employee_role: 1, user_role: 0)
# User.create!(email: 'mathieu.lortie@codeboxx.biz', password: '123456', superadmin_role: 0, employee_role: 1, user_role: 0)
# User.create!(email: 'thomas.carrier@codeboxx.biz', password: '123456', superadmin_role: 0, employee_role: 1, user_role: 0)

# puts "### Seeding Employees ###"
# Employee.create!(firstName: 'Nicolas', lastName: 'Genest', title: "CEO", users_id: 1)
# Employee.create!(firstName: 'Nadya', lastName: 'Fortier', title: "Director", users_id: 2)
# Employee.create!(firstName: 'Martin', lastName: 'Chantal', title: "Director-Assistant", users_id: 3)
# Employee.create!(firstName: 'Mathieu', lastName: 'Houde', title: "Captain", users_id: 4)
# Employee.create!(firstName: 'David', lastName: 'Boutin', title: "Engineer", users_id: 5)
# Employee.create!(firstName: 'Mathieu', lastName: 'Lortie', title: "Engineer", users_id: 6)
# Employee.create!(firstName: 'Thomas', lastName: 'Carrier', title: "Engineer", users_id: 7)