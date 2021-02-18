
require 'faker'



Employee.create(first_name:"Nicolas", last_name:"genest", function:"CEO", phone:"roc-kets", email:"nicolas.genest@codeboxx.biz")
Employee.create(first_name:"Nadya", last_name:"Fortier", function:"Director", phone:"roc-kets", email:"nadya.fortier@codeboxx.biz" )
Employee.create(first_name:"Martin", last_name:"chantal", function:"Director Assistant", phone:"roc-kets", email:"martin.chantal@codeboxx.biz" )
Employee.create(first_name:"Mathieu", last_name:"Houde", function:"Captain", phone:"roc-kets", email:"mathieu.houde@codeboxx.biz" )
Employee.create(first_name:"David", last_name:"Boutin", function:"Engineer", phone:"roc-kets", email:"david.boutin@codeboxx.biz" )
Employee.create(first_name:"Mathieu", last_name:"Lortie", function:"Engineer", phone:"roc-kets", email:"mathieu.lortiet@codeboxx.biz" )
Employee.create(first_name:"Thomas", last_name:"Carrier", function:"Engineer", phone:"roc-kets", email:"thomas.carriert@codeboxx.biz" )
Employee.create(first_name:"Admin", last_name:"Admin", function:"Admin", phone:"roc-kets", email:"admin@admin.com" )
Employee.create(first_name:"Admin1", last_name:"Admin1", function:"Admin1", phone:"roc-kets", email:"admin1@admin1.com" )

Employee.all.each do |employee|
    user = User.new({
      email: employee.email,
      password: 123456,
      password_confirmation: 123456,
      admin: true})
    employee.user = user
    employee.save!

    puts(employee.first_name, employee.user_id)
    print
   end 
